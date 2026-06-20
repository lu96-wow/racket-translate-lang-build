#lang racket/base
;; search-map.rkt — 翻译查询
;; (map-> cn)  → en-symbol | #f   中文→英文
;; (map<- en)  → cn-string  | #f   英文→中文

(require racket/file racket/path)
(provide map-> map<-)

;; tables/ 目录
(define tables-root
  (let* ([mpi (variable-reference->module-path-index (#%variable-reference))]
         [rmp (module-path-index-resolve mpi)]
         [f   (resolved-module-path-name rmp)]
         [s   (if (path? f) (path->string f)
                  (if (pair? f) (path->string (car f)) f))]
         [i   (let loop ([i (sub1 (string-length s))])
                (if (char=? (string-ref s i) #\/) i (loop (sub1 i))))])
    (string-append (substring s 0 i) "/~TABLES-PATH~")))

;; 加载所有 .rktd，合并为一张表
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
                 (for ([(k v) (in-hash id)])
                   (hash-set! all-id k v)))
               (when (hash? kw)
                 (for ([(k v) (in-hash kw)])
                   (hash-set! all-kw k v))))))]
        [(directory-exists? full)
         (walk full)]))))

;; EN→CN 反转表
(define en->cn
  (for/hash ([(cn en) (in-hash all-id)])
    (values en (symbol->string cn))))

;; --- API ---
(define (map-> cn)
  (define s (cond [(string? cn) (string->symbol cn)]
                  [(symbol? cn) cn]
                  [else (error "map->: expected string or symbol")]))
  (hash-ref all-id s #f))

(define (map<- en)
  (define s (cond [(string? en) (string->symbol en)]
                  [(symbol? en) en]
                  [else (error "map<-: expected string or symbol")]))
  (hash-ref en->cn s #f))
