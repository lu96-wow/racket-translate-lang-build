;; setup/language-family
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'get-language-families  (cons "获取-language-families" (hash '#:namespace "命名空间" '#:user? "用户?"))
))
