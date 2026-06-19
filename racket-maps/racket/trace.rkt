;; racket/trace
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (12/12 translated)
(define plain-map (hash
  'current-prefix-in  "当前-前缀-入"
  'current-prefix-out  "当前-前缀-出"
  'current-trace-notify  "当前-跟踪-通知"
  'current-trace-print-args  "当前-跟踪-打印-参数"
  'current-trace-print-results  "当前-跟踪-打印-结果"
  'trace  "跟踪"
  'trace-call  "跟踪-调用"
  'trace-define  "跟踪-定义"
  'trace-define-syntax  "跟踪-定义-语法"
  'trace-lambda  "跟踪-函数"
  'trace-let  "跟踪-let"
  'untrace  "取消跟踪"
))

