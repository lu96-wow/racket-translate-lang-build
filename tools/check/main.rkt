#lang racket/base
;; check/main.rkt — 翻译校验工具
;;
;; 用法：
;;   racket tools/check/main.rkt --maps-dir maps/
;;   racket tools/check/main.rkt --maps-dir maps/ --report-dir reports/
;;
;; 三个检查：
;;   1. missing      — map 中缺失的符号（与 scan-module 对比）
;;   2. conflict-cn  — 不同 EN 符号 → 同一 CN（读取器歧义）
;;   3. conflict-en  — 同一 EN 符号 → 不同 CN（跨文件不一致）
;;
;; 输出三个 .rktd 文件，括号数据格式。

(require racket/list racket/file racket/string racket/path racket/cmdline
         "../collect/scan.rkt")

;; ============================================================
;; 读取 maps
;; ============================================================

;; 从 map 文件首行注释提取模块路径
;; ";; racket/list" -> racket/list
(define (extract-mod-path file-path)
  (with-handlers ([exn:fail? (lambda (_) #f)])
    (define first-line (car (file->lines file-path)))
    (define m (regexp-match #px"^;; ([^ ]+)" first-line))
    (and m (string->symbol (cadr m)))))

;; 加载单个 map 文件
(define (load-map file-path)
  (define plain
    (with-handlers ([exn:fail? (lambda (_) (hash))])
      (dynamic-require file-path 'plain-map)))
  (define kw
    (with-handlers ([exn:fail? (lambda (_) (hash))])
      (dynamic-require file-path 'kw-map)))
  (values (if (hash? plain) plain (hash))
          (if (hash? kw) kw (hash))))

;; 递归扫描 maps 目录
;; 返回 (listof (list mod-path plain-hash kw-hash file-path))
(define (scan-maps-dir maps-dir)
  (define results '())
  (define (walk dir)
    (when (directory-exists? dir)
      (for ([f (in-list (sort (directory-list dir) path<?))])
        (define full (build-path dir f))
        (define fname (path->string f))
        (cond
          [(and (regexp-match #rx"[.]rkt$" fname)
                (not (string-prefix? fname ".")))
           (define mod-path (extract-mod-path full))
           (when mod-path
             (with-handlers ([exn:fail? (lambda (e)
               (printf "  skip ~a: ~a~n" fname (exn-message e)))])
               (define-values (plain kw) (load-map full))
               (set! results
                 (cons (list mod-path plain kw full) results))))]
          [(and (directory-exists? full)
                (not (member fname '("compiled" "check-reports")))
                (not (string-prefix? fname ".")))
           (walk full)]))))
  (walk maps-dir)
  (reverse results))

;; ============================================================
;; 提取所有翻译对
;; ============================================================

;; 返回 (listof (list en cn mod-path))
(define (collect-translations entries)
  (define pairs '())
  (for ([entry (in-list entries)])
    (define mod-path (first entry))
    (define plain (second entry))
    (define kw    (third entry))
    ;; plain-map
    (for ([(en cn) (in-hash plain)] #:when (and cn (string? cn)))
      (set! pairs (cons (list en cn mod-path) pairs)))
    ;; kw-map
    (for ([(en val) (in-hash kw)])
      (when (and (pair? val) (car val) (string? (car val)))
        ;; 函数名翻译
        (set! pairs (cons (list en (car val) mod-path) pairs))
        ;; 关键字参数翻译
        (when (hash? (cdr val))
          (for ([(kw-en kw-cn) (in-hash (cdr val))]
                #:when (and kw-cn (string? kw-cn)))
            (set! pairs (cons (list kw-en kw-cn mod-path) pairs)))))))
  pairs)

;; ============================================================
;; Check 1: 缺失检查
;; ============================================================

;; 对比 map 文件与 scan-module 的 own-syms
;; 返回 (listof (cons mod-path (listof symbol?)))
(define (check-missing entries)
  (define results '())
  (for ([entry (in-list entries)])
    (define mod-path (first entry))
    (define plain    (second entry))
    (define kw       (third entry))
    (define map-syms (append (hash-keys plain) (hash-keys kw)))
    (with-handlers ([exn:fail? (lambda (_) (void))])
      (define-values (own-syms _deps) (scan-module mod-path))
      (define missing
        (for/list ([s (in-list own-syms)]
                   #:when (not (member s map-syms)))
          s))
      (when (pair? missing)
        (set! results
          (cons (cons mod-path (sort missing symbol<?))
                results)))))
  (sort results symbol<? #:key car))

;; ============================================================
;; Check 2: CN 冲突 — 不同 EN → 同一 CN
;; ============================================================

(define (check-conflict-cn translations)
  ;; cn-string -> (listof (list en mod-path))
  (define groups (make-hash))
  (for ([t (in-list translations)])
    (define en  (first t))
    (define cn  (second t))
    (define src (third t))
    (hash-update! groups cn
      (lambda (lst)
        (define pair (list en src))
        (if (member pair lst) lst (cons pair lst)))
      '()))
  ;; 只报告有不同 EN 的冲突
  (define conflicts
    (for/list ([(cn entries) (in-hash groups)]
               #:when (> (length (remove-duplicates (map car entries))) 1))
      (cons cn (sort entries
                 (lambda (a b)
                   (string<? (format "~a" (car a))
                             (format "~a" (car b))))))))
  (sort conflicts string<? #:key car))

;; ============================================================
;; Check 3: EN 冲突 — 同一 EN → 不同 CN
;; ============================================================

(define (check-conflict-en translations)
  ;; en -> (listof (list cn-string mod-path))
  (define groups (make-hash))
  (for ([t (in-list translations)])
    (define en  (first t))
    (define cn  (second t))
    (define src (third t))
    (hash-update! groups en
      (lambda (lst)
        (define pair (list cn src))
        (if (member pair lst) lst (cons pair lst)))
      '()))
  ;; 只报告有不同 CN 的冲突
  (define conflicts
    (for/list ([(en entries) (in-hash groups)]
               #:when (> (length (remove-duplicates (map car entries))) 1))
      (cons en (sort entries string<? #:key car))))
  (sort conflicts
    (lambda (a b)
      (string<? (format "~a" (car a)) (format "~a" (car b))))))

;; ============================================================
;; 写报告
;; ============================================================

(define (write-report path data label)
  (call-with-output-file path #:exists 'replace
    (lambda (out)
      (fprintf out ";; ~a (~a)~n~n" label (length data))
      (for ([item (in-list data)])
        (define key (car item))
        (define vals (cdr item))
        (fprintf out "(~s~n" key)
        (for ([v (in-list vals)])
          (fprintf out "  ~s~n" v))
        (fprintf out ")~n~n"))))
  (printf "  ~a: ~a 项 -> ~a~n" label (length data) path))

;; ============================================================
;; CLI
;; ============================================================

(module+ main
  (define maps-dir  (make-parameter "maps"))
  (define report-dir (make-parameter #f))
  (command-line
   #:once-each
   [("--maps-dir") dir "Maps directory (default: maps/)" (maps-dir dir)]
   [("--report-dir") dir "Report output dir (default: same as maps-dir)"
    (report-dir dir)]
   #:args () (void))

  (define rdir (or (report-dir) (maps-dir)))
  (make-directory* rdir)

  (printf "=== check ===~n")
  (printf "Scanning ~a ...~n" (maps-dir))
  (define entries (scan-maps-dir (maps-dir)))
  (printf "  ~a map files~n" (length entries))

  (define translations (collect-translations entries))
  (printf "  ~a translation pairs~n~n" (length translations))

  ;; 三个检查
  (printf "Checking...~n")
  (define missing    (check-missing entries))
  (define cn-conflicts (check-conflict-cn translations))
  (define en-conflicts (check-conflict-en translations))

  ;; 写报告
  (printf "~nReports:~n")
  (write-report (build-path rdir "missing.rktd")     missing     "missing")
  (write-report (build-path rdir "conflict-cn.rktd") cn-conflicts "conflict-cn")
  (write-report (build-path rdir "conflict-en.rktd") en-conflicts "conflict-en")
  (printf "~nDone.~n"))
