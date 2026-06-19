;; ffi/objc
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "ffi/unsafe/objc"
))

;; plain (1/1 translated)
(define plain-map (hash
  'objc-unsafe!  "objc-不安全!"
))

