;; setup/language-family
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'get-language-families  (cons #f (hash '#:namespace #f '#:user? #f))
))
