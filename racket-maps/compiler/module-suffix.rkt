;; compiler/module-suffix
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'get-module-suffix-regexp  (cons "获取-模块-后缀-regexp" (hash '#:group "组" '#:mode "模式" '#:namespace "命名空间"))
  'get-module-suffixes  (cons "获取-模块-suffixes" (hash '#:group "组" '#:mode "模式" '#:namespace "命名空间"))
))

;; kw-value-map (2 keywords)
(define kw-value-map (hash
  '#:group #hash((all . "全部") (docs . "文档") (libs . "库"))
  '#:mode #hash((all-available . "所有-可用") (no-planet . "无-planet") (no-user . "无-用户") (preferred . "首选"))
))
