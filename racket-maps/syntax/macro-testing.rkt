;; syntax/macro-testing
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/3 translated)
(define plain-map (hash
  'convert-compile-time-error  #f
  'convert-syntax-error  #f
  'phase1-eval  #f
))

