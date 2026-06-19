;; ffi/unsafe/cvector
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (11/12 translated)
(define plain-map (hash
  '_cvector  "_C-向量"
  'cvector  "C-向量"
  'cvector->list  "C-向量->列表"
  'cvector-length  "C-向量-长度"
  'cvector-ptr  "C-向量-指针"
  'cvector-ref  "C-向量-引用"
  'cvector-set!  "C-向量-设置!"
  'cvector-type  "C-向量-类型"
  'cvector?  "C-向量?"
  'list->cvector  "列表->C-向量"
  'make-cvector  "创建-C-向量"
  'make-cvector*  #f
))

