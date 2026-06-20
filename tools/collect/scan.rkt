#lang racket/base
;; scan.rkt — 模块扫描：提取导出、按来源分类、检测关键字参数
;;
;; 核心能力：
;;   1. 提取 phase-0 导出并追踪每个符号的来源模块
;;   2. 区分「本模块定义」和「从公共模块重导出」
;;   3. 检测过程的关键字参数，分类为 plain / kw

(provide scan-module
         try-keywords
         classify)

;; ============================================================
;; scan-module : module-path? -> (values (listof symbol?)
;;                                       (listof string?))
;;
;; 加载模块，提取所有 phase-0 导出，按来源分类：
;;   own-syms       — 本模块应收录的符号（自定义 + 来自私有/内部模块）
;;   re-export-mods — 从公共模块重导出的来源模块路径列表
;;
;; module->exports 返回的每个 entry 结构：
;;   (sym source-entry ...)
;;   source-entry = () 表示本模块定义
;;   source-entry = (module-path-index ...) 表示从该模块重导出
;; ============================================================
(define (scan-module mod-path)
  ;; 清空命令行参数，防止 raco/main 等模块在加载时读取到我们的参数
  (parameterize ([current-command-line-arguments #()])
    (dynamic-require mod-path 0))
  (define-values (vals stxs) (module->exports mod-path))
  (define own-syms (list))
  (define re-export-set (make-hash))

  (for ([group (list vals stxs)])
    (define phase0 (assv 0 group))
    (when phase0
      (for ([e (in-list (cdr phase0))])
        (define sym (car e))
        (define srcs (cdr e))        ;; list of source-entries
        (define from-public? #f)
        (for ([src (in-list srcs)])
          (when (pair? src)          ;; () = self, (mpi ...) = re-exported
            (define mod-name (resolve-source-mpi (car src)))
            (when (and mod-name (public-module-path? mod-name))
              (set! from-public? #t)
              (hash-set! re-export-set mod-name #t))))
        (unless from-public?
          (set! own-syms (cons sym own-syms))))))

  (values own-syms (sort (hash-keys re-export-set) string<?)))

;; ============================================================
;; resolve-source-mpi : module-path-index? -> (or/c string? #f)
;;
;; 将 module-path-index 解析为模块路径字符串。
;; 只匹配 collects/ 或 pkgs/ 下的模块，其余返回 #f。
;; ============================================================
(define (resolve-source-mpi mpi)
  (with-handlers ([exn:fail? (lambda (_e) #f)])
    (define rmp  (module-path-index-resolve mpi))
    (define name (resolved-module-path-name rmp))
    (define full (if (path? name) (path->string name) (format "~a" name)))
    (cond
      [(regexp-match #rx"collects/(.+)[.]rkt$" full) => cadr]
      [(regexp-match #rx"pkgs/[^/]+/(.+)[.]rkt$" full)     => cadr]
      [else #f])))

;; ============================================================
;; reexport-target? : string? -> boolean?
;;
;; 判断来源模块是否会被 collect 递归扫描到（即会有自己的 map）。
;; 规则：路径中不含 "private" 即可。
;; collect 递归扫描时跳过 private/ 目录，所以 private 模块
;; 不会有独立 map，其符号保留在父模块的 map 中。
;; ============================================================
(define (public-module-path? mod-path)
  (not (regexp-match? #rx"private" mod-path)))

;; ============================================================
;; try-keywords : module-path? symbol? -> (or/c (listof keyword?) #f)
;; ============================================================
(define (try-keywords mod-path sym)
  (with-handlers ([exn:fail? (lambda (_e) #f)])
    (define val (dynamic-require mod-path sym))
    (and (procedure? val)
         (call-with-values (lambda () (procedure-keywords val))
                           (lambda (req allowed) (append req allowed))))))

;; ============================================================
;; classify : module-path? (listof symbol?)
;;         -> (values (listof symbol?)
;;                    (listof (cons/c symbol? (listof keyword?))))
;; ============================================================
(define (classify mod-path syms)
  (for/fold ([plain (list)] [kw (list)]) ([s (in-list syms)])
    (define kws (try-keywords mod-path s))
    (if (and kws (pair? kws))
        (values plain (cons (cons s kws) kw))
        (values (cons s plain) kw))))
