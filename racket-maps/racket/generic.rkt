;; racket/generic
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (12/12 translated)
(define plain-map (hash
  'chaperone-generics  "监护-泛型"
  'define-generics  "定义-泛型"
  'define/generic  "定义/泛型"
  'exn:fail:support  "异常:失败:支持"
  'exn:fail:support?  "异常:失败:支持?"
  'generic-instance/c  "泛型-实例/契约"
  'impersonate-generics  "模拟-泛型"
  'make-generic-struct-type-property  "创建-泛型-结构-类型-属性"
  'make-struct-type-property/generic  "创建-结构-类型-属性/泛型"
  'raise-support-error  "引发-支持-错误"
  'redirect-generics  "重定向-泛型"
  'struct:exn:fail:support  "结构:异常:失败:支持"
))

