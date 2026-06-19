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
  'path->collects-relative  (cons #f (hash '#:cache #f))
  'path->module-path  (cons #f (hash '#:cache #f))
))
