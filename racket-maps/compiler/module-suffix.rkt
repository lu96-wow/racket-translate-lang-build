;; compiler/module-suffix
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'get-module-suffix-regexp  (cons #f (hash '#:group #f '#:mode #f '#:namespace #f))
  'get-module-suffixes  (cons #f (hash '#:group #f '#:mode #f '#:namespace #f))
))

;; kw-value-map (2 keywords)
(define kw-value-map (hash
  '#:group #hash((all . #f) (docs . #f) (libs . #f))
  '#:mode #hash((all-available . #f) (no-planet . #f) (no-user . #f) (preferred . #f))
))
