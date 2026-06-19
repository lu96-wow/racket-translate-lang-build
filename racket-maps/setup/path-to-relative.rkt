;; setup/path-to-relative
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'make-path->relative-string  #f
))

;; with-kw (2)
(define kw-map (hash
  'path->relative-string/library  (cons #f (hash '#:cache #f))
  'path->relative-string/setup  (cons #f (hash '#:cache #f))
))
