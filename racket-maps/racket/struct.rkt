;; racket/struct
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'make-constructor-style-printer  "创建-构造器-样式-打印器"
))

;; with-kw (1)
(define kw-map (hash
  'struct->list  (cons "结构->列表" (hash '#:on-opaque "遇-不透明"))
))
