;; racket/serialize-structs
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'make-deserialize-info  "创建-反序列化-信息"
  'make-serialize-info  "创建-序列化-信息"
  'prop:serializable  "属性:可序列化"
))

