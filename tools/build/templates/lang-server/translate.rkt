#lang racket/base
;; build时填充
(define lang-name "~LANG-NAME~")
;; translate.rkt — racket-lang-build 翻译表加载与查询
;; 两种模式:
;;   1. flat:   load-translator → search-map<- 全量表 (简单)
;;   2. scoped: make-scoped-translator → 按模块加载 .rktd (模块感知)

(require racket/contract
         racket/file
         racket/path
         racket/string)

(provide load-translator
         make-scoped-translator
         scoped-translator-require!
         scoped-translator-sync!
         translate-symbol
         translate-symbols
         translator?
         scoped-translator?
         extract-required-modules
         find-tables-dir
         lang-name
         links-package-paths)

;; ============================================================
;; Flat translator
;; ============================================================

(struct translator (lookup-fn) #:transparent)

(define (load-translator lang-name)
  (with-handlers ([exn:fail? (lambda (e) #f)])
    (define mod-path (string->symbol (format "~a/search-map" lang-name)))
    (define lookup (dynamic-require mod-path 'search-map<-))
    (unless (procedure? lookup)
      (printf "translate: search-map<- not found in ~a~n" mod-path)
      #f)
    (translator lookup)))

;; ============================================================
;; Scoped translator
;; ============================================================

(struct scoped-translator (lang tables-dir cache merged kw-merged)
  ;; lang:      "racket-cn"
  ;; tables-dir: "/path/to/racket-cn/tables"
  ;; cache:     hash "coll/mod" → (values EN→CN-hash kw-EN→CN-hash)
  ;; merged:    box of (hash EN→CN) — 标识符合并表
  ;; kw-merged: box of (hash EN→CN) — 关键字合并表
  #:transparent
  #:mutable)

;; 创建 scoped translator
;; tables-dir 可通过 find-tables-dir 获取，或手动指定
(define (make-scoped-translator lang tables-dir modules)
  (unless (directory-exists? tables-dir)
    (error "translate: tables dir not found: ~a" tables-dir))
  (define st (scoped-translator lang tables-dir (hash) (box (hash)) (box (hash))))
  (for ([mod-path (in-list modules)])
    (scoped-translator-load-module! st mod-path))
  st)

;; 加载单个 .rktd → (values id-EN→CN kw-EN→CN deps)
(define (load-rktd-table tables-dir coll mod)
  (define file (build-path tables-dir coll (format "~a.rktd" mod)))
  (with-handlers ([exn:fail? (lambda (e) (values (hash) (hash) '()))])
    (call-with-input-file file
      (lambda (in)
        (define cn->en-id (read in))   ;; hash: CN-symbol → EN-symbol
        (define cn->en-kw (read in))   ;; hash: CN-keyword → EN-keyword
        (define deps (read in))        ;; list of "coll/mod"
        (define id-en->cn
          (for/hash ([(cn en) (in-hash cn->en-id)])
            (values en (symbol->string cn))))
        (define kw-en->cn
          (for/hash ([(cn en) (in-hash cn->en-kw)])
            (values en (keyword->string cn))))
        (values id-en->cn kw-en->cn deps)))))

;; 内部: 加载模块 + 合并 id/kw 两个表
(define (scoped-translator-load-module! st mod-path)
  (define parts (string-split mod-path "/"))
  (define coll (car parts))
  (define sub (cdr parts))
  (define mod (if (null? sub) "main" (string-join sub "/")))
  (define key (format "~a/~a" coll mod))
  (define cache (scoped-translator-cache st))
  (unless (hash-has-key? cache key)
    (define-values (id-table kw-table deps)
      (load-rktd-table (scoped-translator-tables-dir st) coll mod))
    (set-scoped-translator-cache! st (hash-set cache key (cons id-table kw-table)))
    ;; 合并 id 表
    (define old-id (unbox (scoped-translator-merged st)))
    (set-box! (scoped-translator-merged st)
              (for/fold ([h old-id]) ([(k v) (in-hash id-table)])
                (hash-set h k v)))
    ;; 合并 kw 表
    (define old-kw (unbox (scoped-translator-kw-merged st)))
    (set-box! (scoped-translator-kw-merged st)
              (for/fold ([h old-kw]) ([(k v) (in-hash kw-table)])
                (hash-set h k v)))
    ;; ★ 递归加载转发模块 deps（和 reader 保持一致）
    (for ([d (in-list deps)])
      (scoped-translator-load-module! st d))))

(define (scoped-translator-require! st mod-path)
  (scoped-translator-load-module! st mod-path))

(define (scoped-translator-sync! st modules)
  (for ([mod-path (in-list modules)])
    (scoped-translator-load-module! st mod-path)))

;; ============================================================
;; 翻译 (统一接口)
;; ============================================================

(define (translate-symbol t sym)
  (cond [(scoped-translator? t)
         ;; 先查 id 表，再查 kw 表（关键字如 #:exists）
         (or (hash-ref (unbox (scoped-translator-merged t)) sym #f)
             (hash-ref (unbox (scoped-translator-kw-merged t)) sym #f)
             (symbol->string sym))]
        [(translator? t)
         (define result ((translator-lookup-fn t) sym))
         (or result (symbol->string sym))]
        [else (symbol->string sym)]))

(define (translate-symbols t syms)
  (map (lambda (s) (translate-symbol t s)) syms))

;; ============================================================
;; require 模块提取 (从源文本，不修改 langserver)
;; ============================================================

(define (extract-required-modules source-text lang-suffix [cn->en #f])
  ;; cn->en: (string->symbol "需要") → 'require, 用于动态识别中文 require
  (define in (open-input-string source-text))
  (define (require-form? sym)
    (or (eq? sym 'require)
        (and cn->en (procedure? cn->en)
             (symbol? sym)
             (eq? (cn->en sym) 'require))))
  (define (extract-from form)
    (cond [(not (pair? form)) '()]
          [(require-form? (car form))
           (for/list ([spec (in-list (cdr form))]
                      #:when (symbol? spec))
             (spec->module-path (symbol->string spec) lang-suffix))]
          [else
           (append (extract-from (car form))
                   (extract-from (cdr form)))]))
  (define (collect acc)
    (define v (with-handlers ([exn:fail? (lambda (e)
                                           (read-line in)
                                           (if (eof-object? (peek-char in))
                                               eof
                                               'skip))])
                (read in)))
    (cond [(eof-object? v) (reverse acc)]
          [(eq? v 'skip) (collect acc)]
          [(pair? v)
           (collect (append (extract-from v) acc))]
          [else (collect acc)]))
  (collect '()))

;; "racket-cn/list" + "-cn" → "racket/list"
;; "racket-cn" + "-cn" → "racket/main"
(define (spec->module-path spec lang-suffix)
  ;; 无后缀剥离
  (define parts (string-split spec "/"))
  (if (= (length parts) 1)
      (format "~a/main" spec)
      spec))

;; ============================================================
;; 辅助: 查找语言包的 tables/ 目录
;; ============================================================

(define (find-tables-dir lang-name)
  ;; 搜索策略:
  ;; 1. 动态加载 search-map 确认包可用
  ;; 2. 搜索标准 collection 路径
  ;; 3. 读取 links.rktd 查找链接包路径
  (with-handlers ([exn:fail? (lambda (e) #f)])
    (define search-map-mod (string->symbol (format "~a/search-map" lang-name)))
    (dynamic-require search-map-mod (void))
    ;; 收集所有可能路径
    (define roots
      (append (find-library-collection-paths)
              (list (build-path (find-system-path 'pref-dir) "pkgs"))
              (list (build-path (find-system-path 'addon-dir)
                                (version) "pkgs"))
              ;; 从 links 文件解析链接路径
              (links-package-paths)))
    (for/or ([root (in-list roots)])
      ;; root 可能已经是包目录本身 (从 links 解析出来)
      ;; 也可能只是 collection 根目录 (需追加 lang-name)
      (define candidate
        (if (directory-exists? (build-path root "tables"))
            (build-path root "tables")
            (build-path root lang-name "tables")))
      (and (directory-exists? candidate) candidate))))

;; 从 links.rktd 中提取所有包的根目录路径
(define (links-package-paths)
  (with-handlers ([exn:fail? (lambda (e) '())])
    (define links-file
      (build-path (find-system-path 'addon-dir) (version) "links.rktd"))
    (if (not (file-exists? links-file))
        '()
        (call-with-input-file links-file
          (lambda (in)
            (define links (read in))
            (for/list ([entry (in-list links)])
              (define path-parts (cadr entry))
              (resolve-links-path (path-only links-file) path-parts)))))))

(define (resolve-links-path base parts)
  (for/fold ([p base]) ([part (in-list parts)])
    (cond [(eq? part 'up)  (parent-dir p)]
          [(eq? part 'up2) (parent-dir (parent-dir p))]
          [(eq? part 'up3) (parent-dir (parent-dir (parent-dir p)))]
          [(eq? part 'up4) (parent-dir (parent-dir (parent-dir (parent-dir p))))]
          ;; symbols and byte strings → path element
          [(symbol? part) (build-path p (symbol->string part))]
          [(bytes? part)  (build-path p (bytes->path part))]
          [(path? part)   (build-path p part)]
          [else p])))

(define (parent-dir p)
  ;; path-only doesn't go up from a directory; use build-path ../ trick
  (simplify-path (build-path p "..")))
