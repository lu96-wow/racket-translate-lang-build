#lang racket/base
;; file-map.rkt — 文件翻译（保留缩进和空白）
;; (map-file-> src dst)  中文→英文  #lang 自动转换
;; (map-file<- src dst)  英文→中文  #lang 自动转换

(require racket/file racket/path racket/string)
(provide map-file-> map-file<-)

;; 构建时填充的配置
(define lang-name "~LANG-NAME~")
(define base-lang "~BASE-LANG~")

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
;; 定界符
;; ============================================================
(define (delimiter? c)
  (or (char-whitespace? c)
      (memq c '(#\( #\) #\[ #\] #\{ #\} #\, #\` #\;))))

;; ============================================================
;; 逐字符扫描 + 翻译
;; ============================================================
(define (translate-file src dst id-tbl kw-tbl src-lang dst-lang)
  (define text (file->string src))
  (define len (string-length text))
  (define out (open-output-string))

  ;; 读取 token
  (define (read-token i)
    (let loop ([j i])
      (if (or (>= j len) (delimiter? (string-ref text j)))
          (values (substring text i j) j)
          (loop (add1 j)))))

  ;; 复制字符串字面量
  (define (copy-string i)
    (write-char #\" out)
    (let loop ([j (add1 i)])
      (cond
        [(>= j len) j]
        [(char=? (string-ref text j) #\\)
         (write-char #\\ out)
         (when (< (add1 j) len)
           (write-char (string-ref text (add1 j)) out))
         (loop (+ j 2))]
        [(char=? (string-ref text j) #\")
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

  ;; 复制块注释
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

  ;; --- #lang 行处理 ---
  (define first-nl
    (let loop ([j 0])
      (cond [(>= j len) len]
            [(char=? (string-ref text j) #\newline) j]
            [else (loop (add1 j))])))
  (define first-line (substring text 0 first-nl))
  ;; 转换 #lang 行
  (cond
    [(and (string-prefix? first-line "#lang ")
          (equal? (string-trim (substring first-line 6)) src-lang))
     (fprintf out "#lang ~a" dst-lang)]
    [else
     (display first-line out)])
  (when (< first-nl len)
    (write-char #\newline out))

  ;; --- 主循环（从第二行开始） ---
  (let loop ([i (if (< first-nl len) (add1 first-nl) first-nl)])
    (when (< i len)
      (define c (string-ref text i))
      (cond
        [(char-whitespace? c)
         (write-char c out)
         (loop (add1 i))]
        [(char=? c #\;)
         (loop (copy-line-comment i))]
        [(char=? c #\")
         (loop (copy-string i))]
        [(memq c '(#\( #\) #\[ #\] #\{ #\} #\` #\,))
         (write-char c out)
         (loop (add1 i))]
        [(char=? c #\')
         (write-char c out)
         (loop (add1 i))]
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
        [(and (char=? c #\#)
              (< (add1 i) len)
              (char=? (string-ref text (add1 i)) #\|))
         (loop (copy-block-comment i))]
        [(char=? c #\#)
         (define-values (token end) (read-token i))
         (display token out)
         (loop end)]
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
(define (map-file-> src dst)
  (translate-file src dst all-id all-kw lang-name base-lang))
(define (map-file<- src dst)
  (translate-file src dst rev-id rev-kw base-lang lang-name))
