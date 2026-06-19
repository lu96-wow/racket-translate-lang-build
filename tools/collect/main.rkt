#lang racket/base
;; main.rkt — collect：扫描模块 → 生成去重 map 模板
;;
;; 纯工具，零硬编码。输入目录、输出目录、跳过规则全由调用方指定。
;;
;; 用法：
;;   # 扫描目录下所有 collection
;;   racket tools/collect/main.rkt --input-dir /usr/racket/collects --maps-dir maps/
;;
;;   # 扫描目录下指定 collection
;;   racket tools/collect/main.rkt --input-dir /usr/racket/collects -c racket -c net
;;
;;   # 扫描指定模块（通过 Racket 模块系统加载）
;;   racket tools/collect/main.rkt racket/base racket/list
;;
;; --skip 规则：
;;   不含 /  → 匹配文件名或目录名 (basename)，任意深度
;;   含 /    → 匹配从扫描根目录开始的相对路径

(require racket/cmdline
         racket/path
         racket/string
         racket/set
         "scan.rkt"
         "writer.rkt")

;; ============================================================
;; 跳过
;; ============================================================
(define skip-patterns (make-parameter (set)))

(define (should-skip? fname relative-path)
  (for/or ([pat (in-set (skip-patterns))])
    (if (string-contains? pat "/")
        (equal? pat relative-path)
        (equal? pat fname))))

;; ============================================================
;; process : symbol? path-string? -> void?
;; ============================================================
(define (process mod-path maps-dir)
  (with-handlers
    ([exn:fail?
      (lambda (e)
        (printf "~a: ERROR (~a)~n" mod-path (exn-message e)))])
    (printf "~a: " mod-path)
    (flush-output)
    (define-values (own-syms re-export-mods) (scan-module mod-path))
    (define-values (plain kw) (classify mod-path own-syms))
    (printf "~a own (~a plain, ~a kw) + ~a re-export modules~n"
            (length own-syms) (length plain) (length kw)
            (length re-export-mods))
    (write-template! mod-path plain kw re-export-mods maps-dir)))

;; ============================================================
;; process-collection : path? string? path-string? -> void?
;; ============================================================
(define (process-collection coll-dir mod-prefix maps-dir)
  (when (directory-exists? coll-dir)
    (for ([f (in-list (sort (directory-list coll-dir) path<?))])
      (define fname (path->string f))
      (define full  (build-path coll-dir f))
      (define rel   (format "~a/~a" mod-prefix fname))
      (cond
        [(should-skip? fname rel)
         (void)]
        [(regexp-match #rx"[.]rkt$" fname)
         (define mod
           (string->symbol
            (format "~a/~a" mod-prefix
                    (path->string (path-replace-suffix f #"")))))
         (process mod maps-dir)]
        [(and (directory-exists? full)
              (not (string-prefix? fname ".")))
         (process-collection full
                             (format "~a/~a" mod-prefix fname)
                             maps-dir)]))))

;; ============================================================
;; scan-input-dir : path-string? (listof string?) path-string? -> void?
;;
;; 扫描输入目录。每个顶层子目录视为一个 collection。
;; colls 为空则扫描全部，非空则只扫描指定的。
;; ============================================================
(define (scan-input-dir input-dir colls maps-dir)
  (unless (directory-exists? input-dir)
    (error 'collect "input directory not found: ~a" input-dir))
  (define all-dirs (sort (directory-list input-dir) path<?))
  (define targets
    (if (null? colls)
        all-dirs
        (filter (lambda (d) (member (path->string d) colls)) all-dirs)))
  (for ([coll (in-list targets)])
    (define coll-dir (build-path input-dir coll))
    (define coll-name (path->string coll))
    (when (and (directory-exists? coll-dir)
               (not (should-skip? coll-name coll-name)))
      (printf "=== ~a ===~n" coll-name)
      (process-collection coll-dir coll-name maps-dir))))

;; ============================================================
;; CLI
;; ============================================================
(module+ main
  (define maps-dir    (make-parameter "maps"))
  (define input-dir   (make-parameter #f))
  (define collections (make-parameter '()))
  (command-line
   #:once-each
   ["--input-dir"   dir "Root directory to scan (each subdir = collection)" (input-dir dir)]
   ["--maps-dir"    dir "Output directory (default: maps/)"                 (maps-dir dir)]
   #:multi
   ["-c"            name "Only scan these collections (requires --input-dir)"
    (collections (append (collections) (list name)))]
   ["--skip"        pattern "Skip file/dir (no /: basename, has /: relative path)"
    (skip-patterns (set-add (skip-patterns) pattern))]
   #:args mod-names
   (cond
     ;; 目录扫描模式
     [(input-dir)
      (printf "=== collect: ~a -> ~a ===~n" (input-dir) (maps-dir))
      (scan-input-dir (input-dir) (collections) (maps-dir))]
     ;; 指定模块模式
     [(pair? mod-names)
      (printf "=== collect -> ~a ===~n" (maps-dir))
      (for ([m (in-list mod-names)])
        (process (string->symbol m) (maps-dir)))]
     [else
      (printf "Usage:~n")
      (printf "  racket tools/collect/main.rkt --input-dir DIR --maps-dir DIR~n")
      (printf "  racket tools/collect/main.rkt --input-dir DIR -c racket -c net~n")
      (printf "  racket tools/collect/main.rkt racket/base racket/list~n")
      (printf "Options:~n")
      (printf "  --skip pattern    skip by basename (no /) or relative path (has /)~n")])))
