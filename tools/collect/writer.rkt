#lang racket/base
;; writer.rkt — map 模板文件生成
;;
;; 职责：将扫描结果（plain-map、kw-map、re-exports）写入
;;       maps/<collection>/<module>.rkt 模板文件。
;;       已存在的文件不会被覆盖（保护已翻译内容）。
;;
;; 命名规则（通用）：
;;   mod-path          -> collection / file
;;   "racket/list"     -> racket / list.rkt
;;   "net/url"         -> net / url.rkt
;;   "json/main"       -> json / main.rkt
;;   "syntax/parse"    -> syntax / parse.rkt
;;   "data/queue"      -> data / queue.rkt
;;   "rackunit"        -> rackunit / main.rkt
;;   "typed/racket/base" -> typed / racket/base.rkt

(require racket/string racket/path racket/list racket/file)

(provide write-template!
         mod->file
         mod->collection)

;; ============================================================
;; mod->collection : module-path? -> string?
;;
;; 取模块路径的首段作为 collection 名。
;;   'racket/list      -> "racket"
;;   'net/url          -> "net"
;;   'rackunit         -> "rackunit"
;;   'typed/racket/base -> "typed"
;; ============================================================
(define (mod->collection mod-path)
  (car (regexp-split #rx"/" (format "~a" mod-path))))

;; ============================================================
;; mod->file : module-path? -> string?
;;
;; 模块路径去掉 collection 前缀后的部分，作为文件名。
;; 单段模块（无 /）返回 "main"。
;;   "racket/list"       -> "list"
;;   "net/url"           -> "url"
;;   "json/main"         -> "main"
;;   "rackunit"          -> "main"
;;   "typed/racket/base" -> "racket/base"
;; ============================================================
(define (mod->file mod-path)
  (define s (format "~a" mod-path))
  (define parts (regexp-split #rx"/" s))
  (if (null? (cdr parts))
      "main"
      (string-join (cdr parts) "/")))

;; ============================================================
;; write-template!
;;
;; 参数：
;;   mod-path  — 模块路径，如 'racket/list
;;   plain     — (listof symbol?)，无关键字参数的导出
;;   kw        — (listof (cons/c symbol? (listof keyword?)))
;;   deps      — (listof string?)，重导出依赖模块路径
;;   maps-dir  — 输出目录
;; ============================================================
(define (write-template! mod-path plain kw deps maps-dir)
  (define has-p? (pair? plain))
  (define has-k? (pair? kw))

  ;; 构建 provide 列表：re-exports 始终包含
  (define prov-parts
    (filter values
            (list (and has-p? "plain-map")
                  (and has-k? "kw-map")
                  "re-exports")))
  (define prov (string-join prov-parts " "))

  (define buf (open-output-string))

  ;; --- 文件头 ---
  (fprintf buf ";; ~a~n" mod-path)
  (fprintf buf "#lang racket/base~n")
  (fprintf buf "(provide ~a)~n~n" prov)

  ;; --- re-exports 段 ---
  (fprintf buf ";; re-exports (~a)~n" (length deps))
  (cond
    [(null? deps)
     (fprintf buf "(define re-exports '())~n~n")]
    [else
     (fprintf buf "(define re-exports '(~n")
     (for ([d (in-list (sort deps string<?))])
       (fprintf buf "  ~s~n" d))
     (fprintf buf "))~n~n")])

  ;; --- plain-map 段 ---
  (when has-p?
    (fprintf buf ";; plain (~a)~n" (length plain))
    (fprintf buf "(define plain-map (hash~n")
    (for ([s (in-list (sort plain symbol<?))])
      (fprintf buf "  '~a  #f~n" s))
    (fprintf buf "))~n~n"))

  ;; --- kw-map 段 ---
  (when has-k?
    (fprintf buf ";; with-kw (~a)~n" (length kw))
    (fprintf buf "(define kw-map (hash~n")
    (for ([e (in-list (sort kw symbol<? #:key car))])
      (fprintf buf "  '~a  (cons #f (hash" (car e))
      (for ([k (in-list (cdr e))])
        (fprintf buf " '~a #f" k))
      (fprintf buf "))~n"))
    (fprintf buf "))~n"))

  ;; --- 写入文件 ---
  (define coll (mod->collection mod-path))
  (define file (mod->file mod-path))
  (define out-dir  (build-path maps-dir coll))
  ;; file 可能含子路径，如 "racket/base" -> 需要创建子目录
  (define out-path (build-path out-dir (string-append file ".rkt")))
  (define out-parent (path-only out-path))
  (cond
    [(file-exists? out-path)
     (printf "  skip (exists): ~a/~a.rkt~n" coll file)]
    [else
     (make-directory* out-parent)
     (display-to-file (get-output-string buf) out-path #:exists 'error)
     (printf "  -> ~a/~a.rkt~n" coll file)]))
