#lang racket/base
;; build/main.rkt — 从翻译 maps 构建语言包
;;
;; 用法：
;;   racket tools/build/main.rkt \
;;     --lang racket-cn \
;;     --maps-dir racket-maps/ \
;;     --output-dir dist/racket-cn/ \
;;     --preload racket/main \
;;     --base-lang racket
;;
;; 生成：
;;   output-dir/
;;     tables/         .rktd 翻译表（与模块目录同构）
;;     main.rkt        #lang reader
;;     info.rkt        包信息

(require racket/cmdline racket/file racket/path
         racket/string racket/list)

;; ============================================================
;; Step 1: maps -> tables (.rktd)
;; ============================================================

;; 从 plain-map、kw-map、kw-value-map 构建 id-table 和 kw-table
(define (build-tables plain kw kw-value-map)
  (define id-table (make-hash))
  (define kw-table (make-hash))
  ;; plain: 'define -> "定义" ==> '定义 -> 'define
  (for ([(en cn) (in-hash plain)] #:when (and cn (string? cn)))
    (hash-set! id-table (string->symbol cn) en))
  ;; kw: 'open-output-file -> (cons "打开输出文件" (hash '#:exists "如果存在" ...))
  (for ([(en val) (in-hash kw)])
    (when (and (pair? val) (car val) (string? (car val)))
      ;; 函数名
      (hash-set! id-table (string->symbol (car val)) en)
      ;; 关键字参数
      (when (hash? (cdr val))
        (for ([(en-kw cn-kw) (in-hash (cdr val))] #:when (and cn-kw (string? cn-kw)))
          (define cn-keyword
            (string->keyword
             (if (string-prefix? cn-kw "#:") (substring cn-kw 2) cn-kw)))
          (hash-set! kw-table cn-keyword en-kw)))))
  ;; kw-value-map: '#:exists (hash 'append "追加" ...) ==> '追加 -> 'append
  (when (hash? kw-value-map)
    (for ([(kw vals-hash) (in-hash kw-value-map)])
      (when (hash? vals-hash)
        (for ([(en-val cn-val) (in-hash vals-hash)] #:when (and cn-val (string? cn-val)))
          (hash-set! id-table (string->symbol cn-val) en-val)))))
  (values (make-immutable-hash (hash->list id-table))
          (make-immutable-hash (hash->list kw-table))))

;; 写 .rktd 数据文件
(define (write-rktd! path id-table kw-table re-exports)
  (define parent (path-only path))
  (when parent (make-directory* parent))
  (call-with-output-file path #:exists 'replace
    (lambda (out)
      (write id-table out) (newline out)
      (write kw-table out) (newline out)
      (write re-exports out) (newline out))))

;; 遍历 maps 目录，生成 tables
(define (build-all-tables maps-dir tables-dir)
  (define count 0)
  (define total-ids 0)
  (define (walk dir)
    (when (directory-exists? dir)
      (for ([f (in-list (sort (directory-list dir) path<?))])
        (define full (build-path dir f))
        (define fname (path->string f))
        (cond
          [(and (regexp-match #rx"[.]rkt$" fname)
                (not (regexp-match #rx"[.]rktd$" fname))
                (not (string-prefix? fname ".")))
           (with-handlers ([exn:fail? (lambda (e)
             (printf "  skip ~a: ~a~n" fname (exn-message e)))])
             ;; 提取模块路径
             (define mod-path
               (let ([first-line (car (file->lines full))])
                 (define m (regexp-match #px"^;; ([^ ]+)" first-line))
                 (and m (cadr m))))
             (when mod-path
               ;; 加载 map
               (define plain
                 (with-handlers ([exn:fail? (lambda (_) (hash))])
                   (dynamic-require full 'plain-map)))
               (define kw
                 (with-handlers ([exn:fail? (lambda (_) (hash))])
                   (dynamic-require full 'kw-map)))
               (define re-exports
                 (with-handlers ([exn:fail? (lambda (_) '())])
                   (dynamic-require full 're-exports)))
                (define kw-value-map
                  (with-handlers ([exn:fail? (lambda (_) (hash))])
                    (dynamic-require full (quote kw-value-map))))
               ;; 构建表
               (define-values (id-table kw-table)
                 (build-tables
                  (if (hash? plain) plain (hash))
                  (if (hash? kw) kw (hash))
                   (if (hash? kw-value-map) kw-value-map (hash))))
               ;; 写 .rktd
               (define out-path
                 (build-path tables-dir (string-append mod-path ".rktd")))
               (write-rktd! out-path id-table kw-table
                            (if (list? re-exports) re-exports '()))
               (set! count (add1 count))
               (set! total-ids (+ total-ids (hash-count id-table)))
               (printf "  ~a (~a ids, ~a kws, ~a deps)~n"
                       mod-path
                       (hash-count id-table)
                       (hash-count kw-table)
                       (length (if (list? re-exports) re-exports '())))))]
          [(and (directory-exists? full)
                (not (string-prefix? fname ".")))
           (walk full)]))))
  (walk maps-dir)
  (printf "  ~a tables, ~a total ids~n" count total-ids))

;; ============================================================
;; Step 2: 生成 reader
;; ============================================================

;; 模板目录：相对于本文件
(define templates-dir
  (let ([here (path-only (path->complete-path
                (syntax-source (quote-syntax here))))])
    (build-path here "templates")))

(define (generate-reader! output-dir base-lang preload-mod)
  (define tmpl (file->string (build-path templates-dir "reader.rkt")))
  (define code
    (string-replace
     (string-replace tmpl "~BASE-LANG~" base-lang)
     "~PRELOAD~" preload-mod))
  (define out-path (build-path output-dir "main.rkt"))
  (display-to-file code out-path #:exists 'replace)
  (printf "  -> main.rkt (base-lang: ~a, preload: ~a)~n" base-lang preload-mod))

;; 复制并替换模板占位符
(define (apply-template! name output-dir vars)
  (define tmpl (file->string (build-path templates-dir name)))
  (define result
    (for/fold ([s tmpl]) ([(k v) (in-hash vars)])
      (string-replace s k v)))
  (display-to-file result (build-path output-dir name) #:exists 'replace)
  (printf "  -> ~a~n" name))

;; ============================================================
;; Step 3: 生成 info.rkt
;; ============================================================

(define (generate-info! output-dir lang-name)
  (define out-path (build-path output-dir "info.rkt"))
  (display-to-file
   (format "#lang info~n(define collection ~s)~n(define version \"0.1.0\")~n" lang-name)
   out-path #:exists 'replace)
  (printf "  -> info.rkt~n"))

;; ============================================================
;; CLI
;; ============================================================
(module+ main
  (define lang-name   (make-parameter #f))
  (define maps-dir    (make-parameter #f))
  (define output-dir  (make-parameter #f))
  (define preload-mod (make-parameter #f))
  (define base-lang   (make-parameter #f))
  (command-line
   #:once-each
   ["--lang"       name "Language package name (e.g. racket-cn)"  (lang-name name)]
   ["--maps-dir"   dir  "Translated maps directory"               (maps-dir dir)]
   ["--output-dir" dir  "Output package directory"                (output-dir dir)]
   ["--preload"    mod  "Default table to preload (default: racket/main)"
    (preload-mod mod)]
   ["--base-lang"  lang "Underlying language (default: racket)"
    (base-lang lang)]
   #:args () (void))

  (unless (and (lang-name) (maps-dir) (output-dir) (preload-mod) (base-lang))
    (printf "Usage: racket tools/build/main.rkt \\~n")
    (printf "  --lang NAME --maps-dir DIR --output-dir DIR \\~n")
    (printf "  --preload MOD --base-lang LANG~n")
    (exit 1))

  (define tables-dir (build-path (output-dir) "tables"))
  (make-directory* tables-dir)
  (make-directory* (output-dir))

  (printf "=== build ~a ===~n" (lang-name))
  (printf "maps:   ~a~n" (maps-dir))
  (printf "output: ~a~n~n" (output-dir))

  ;; Step 1: tables
  (printf "Building tables...~n")
  (build-all-tables (maps-dir) tables-dir)

  ;; Step 2: reader + utilities
  (printf "~nGenerating files...~n")
  (generate-reader! (output-dir) (base-lang) (preload-mod))
  (apply-template! "search-map.rkt" (output-dir) (hash))
  (apply-template! "file-map.rkt" (output-dir)
    (hash "~LANG-NAME~" (lang-name) "~BASE-LANG~" (base-lang)))

  ;; Step 3: info
  (generate-info! (output-dir) (lang-name))

  (printf "~nDone.~n"))
