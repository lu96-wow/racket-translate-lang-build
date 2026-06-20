#lang racket/base
(require racket/cmdline racket/file racket/path
         racket/string racket/list scribble/blueboxes)

(provide extract-kw-enum-values)

(define (try-fetch sym lib-path)
  (with-handlers ([exn:fail? (lambda (_) #f)])
    (fetch-blueboxes-strs
      (list 'def (list (list 'lib lib-path) sym)))))

(define (find-source-lib sym mod-path)
  (with-handlers ([exn:fail? (lambda (_) #f)])
    (dynamic-require mod-path 0)
    (define-values (vals stxs) (module->exports mod-path))
    (for*/or ([group (list vals stxs)])
      (define phase0 (assv 0 group))
      (and phase0
           (for/or ([e (in-list (cdr phase0))])
             (and (eq? (car e) sym)
                  (for/or ([src (in-list (cdr e))])
                    (and (pair? src)
                         (with-handlers ([exn:fail? (lambda (_) #f)])
                           (define rmp (module-path-index-resolve (car src)))
                           (define name (resolved-module-path-name rmp))
                           (define full (if (path? name) (path->string name) ""))
                           (cond
                             [(regexp-match #rx"collects/(.+)$" full) => cadr]
                             [(regexp-match #rx"pkgs/[^/]+/(.+)$" full) => cadr]
                             [(regexp-match #rx"([^/]+/[^/]+[.]rkt)$" full) => cadr]
                             [else #f]))))))))))

(define (get-blueboxes sym mod-path)
  (define coll (car (regexp-split #rx"/" (symbol->string mod-path))))
  (or (try-fetch sym (format "~a.rkt" mod-path))
      (let ([src (find-source-lib sym mod-path)])
        (and src
             (or (try-fetch sym src)
                 (and (not (string-prefix? src (string-append coll "/")))
                      (try-fetch sym (format "~a/~a" coll src))))))))

(define (parse-kw-enums bb-lines keywords)
  (define (norm s) (string-replace s "\u00A0" " "))
  (define kw->param (make-hash))
  (for ([line (in-list bb-lines)])
    (define m (regexp-match #px"#:(\\S+)\\s+(\\S+)" (norm line)))
    (when m (hash-set! kw->param (string->keyword (cadr m)) (caddr m))))
  (define full-text (norm (string-join bb-lines " ")))
  (define result (make-hash))
  (for ([kw (in-list keywords)])
    (define param (hash-ref kw->param kw #f))
    (when param
      (define pat (pregexp (format "~a\\s*:\\s*\\(or/c\\s+([^)]+)\\)"
                                   (regexp-quote param))))
      (define m (regexp-match pat full-text))
      (when m
        (define syms (regexp-match* #rx"'([a-zA-Z][a-zA-Z0-9/+*-]*)"
                                    (cadr m) #:match-select cadr))
        (when (pair? syms)
          (hash-set! result kw (remove-duplicates (map string->symbol syms)))))))
  result)

(define (extract-kw-enum-values mod-path kw-list)
  (define coll (car (regexp-split #rx"/" (symbol->string mod-path))))
  (define result (make-hash))
  (for ([entry (in-list kw-list)])
    (define sym (car entry))
    (define kws (cdr entry))
    (define bb (get-blueboxes sym mod-path))
    (when (and bb (list? bb))
      (define enums (parse-kw-enums bb kws))
      (for ([(kw vals) (in-hash enums)])
        (define existing (hash-ref result kw '()))
        (hash-set! result kw (remove-duplicates (append existing vals))))))
  (make-immutable-hash (hash->list result)))

(define (write-kw-vals-to-map! full kw-val-result)
  (define content (file->string full))
  ;; 已有则跳过
  (when (string-contains? content "(define kw-value-map")
    (void))
  (unless (string-contains? content "(define kw-value-map")
    ;; provide 加 kw-value-map
    (define updated
      (if (string-contains? content "kw-value-map")
          content
          (string-replace content "re-exports)" "kw-value-map re-exports)")))
    ;; 构建 kw-value-map 定义
    (define buf (open-output-string))
    (fprintf buf "~n;; kw-value-map (~a keywords)~n" (hash-count kw-val-result))
    (fprintf buf "(define kw-value-map (hash~n")
    (for ([kw (in-list (sort (hash-keys kw-val-result) keyword<?))])
      (define vals (hash-ref kw-val-result kw))
      (fprintf buf "  '~a (hash" kw)
      (for ([v (in-list (sort vals symbol<?))])
        (fprintf buf " '~a #f" v))
      (fprintf buf ")~n"))
    (fprintf buf "))~n")
    (display-to-file (string-append updated (get-output-string buf))
                     full #:exists 'replace)))

(define (process-maps maps-dir)
  (define total-kws 0)
  (define total-vals 0)
  (define (walk dir)
    (when (directory-exists? dir)
      (for ([f (in-list (sort (directory-list dir) path<?))])
        (define full (build-path dir f))
        (define fname (path->string f))
        (cond
          [(and (regexp-match #rx"[.]rkt$" fname)
                (not (regexp-match #rx"[.]rktd$" fname))
                (not (string-prefix? fname ".")))
           (define mod-path
             (with-handlers ([exn:fail? (lambda (_) #f)])
               (define first-line (car (file->lines full)))
               (define m (regexp-match #px"^;; ([^ ]+)" first-line))
               (and m (string->symbol (cadr m)))))
           (when mod-path
             (define kw
               (with-handlers ([exn:fail? (lambda (_) (hash))])
                 (dynamic-require full 'kw-map)))
             (when (and (hash? kw) (positive? (hash-count kw)))
               (define kw-val-result (make-hash))
               (for ([(en val) (in-hash kw)])
                 (when (pair? val)
                   (define kws (if (hash? (cdr val)) (hash-keys (cdr val)) '()))
                   (when (pair? kws)
                     (set! total-kws (add1 total-kws))
                     (define bb (get-blueboxes en mod-path))
                     (when (and bb (list? bb))
                       (define enums (parse-kw-enums bb kws))
                       (for ([(kw vals) (in-hash enums)])
                         (hash-set! kw-val-result kw vals))))))
               (when (positive? (hash-count kw-val-result))
                 (set! total-vals (+ total-vals (hash-count kw-val-result)))
                 (write-kw-vals-to-map! full kw-val-result)
                 (printf "  ~a: ~a keywords with enum values~n"
                         mod-path (hash-count kw-val-result)))))]
          [(and (directory-exists? full)
                (not (string-prefix? fname ".")))
           (walk full)]))))
  (walk maps-dir)
  (values total-kws total-vals))

(module+ main
  (define maps-dir (make-parameter #f))
  (command-line
   #:once-each
   ["--maps-dir" dir "Maps directory" (maps-dir dir)]
   #:args () (void))
  (unless (maps-dir)
    (printf "Usage: racket tools/collect-kw-vals/main.rkt --maps-dir DIR~n")
    (exit 1))
  (printf "=== collect-kw-vals ===~n")
  (printf "Scanning ~a ...~n" (maps-dir))
  (define-values (total-kws total-vals) (process-maps (maps-dir)))
  (printf "~nDone: ~a kw functions scanned, ~a keywords with enum values~n"
          total-kws total-vals))
