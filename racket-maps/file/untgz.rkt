;; file/untgz
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'untgz  (cons #f (hash '#:dest #f '#:filter #f '#:permissive? #f '#:strip-count #f))
))
