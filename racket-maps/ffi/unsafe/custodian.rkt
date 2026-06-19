;; ffi/unsafe/custodian
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/2 translated)
(define plain-map (hash
  'make-custodian-at-root  #f
  'unregister-custodian-shutdown  #f
))

;; with-kw (2)
(define kw-map (hash
  'register-custodian-shutdown  (cons #f (hash '#:at-exit? #f '#:ordered? #f '#:weak? #f))
  'register-finalizer-and-custodian-shutdown  (cons #f (hash '#:at-exit? #f '#:custodian-available #f '#:custodian-unavailable #f))
))
