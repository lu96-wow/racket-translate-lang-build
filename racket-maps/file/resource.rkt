;; file/resource
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'get-resource  (cons #f (hash '#:type #f))
  'write-resource  (cons #f (hash '#:create-key? #f '#:type #f))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:type #hash((bytes . #f) (bytes/expand-string . #f) (bytes/string . #f) (dword . #f) (expand-string . #f) (string . #f))
))
