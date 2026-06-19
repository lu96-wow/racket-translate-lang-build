;; compiler/module-suffix
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'get-module-suffix-regexp  (cons #f (hash '#:group #f '#:mode #f '#:namespace #f))
  'get-module-suffixes  (cons #f (hash '#:group #f '#:mode #f '#:namespace #f))
))
