;; ffi/unsafe/atomic
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/15 translated)
(define plain-map (hash
  'call-as-atomic  #f
  'call-as-nonatomic  #f
  'call-as-uninterruptible  #f
  'end-atomic  #f
  'end-breakable-atomic  #f
  'end-uninterruptible  #f
  'in-atomic-mode?  #f
  'make-uninterruptible-lock  #f
  'start-atomic  #f
  'start-breakable-atomic  #f
  'start-uninterruptible  #f
  'uninterruptible-custodian-lock-acquire  #f
  'uninterruptible-custodian-lock-release  #f
  'uninterruptible-lock-acquire  #f
  'uninterruptible-lock-release  #f
))

