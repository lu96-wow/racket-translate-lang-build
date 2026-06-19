;; compiler/find-exe
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'find-exe  (cons #f (hash '#:cross? #f '#:untethered? #f))
))
