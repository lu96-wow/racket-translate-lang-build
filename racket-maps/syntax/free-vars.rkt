;; syntax/free-vars
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'free-vars  (cons "自由-vars" (hash '#:module-bound? "模块-绑定?"))
))
