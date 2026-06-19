;; setup/parallel-build
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'parallel-compile-worker  #f
))

;; with-kw (2)
(define kw-map (hash
  'parallel-compile  (cons #f (hash '#:options #f '#:use-places? #f))
  'parallel-compile-files  (cons #f (hash '#:handler #f '#:options #f '#:use-places? #f '#:worker-count #f))
))
