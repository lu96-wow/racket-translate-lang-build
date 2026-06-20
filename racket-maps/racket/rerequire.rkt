;; racket/rerequire
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'dynamic-rerequire  (cons "动态-重新需求" (hash '#:verbosity "详细程度"))
))
