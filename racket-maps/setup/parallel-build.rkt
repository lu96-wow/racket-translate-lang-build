;; setup/parallel-build
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'parallel-compile-worker  #f
))

;; with-kw (2)
(define kw-map (hash
  'parallel-compile  (cons "parallel-编译" (hash '#:options "选项" '#:use-places? "使用-场所?"))
  'parallel-compile-files  (cons "parallel-编译-files" (hash '#:handler "处理器" '#:options "选项" '#:use-places? "使用-场所?" '#:worker-count "工作者-数量"))
))
