#lang racket/base
;; lang-server.rkt — 语言服务器适配器
;;
;; 不放在语言包内，独立部署。
;; 检测：#lang 前缀匹配（不依赖字符编码检测）
;; 加载：按 require 作用域加载，不是全量
;;
;; 提供：
;;   (is-lang-file? text)           检测是否为目标语言
;;   (make-completer)               创建补全器（预加载默认表）
;;   (completer-sync! c text)       解析 require 并加载对应表
;;   (completer-complete c prefix)  前缀匹配补全
;;   (completer-hover c sym)        悬停信息

(require racket/file racket/path racket/string racket/list)
(provide is-lang-file?
         make-completer
         completer-sync!
         completer-complete
         completer-hover)

;; 构建时填充
(define lang-name "racket-cn")
(define preload-mod "racket/main")

;; tables 目录：相对于本文件
(define tables-root
  (let* ([mpi (variable-reference->module-path-index (#%variable-reference))]
         [rmp (module-path-index-resolve mpi)]
         [f   (resolved-module-path-name rmp)]
         [s   (if (path? f) (path->string f)
                  (if (pair? f) (path->string (car f)) f))]
         [i   (let loop ([i (sub1 (string-length s))])
                (if (char=? (string-ref s i) #\/) i (loop (sub1 i))))])
    (string-append (substring s 0 i) "/../racket-cn/tables")))

;; ============================================================
;; 检测：#lang 前缀匹配
;; ============================================================
(define (is-lang-file? text)
  (define first-nl (or (for/first ([i (in-range (string-length text))]
                                   #:when (char=? (string-ref text i) #\newline))
                         i)
                       (string-length text)))
  (define first-line (substring text 0 first-nl))
  (string-prefix? (string-trim first-line) (string-append "#lang " lang-name)))

;; ============================================================
;; 补全器（作用域加载）
;; ============================================================
(struct completer (id-table kw-table rev-id loaded) #:mutable)

(define (hash-merge a b)
  (for/fold ([h a]) ([(k v) (in-hash b)]) (hash-set h k v)))

(define (make-completer)
  (define c (completer (hash) (hash) (hash) '()))
  ;; 预加载默认模块
  (completer-load! c preload-mod)
  c)

;; 加载单个模块的表 + 递归 re-exports
(define (completer-load! c mod-path)
  (unless (member mod-path (completer-loaded c))
    (set-completer-loaded! c (cons mod-path (completer-loaded c)))
    (define rktd (string-append tables-root "/" mod-path ".rktd"))
    (when (file-exists? rktd)
      (with-handlers ([exn:fail? (lambda (_) (void))])
        (call-with-input-file rktd
          (lambda (in)
            (define id (read in))
            (define kw (read in))
            (define deps (read in))
            (when (hash? id)
              (set-completer-id-table! c
                (hash-merge (completer-id-table c) id))
              ;; 同步反转表
              (set-completer-rev-id! c
                (hash-merge (completer-rev-id c)
                  (for/hash ([(cn en) (in-hash id)])
                    (values en (symbol->string cn))))))
            (when (hash? kw)
              (set-completer-kw-table! c
                (hash-merge (completer-kw-table c) kw)))
            ;; 跟 re-exports
            (when (list? deps)
              (for ([d (in-list deps)])
                (completer-load! c d)))))))))

;; ============================================================
;; 解析 require 并同步
;; ============================================================
(define (extract-module-paths text)
  ;; 匹配模块路径模式: collection/module 或 collection/sub/module
  (define matches
    (regexp-match* #rx"[a-z][a-z0-9_-]*/[a-z][a-z0-9_/+-]*" text))
  ;; 去重并过滤有实际表的
  (remove-duplicates
    (filter (lambda (m)
              (file-exists? (string-append tables-root "/" m ".rktd")))
            (or matches '()))))

(define (completer-sync! c text)
  (define mods (extract-module-paths text))
  (for ([mod (in-list mods)])
    (completer-load! c mod)))

;; ============================================================
;; 补全：前缀匹配
;; ============================================================
(define (completer-complete c prefix)
  ;; 返回: (listof (list translated-string original-string))
  (define id (completer-id-table c))
  (define rev (completer-rev-id c))
  (define results '())
  ;; 在 CN→EN 表中搜索（用户输入翻译后的前缀）
  (for ([(cn en) (in-hash id)])
    (when (string-prefix? (symbol->string cn) prefix)
      (set! results
        (cons (list (symbol->string cn) (symbol->string en))
              results))))
  ;; 也在 EN→CN 表中搜索（用户输入英文前缀）
  (for ([(en cn-str) (in-hash rev)])
    (when (string-prefix? (symbol->string en) prefix)
      (set! results
        (cons (list (symbol->string en) cn-str)
              results))))
  (sort results string<? #:key car))

;; ============================================================
;; 悬停信息
;; ============================================================
(define (completer-hover c sym)
  (define s (if (string? sym) (string->symbol sym) sym))
  (define id (completer-id-table c))
  (define rev (completer-rev-id c))
  (cond
    [(hash-ref id s #f)
     => (lambda (en) (format "~a → ~a" s en))]
    [(hash-ref rev s #f)
     => (lambda (cn) (format "~a → ~a" s cn))]
    [else #f]))
