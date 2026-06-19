;; syntax/toplevel
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/5 translated)
(define plain-map (hash
  'eval-compile-time-part-of-top-level  #f
  'eval-compile-time-part-of-top-level/compile  #f
  'expand-syntax-top-level-with-compile-time-evals  #f
  'expand-syntax-top-level-with-compile-time-evals/flatten  #f
  'expand-top-level-with-compile-time-evals  #f
))

