;; racket/fasl
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'fasl->s-exp  (cons "fasl->s-表达式" (hash '#:datum-intern? "数据-内部化?" '#:external-lifts "外部-提升列表" '#:skip-prefix? "跳过-前缀?"))
  's-exp->fasl  (cons "s-表达式->fasl" (hash '#:external-lift? "外部-提升?" '#:handle-fail "处理-失败" '#:keep-mutable? "保持-可变?" '#:skip-prefix? "跳过-前缀?"))
))
