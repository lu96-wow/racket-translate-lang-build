;; ffi/unsafe/os-thread
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/5 translated)
(define plain-map (hash
  'call-in-os-thread  #f
  'make-os-semaphore  #f
  'os-semaphore-post  #f
  'os-semaphore-wait  #f
  'os-thread-enabled?  #f
))

