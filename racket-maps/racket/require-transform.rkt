;; racket/require-transform
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (25/25 translated)
(define plain-map (hash
  'convert-relative-module-path  "转换-相对-模块-路径"
  'current-require-module-path  "当前-需求-模块-路径"
  'expand-import  "扩展-导入"
  'import  "导入"
  'import-local-id  "导入-局部-标识"
  'import-mode  "导入-模式"
  'import-orig-mode  "导入-原始-模式"
  'import-orig-stx  "导入-原始-语法"
  'import-req-mode  "导入-需求-模式"
  'import-source  "导入-源"
  'import-source-mod-path-stx  "导入-源-模块-路径-语法"
  'import-source-mode  "导入-源-模式"
  'import-source?  "导入-源?"
  'import-src-mod-path  "导入-源-模块-路径"
  'import-src-sym  "导入-源-符号"
  'import?  "导入?"
  'make-import  "创建-导入"
  'make-import-source  "创建-导入-源"
  'make-require-transformer  "创建-需求-转换器"
  'prop:require-transformer  "属性:需求-转换器"
  'require-transformer?  "需求-转换器?"
  'struct:import  "结构:导入"
  'struct:import-source  "结构:导入-源"
  'syntax-local-lift-require-top-level-form  "语法-局部-提升-需求-顶层-形式"
  'syntax-local-require-certifier  "语法-局部-需求-认证器"
))

