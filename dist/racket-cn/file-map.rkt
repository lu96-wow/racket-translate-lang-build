#lang racket/base
;; file-map.rkt — 文件翻译（保留缩进和空白）
;; (map-file-> src dst)  中文→英文
;; (map-file<- src dst)  英文→中文
;;
;; 原理：逐字符读取，识别 token 类型，只翻译标识符/关键字，
;;       空白/换行/注释/字符串 原样保留。

(require racket/file racket/path racket/string)
(provide map-file-> map-file<-)

;; tables/ 目录
(define tables-root
  (let* ([mpi (variable-reference->module-path-index (#%variable-reference))]
         [rmp (module-path-index-resolve mpi)]
         [f   (resolved-module-path-name rmp)]
         [s   (if (path? f) (path->string f)
                  (if (pair? f) (path->string (car f)) f))]
         [i   (let loop ([i (sub1 (string-length s))])
                (if (char=? (string-ref s i) #\/) i (loop (sub1 i))))])
    (string-append (substring s 0 i) "/tables")))

;; 加载所有表
(define all-id (make-hash))
(define all-kw (make-hash))

(let walk ([dir (string->path tables-root)])
  (when (directory-exists? dir)
    (for ([f (in-list (directory-list dir))])
      (define full (build-path dir f))
      (cond
        [(and (file-exists? full)
              (regexp-match #rx"[.]rktd$" (path->string f)))
         (with-handlers ([exn:fail? (lambda (_) (void))])
           (call-with-input-file full
             (lambda (in)
               (define id (read in))
               (define kw (read in))
               (when (hash? id)
                 (for ([(k v) (in-hash id)]) (hash-set! all-id k v)))
               (when (hash? kw)
                 (for ([(k v) (in-hash kw)]) (hash-set! all-kw k v))))))]
        [(directory-exists? full)
         (walk full)]))))

;; 反转表
(define rev-id (for/hash ([(cn en) (in-hash all-id)]) (values en cn)))
(define rev-kw (for/hash ([(cn en) (in-hash all-kw)]) (values en cn)))

;; ============================================================
;; 定界符判断
;; ============================================================
(define (delimiter? c)
  (or (char-whitespace? c)
      (memq c '(#\( #\) #\[ #\] #\{ #\} #\, #\` #\;))))

;; ============================================================
;; 逐字符扫描 + 翻译
;; ============================================================
(define (translate-file src dst id-tbl kw-tbl)
  (define text (file->string src))
  (define len (string-length text))
  (define out (open-output-string))

  ;; 读取一个 token（直到定界符）
  (define (read-token i)
    (let loop ([j i])
      (if (or (>= j len) (delimiter? (string-ref text j)))
          (values (substring text i j) j)
          (loop (add1 j)))))

  ;; 复制字符串字面量（处理转义）
  (define (copy-string i)
    (write-char #\" out)
    (let loop ([j (add1 i)])
      (cond
        [(>= j len) j]
        [(char=? (string-ref text j) #\\)  ;; 转义
         (write-char #\\ out)
         (when (< (add1 j) len)
           (write-char (string-ref text (add1 j)) out))
         (loop (+ j 2))]
        [(char=? (string-ref text j) #\")  ;; 结束
         (write-char #\" out)
         (add1 j)]
        [else
         (write-char (string-ref text j) out)
         (loop (add1 j))])))

  ;; 复制行注释
  (define (copy-line-comment i)
    (let loop ([j i])
      (cond
        [(>= j len) j]
        [(char=? (string-ref text j) #\newline)
         (write-char #\newline out)
         (add1 j)]
        [else
         (write-char (string-ref text j) out)
         (loop (add1 j))])))

  ;; 复制块注释 #| ... |#
  (define (copy-block-comment i)
    (display "#|" out)
    (let loop ([j (+ i 2)] [depth 1])
      (cond
        [(>= j len) j]
        [(and (char=? (string-ref text j) #\|)
              (< (add1 j) len)
              (char=? (string-ref text (add1 j)) #\#))
         (display "|#" out)
         (if (<= depth 1) (+ j 2) (loop (+ j 2) (sub1 depth)))]
        [(and (char=? (string-ref text j) #\#)
              (< (add1 j) len)
              (char=? (string-ref text (add1 j)) #\|))
         (display "#|" out)
         (loop (+ j 2) (add1 depth))]
        [else
         (write-char (string-ref text j) out)
         (loop (add1 j) depth)])))

  ;; 主循环
  (let loop ([i 0])
    (when (< i len)
      (define c (string-ref text i))
      (cond
        ;; 空白（含换行、空格、tab）→ 原样保留
        [(char-whitespace? c)
         (write-char c out)
         (loop (add1 i))]

        ;; 行注释
        [(char=? c #\;)
         (loop (copy-line-comment i))]

        ;; 字符串字面量
        [(char=? c #\")
         (loop (copy-string i))]

        ;; 括号 / 反引号 / 逗号 → 原样
        [(memq c '(#\( #\) #\[ #\] #\{ #\} #\` #\,))
         (write-char c out)
         (loop (add1 i))]

        ;; 引号
        [(char=? c #\')
         (write-char c out)
         (loop (add1 i))]

        ;; #: 关键字
        [(and (char=? c #\#)
              (< (add1 i) len)
              (char=? (string-ref text (add1 i)) #\:))
         (define-values (kw-str end) (read-token (+ i 2)))
         (define kw (string->keyword kw-str))
         (define en (hash-ref kw-tbl kw #f))
         (if en
             (display (if (keyword? en)
                          (format "#:~a" (keyword->string en))
                          (format "~a" en))
                      out)
             (begin (display "#:" out) (display kw-str out)))
         (loop end)]

        ;; #| 块注释
        [(and (char=? c #\#)
              (< (add1 i) len)
              (char=? (string-ref text (add1 i)) #\|))
         (loop (copy-block-comment i))]

        ;; 其他 # 前缀（#t #f #rx #hash 等）→ 原样输出
        [(char=? c #\#)
         (define-values (token end) (read-token i))
         (display token out)
         (loop end)]

        ;; 普通 token → 查表翻译
        [else
         (define-values (token end) (read-token i))
         (define sym (string->symbol token))
         (define en (hash-ref id-tbl sym #f))
         (if en
             (display (if (symbol? en) (symbol->string en) (format "~a" en)) out)
             (display token out))
         (loop end)])))

  (call-with-output-file dst #:exists 'replace
    (lambda (p) (display (get-output-string out) p))))

;; --- API ---
(define (map-file-> src dst) (translate-file src dst all-id all-kw))
(define (map-file<- src dst) (translate-file src dst rev-id rev-kw))
