;; racket/case
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4/4 translated)
(define plain-map (hash
  'case/eq  "分情况/eq"
  'case/equal  "分情况/相等"
  'case/equal-always  "分情况/相等-总是"
  'case/eqv  "分情况/eqv"
))

