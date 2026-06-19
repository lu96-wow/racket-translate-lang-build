#lang racket/base
;; migrate-translations.rkt — 将旧 maps 的翻译迁移到新 maps
;;
;; 用法：
;;   racket scripts/migrate-translations.rkt --old maps/ --new racket-maps/
;;
;; 原理：
;;   1. 从旧 maps 加载所有翻译 → 全局查找表
;;   2. 遍历新 maps，把 #f 替换为旧翻译
;;   3. 覆写新文件

(require racket/cmdline racket/file racket/path
         racket/string racket/list)

;; ============================================================
;; Step 1: 加载旧翻译
;; ============================================================

(define (load-old-translations old-dir)
  (define plain-lookup (make-hash))  ;; symbol -> string
  (define kw-lookup    (make-hash))  ;; symbol -> (cons string hash)
  (define file-count 0)
  (define (walk dir)
    (when (directory-exists? dir)
      (for ([f (in-list (directory-list dir))])
        (define full (build-path dir f))
        (define fname (path->string f))
        (cond
          [(and (regexp-match #rx"[.]rkt$" fname)
                (not (string-prefix? fname ".")))
           (with-handlers ([exn:fail? (lambda (_) (void))])
             (define plain
               (with-handlers ([exn:fail? (lambda (_) (hash))])
                 (dynamic-require full 'plain-map)))
             (define kw
               (with-handlers ([exn:fail? (lambda (_) (hash))])
                 (dynamic-require full 'kw-map)))
             (when (hash? plain)
               (for ([(en cn) (in-hash plain)] #:when (and cn (string? cn)))
                 (hash-set! plain-lookup en cn)))
             (when (hash? kw)
               (for ([(en val) (in-hash kw)])
                 (when (and (pair? val) (car val) (string? (car val)))
                   (hash-set! kw-lookup en val)))))
           (set! file-count (add1 file-count))]
          [(and (directory-exists? full)
                (not (string-prefix? fname ".")))
           (walk full)]))))
  (walk old-dir)
  (printf "  ~a old files, ~a plain translations, ~a kw translations~n"
          file-count (hash-count plain-lookup) (hash-count kw-lookup))
  (values plain-lookup kw-lookup))

;; ============================================================
;; Step 2: 合并翻译并写回
;; ============================================================

(define (write-merged-map! mod-path plain kw re-exports file-path)
  (define has-p? (positive? (hash-count plain)))
  (define has-k? (positive? (hash-count kw)))
  (define prov-parts
    (filter values
            (list (and has-p? "plain-map")
                  (and has-k? "kw-map")
                  "re-exports")))
  (define buf (open-output-string))
  (fprintf buf ";; ~a~n" mod-path)
  (fprintf buf "#lang racket/base~n")
  (fprintf buf "(provide ~a)~n~n" (string-join prov-parts " "))
  ;; re-exports
  (fprintf buf ";; re-exports (~a)~n" (length re-exports))
  (cond
    [(null? re-exports)
     (fprintf buf "(define re-exports '())~n~n")]
    [else
     (fprintf buf "(define re-exports '(~n")
     (for ([d (in-list re-exports)])
       (fprintf buf "  ~s~n" d))
     (fprintf buf "))~n~n")])
  ;; plain-map
  (when has-p?
    (define translated (for/sum ([(k v) (in-hash plain)] #:when v) 1))
    (fprintf buf ";; plain (~a/~a translated)~n" translated (hash-count plain))
    (fprintf buf "(define plain-map (hash~n")
    (for ([s (in-list (sort (hash-keys plain) symbol<?))])
      (define cn (hash-ref plain s))
      (if cn
          (fprintf buf "  '~a  ~s~n" s cn)
          (fprintf buf "  '~a  #f~n" s)))
    (fprintf buf "))~n~n"))
  ;; kw-map
  (when has-k?
    (fprintf buf ";; with-kw (~a)~n" (hash-count kw))
    (fprintf buf "(define kw-map (hash~n")
    (for ([s (in-list (sort (hash-keys kw) symbol<?))])
      (define val (hash-ref kw s))
      (define cn-name (if (pair? val) (car val) #f))
      (define kw-hash (if (pair? val) (cdr val) (hash)))
      (if cn-name
          (fprintf buf "  '~a  (cons ~s (hash" s cn-name)
          (fprintf buf "  '~a  (cons #f (hash" s))
      (when (hash? kw-hash)
        (for ([k (in-list (sort (hash-keys kw-hash)
                                (lambda (a b) (keyword<? a b))))])
          (define kcn (hash-ref kw-hash k))
          (if kcn
              (fprintf buf " '~a ~s" k kcn)
              (fprintf buf " '~a #f" k))))
      (fprintf buf "))~n"))
    (fprintf buf "))~n"))
  ;; write
  (display-to-file (get-output-string buf) file-path #:exists 'replace))

(define (migrate-maps! new-dir plain-lookup kw-lookup)
  (define migrated 0)
  (define total 0)
  (define (walk dir)
    (when (directory-exists? dir)
      (for ([f (in-list (sort (directory-list dir) path<?))])
        (define full (build-path dir f))
        (define fname (path->string f))
        (cond
          [(and (regexp-match #rx"[.]rkt$" fname)
                (not (string-prefix? fname "."))
                (not (regexp-match #rx"[.]rktd$" fname)))
           ;; 提取模块名
           (define mod-path
             (with-handlers ([exn:fail? (lambda (_) #f)])
               (define first-line (car (file->lines full)))
               (define m (regexp-match #px"^;; ([^ ]+)" first-line))
               (and m (string->symbol (cadr m)))))
           (when mod-path
             (with-handlers ([exn:fail? (lambda (e)
               (printf "  skip ~a: ~a~n" mod-path (exn-message e)))])
               ;; 加载新 map
               (define plain
                 (with-handlers ([exn:fail? (lambda (_) (hash))])
                   (dynamic-require full 'plain-map)))
               (define kw
                 (with-handlers ([exn:fail? (lambda (_) (hash))])
                   (dynamic-require full 'kw-map)))
               (define re-exports
                 (with-handlers ([exn:fail? (lambda (_) '())])
                   (dynamic-require full 're-exports)))
               ;; 合并 plain
               (define merged-plain
                 (if (hash? plain)
                     (for/hash ([(en cn) (in-hash plain)])
                       (values en (or cn (hash-ref plain-lookup en #f))))
                     (hash)))
               ;; 合并 kw
               (define merged-kw
                 (if (hash? kw)
                     (for/hash ([(en val) (in-hash kw)])
                       (define old (hash-ref kw-lookup en #f))
                       (cond
                         ;; 旧翻译存在，新条目未翻译 → 用旧的
                         [(and old (pair? val) (not (car val)))
                          (values en old)]
                         ;; 新条目已有翻译 → 保留
                         [(and (pair? val) (car val))
                          (values en val)]
                         ;; 旧翻译存在 → 用旧的
                         [old (values en old)]
                         ;; 都没有 → 保留 #f
                         [else (values en val)]))
                     (hash)))
               ;; 写回
               (define old-count
                 (+ (for/sum ([(k v) (in-hash plain)] #:when v) 1)
                    (for/sum ([(k v) (in-hash kw)] #:when (and (pair? v) (car v))) 1)))
               (define new-count
                 (+ (for/sum ([(k v) (in-hash merged-plain)] #:when v) 1)
                    (for/sum ([(k v) (in-hash merged-kw)] #:when (and (pair? v) (car v))) 1)))
               (define gained (- new-count old-count))
               (when (positive? gained)
                 (set! migrated (+ migrated gained)))
               (set! total (+ total (hash-count merged-plain) (hash-count merged-kw)))
               (write-merged-map! mod-path merged-plain merged-kw
                                  (if (list? re-exports) re-exports '())
                                  full)
               (when (positive? gained)
                 (printf "  ~a: +~a translations~n" mod-path gained))))]
          [(and (directory-exists? full)
                (not (string-prefix? fname ".")))
           (walk full)]))))
  (walk new-dir)
  (values total migrated))

;; ============================================================
;; CLI
;; ============================================================
(module+ main
  (define old-dir (make-parameter #f))
  (define new-dir (make-parameter #f))
  (command-line
   #:once-each
   ["--old" dir "Old maps directory" (old-dir dir)]
   ["--new" dir "New maps directory" (new-dir dir)]
   #:args () (void))
  (unless (and (old-dir) (new-dir))
    (printf "Usage: racket scripts/migrate-translations.rkt --old maps/ --new racket-maps/~n")
    (exit 1))
  (printf "=== migrate translations ===~n")
  (printf "Old: ~a~n" (old-dir))
  (printf "New: ~a~n~n" (new-dir))
  (printf "Loading old translations...~n")
  (define-values (plain-lookup kw-lookup)
    (load-old-translations (old-dir)))
  (printf "~nMigrating...~n")
  (define-values (total migrated)
    (migrate-maps! (new-dir) plain-lookup kw-lookup))
  (printf "~nDone: ~a total entries, +~a translations migrated~n" total migrated))
