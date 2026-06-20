;; setup/collects
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'collects-relative->path  #f
))

;; with-kw (2)
(define kw-map (hash
  'path->collects-relative  (cons "路径->集合包-相对" (hash '#:cache "缓存"))
  'path->module-path  (cons "路径->模块-路径" (hash '#:cache "缓存"))
))
