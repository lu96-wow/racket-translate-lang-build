;; ffi/unsafe/alloc
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (4)
(define kw-map (hash
  'allocator  (cons "分配器" (hash '#:merely-uninterruptible? "仅-不可中断?"))
  'deallocator  (cons "释放器" (hash '#:merely-uninterruptible? "仅-不可中断?"))
  'releaser  (cons "释放器" (hash '#:merely-uninterruptible? "仅-不可中断?"))
  'retainer  (cons "保持器" (hash '#:merely-uninterruptible? "仅-不可中断?"))
))
