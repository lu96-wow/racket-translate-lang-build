;; syntax/free-vars
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'free-vars  (cons #f (hash '#:module-bound? #f))
))
