;; file/resource
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'get-resource  (cons #f (hash '#:type #f))
  'write-resource  (cons #f (hash '#:create-key? #f '#:type #f))
))
