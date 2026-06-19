;; ffi/unsafe/try-atomic
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/2 translated)
(define plain-map (hash
  'call-as-nonatomic-retry-point  #f
  'can-try-atomic?  #f
))

;; with-kw (1)
(define kw-map (hash
  'try-atomic  (cons #f (hash '#:keep-in-order? #f '#:should-give-up? #f))
))
