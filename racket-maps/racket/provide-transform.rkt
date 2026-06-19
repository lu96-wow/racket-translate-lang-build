;; racket/provide-transform
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (19/19 translated)
(define plain-map (hash
  'expand-export  "扩展-导出"
  'export  "导出"
  'export-local-id  "导出-局部-标识"
  'export-mode  "导出-模式"
  'export-orig-stx  "导出-原始-语法"
  'export-out-id  "导出-输出-标识"
  'export-out-sym  "导出-输出-符号"
  'export-protect?  "导出-保护?"
  'export?  "导出?"
  'make-export  "创建-导出"
  'make-provide-pre-transformer  "创建-提供-预-转换器"
  'make-provide-transformer  "创建-提供-转换器"
  'pre-expand-export  "预-扩展-导出"
  'prop:provide-pre-transformer  "属性:提供-预-转换器"
  'prop:provide-transformer  "属性:提供-转换器"
  'provide-pre-transformer?  "提供-预-转换器?"
  'provide-transformer?  "提供-转换器?"
  'struct:export  "结构:导出"
  'syntax-local-provide-certifier  "语法-局部-提供-认证器"
))

