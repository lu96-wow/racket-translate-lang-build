;; racket/function
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (14/14 translated)
(define plain-map (hash
  'arity-includes?  "元数-包含?"
  'arity=?  "元数=?"
  'conjoin  "合取"
  'const  "常量"
  'const*  "常量*"
  'curry  "柯里化"
  'curryr  "柯里化右"
  'disjoin  "析取"
  'identity  "恒等"
  'negate  "否定"
  'normalize-arity  "归一化-元数"
  'normalized-arity?  "已归一化-元数?"
  'thunk  "延迟计算"
  'thunk*  "延迟计算*"
))

