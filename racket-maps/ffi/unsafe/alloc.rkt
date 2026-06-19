;; ffi/unsafe/alloc
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (4)
(define kw-map (hash
  'allocator  (cons #f (hash '#:merely-uninterruptible? #f))
  'deallocator  (cons #f (hash '#:merely-uninterruptible? #f))
  'releaser  (cons #f (hash '#:merely-uninterruptible? #f))
  'retainer  (cons #f (hash '#:merely-uninterruptible? #f))
))
