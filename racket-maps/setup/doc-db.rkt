;; setup/doc-db
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/8 translated)
(define plain-map (hash
  'doc-db-available?  #f
  'doc-db-clean-files  #f
  'doc-db-disconnect  #f
  'doc-db-file->connection  #f
  'doc-db-get-provides-timestamp  #f
  'doc-db-init-pause  #f
  'doc-db-pause  #f
  'log-doc-db-info  #f
))

;; with-kw (12)
(define kw-map (hash
  'doc-db-add-dependencies  (cons "文档-数据库-添加-依赖" (hash '#:pkg "包"))
  'doc-db-add-provides  (cons "文档-数据库-添加-提供" (hash '#:pkg "包"))
  'doc-db-add-searches  (cons "文档-数据库-添加-搜索项" (hash '#:pkg "包"))
  'doc-db-check-duplicates  (cons "文档-数据库-检查-重复项" (hash '#:attach "附加" '#:main-doc-relative-ok? "主-文档-相对-确认?"))
  'doc-db-check-unsatisfied  (cons "文档-数据库-检查-未满足" (hash '#:attach "附加"))
  'doc-db-clear-dependencies  (cons "文档-数据库-清除-依赖" (hash '#:pkg "包"))
  'doc-db-clear-provides  (cons "文档-数据库-清除-提供" (hash '#:pkg "包"))
  'doc-db-clear-searches  (cons "文档-数据库-清除-搜索项" (hash '#:pkg "包"))
  'doc-db-get-dependencies  (cons "文档-数据库-获取-依赖" (hash '#:attach "附加" '#:include-tags? "包含-标签?" '#:main-doc-relative-ok? "主-文档-相对-确认?"))
  'doc-db-key->path  (cons "文档-数据库-键->路径" (hash '#:main-doc-relative-ok? "主-文档-相对-确认?"))
  'doc-db-key->path+pkg  (cons "文档-数据库-键->路径+包" (hash '#:main-doc-relative-ok? "主-文档-相对-确认?"))
  'doc-db-set-provides-timestamp  (cons "文档-数据库-设置-提供-timestamp" (hash '#:pkg "包"))
))
