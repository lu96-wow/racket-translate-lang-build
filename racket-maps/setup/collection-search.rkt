;; setup/collection-search
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'normalized-lib-module-path?  #f
))

;; with-kw (1)
(define kw-map (hash
  'collection-search  (cons "collection-搜索" (hash '#:all-possible-roots? "所有-可能-根?" '#:break? "中断?" '#:combine "组合" '#:init "初始化"))
))
