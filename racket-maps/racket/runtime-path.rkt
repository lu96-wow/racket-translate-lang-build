;; racket/runtime-path
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (7/7 translated)
(define plain-map (hash
  'define-runtime-module-path  "定义-运行时-模块-路径"
  'define-runtime-module-path-index  "定义-运行时-模块-路径-索引"
  'define-runtime-path  "定义-运行时-路径"
  'define-runtime-path-list  "定义-运行时-路径-列表"
  'define-runtime-paths  "定义-运行时-路径集"
  'runtime-paths  "运行时-路径"
  'runtime-require  "运行时-需求"
))

