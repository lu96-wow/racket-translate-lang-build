#lang racket/base
;; file-map.rkt — 文件翻译（保留缩进和空白）
;; (map-file-> src dst)  中文→英文
;; (map-file<- src dst)  英文→中文
;;
;; 原理：用 read-syntax 获取每个标识符的精确位置，
;;       只在该位置做字符串替换，不碰空白/注释/字符串。

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

;; 反转表 (EN→CN)
(define rev-id
  (for/hash ([(cn en) (in-hash all-id)]) (values en cn)))
(define rev-kw
  (for/hash ([(cn en) (in-hash all-kw)]) (values en cn)))

;; ============================================================
;; 核心：保留格式的翻译
;; ============================================================

;; 从语法树收集所有可翻译标识符的位置
(define (collect-replacements stx id-tbl kw-tbl)
  (define results '())
  (define (walk s)
    (cond
      [(and (syntax? s) (identifier? s))
       (define sym (syntax-e s))
       (define en (hash-ref id-tbl sym #f))
       (when (and en (syntax-position s) (syntax-span s))
         (set! results
           (cons (list (sub1 (syntax-position s))
                       (+ (sub1 (syntax-position s)) (syntax-span s))
                       (if (symbol? en) (symbol->string en) (format "~a" en)))
                 results)))]
      [(and (syntax? s) (keyword? (syntax-e s)))
       (define kw (syntax-e s))
       (define en (hash-ref kw-tbl kw #f))
       (when (and en (syntax-position s) (syntax-span s))
         (define en-str (if (keyword? en)
                            (format "#:~a" (keyword->string en))
                            (format "~a" en)))
         (set! results
           (cons (list (sub1 (syntax-position s))
                       (+ (sub1 (syntax-position s)) (syntax-span s))
                       en-str)
                 results)))]
      [(syntax? s)
       (define d (syntax-e s))
       (cond
         [(pair? d) (walk (car d)) (walk (cdr d))]
         [(vector? d) (for ([e (in-vector d)]) (walk e))]
         [(box? d) (walk (unbox d))])]))
  (walk stx)
  results)

;; 对文本应用替换（从后往前，保留位置）
(define (apply-replacements text repls)
  (define sorted (sort repls > #:key car))
  (for/fold ([s text]) ([r (in-list sorted)])
    (string-append (substring s 0 (car r))
                   (caddr r)
                   (substring s (cadr r)))))

;; 翻译文件
(define (translate-file src dst id-tbl kw-tbl)
  (define text (file->string src))
  (define in (open-input-string text))
  (port-count-lines! in)
  ;; 跳过 #lang 行（保留原样）
  (define first-line (read-line in))
  (when (eof-object? first-line)
    (error "empty file"))
  ;; 读取所有表达式，收集替换位置
  (define all-repls '())
  (let loop ()
    (define stx
      (with-handlers ([exn:fail? (lambda (_) eof)])
        (read-syntax 'src in)))
    (unless (eof-object? stx)
      (set! all-repls (append (collect-replacements stx id-tbl kw-tbl)
                              all-repls))
      (loop)))
  ;; 应用替换并写入
  (define result (apply-replacements text all-repls))
  (call-with-output-file dst #:exists 'replace
    (lambda (out) (display result out))))

;; --- API ---
(define (map-file-> src dst) (translate-file src dst all-id all-kw))
(define (map-file<- src dst) (translate-file src dst rev-id rev-kw))
