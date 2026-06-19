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
  'collection-search  (cons #f (hash '#:all-possible-roots? #f '#:break? #f '#:combine #f '#:init #f))
))
