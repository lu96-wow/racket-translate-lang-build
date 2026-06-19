;; compiler/distribute
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'assemble-distribution  (cons #f (hash '#:collects-path #f '#:copy-collects #f '#:executables? #f '#:relative-base #f))
))
