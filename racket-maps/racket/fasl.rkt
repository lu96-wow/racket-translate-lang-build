;; racket/fasl
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'fasl->s-exp  (cons "fasl->s-表达式" (hash '#:datum-intern? #f '#:external-lifts #f '#:skip-prefix? #f))
  's-exp->fasl  (cons "s-表达式->fasl" (hash '#:external-lift? #f '#:handle-fail #f '#:keep-mutable? #f '#:skip-prefix? #f))
))
