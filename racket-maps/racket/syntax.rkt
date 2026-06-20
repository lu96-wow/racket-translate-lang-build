;; racket/syntax
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (11/11 translated)
(define plain-map (hash
  'current-recorded-disappeared-uses  "当前-记录-已消失-使用"
  'current-syntax-context  "当前-语法-上下文"
  'define/with-syntax  "定义/带-语法"
  'format-symbol  "格式化-符号"
  'generate-temporary  "生成-临时"
  'internal-definition-context-apply  "内部-定义-上下文-应用"
  'record-disappeared-uses  "记录-已消失-使用"
  'syntax-local-eval  "语法-局部-求值"
  'syntax-local-value/record  "语法-局部-值/记录"
  'with-disappeared-uses  "带-已消失-使用"
  'with-syntax*  "带-语法*"
))

;; with-kw (2)
(define kw-map (hash
  'format-id  (cons "格式化-标识" (hash '#:cert "证书" '#:props "属性" '#:source "来源" '#:subs-intro "子项-引入" '#:subs? "子项?"))
  'wrong-syntax  (cons "错误-语法" (hash '#:extra "额外"))
))
