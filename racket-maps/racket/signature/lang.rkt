;; racket/signature/lang
#lang racket/base
(provide plain-map re-exports)

;; re-exports (3)
(define re-exports '(
  "racket/base"
  "racket/contract"
  "racket/unit"
))

;; plain (2/2 translated)
(define plain-map (hash
  '#%module-begin  "#%模块-开始"
  'struct  "结构"
))

