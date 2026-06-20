;; syntax/moddep
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/12 translated)
(define plain-map (hash
  'check-module-form  #f
  'collapse-module-path  #f
  'collapse-module-path-index  #f
  'default-compiled-sub-path  #f
  'exn:get-module-code  #f
  'exn:get-module-code-path  #f
  'exn:get-module-code?  #f
  'make-exn:get-module-code  #f
  'moddep-current-open-input-file  #f
  'resolve-module-path  #f
  'resolve-module-path-index  #f
  'with-module-reading-parameterization  #f
))

;; with-kw (4)
(define kw-map (hash
  'get-metadata-path  (cons "获取-metadata-路径" (hash '#:roots "根目录"))
  'get-module-code  (cons "获取-模块-code" (hash '#:choose "选择" '#:compile "编译" '#:extension-handler "扩展-处理器" '#:notify "通知" '#:rkt-try-ss? "rkt-尝试-ss?" '#:roots "根目录" '#:source-reader "来源-读取器" '#:sub-path "子路径" '#:submodule-path "子模块-路径"))
  'get-module-path  (cons "获取-模块-路径" (hash '#:choose "选择" '#:rkt-try-ss? "rkt-尝试-ss?" '#:roots "根目录" '#:sub-path "子路径" '#:submodule? "子模块?"))
  'show-import-tree  (cons "显示-导入-树" (hash '#:dag? "有向无环图?" '#:path-to "路径-到" '#:show "显示"))
))
