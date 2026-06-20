;; racket/serialize
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (11/11 translated)
(define plain-map (hash
  'define-serializable-struct  "定义-可序列化-结构"
  'define-serializable-struct/versions  "定义-可序列化-结构/版本"
  'deserialize  "反序列化"
  'deserialize-module-guard  "反序列化-模块-守卫"
  'make-deserialize-info  "创建-反序列化-信息"
  'make-serialize-info  "创建-序列化-信息"
  'prop:serializable  "属性:可序列化"
  'serializable-struct  "可序列化-结构"
  'serializable-struct/versions  "可序列化-结构/版本"
  'serializable?  "可序列化?"
  'serialized=?  "已序列化=?"
))

;; with-kw (1)
(define kw-map (hash
  'serialize  (cons "序列化" (hash '#:deserialize-relative-directory "反序列化-相对-目录" '#:relative-directory "相对-目录"))
))
