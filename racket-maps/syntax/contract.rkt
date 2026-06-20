;; syntax/contract
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'wrap-expr/c  (cons #f (hash '#:arg? #f '#:context #f '#:macro #f '#:name #f '#:negative #f '#:phase #f '#:positive #f))
))

;; kw-value-map (2 keywords)
(define kw-value-map (hash
  '#:negative #hash((from-macro . #f) (unknown . #f) (use-site . #f))
  '#:positive #hash((from-macro . #f) (unknown . #f) (use-site . #f))
))
