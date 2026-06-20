;; compiler/distribute
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'assemble-distribution  (cons "组装-发布" (hash '#:collects-path "集合包-路径" '#:copy-collects "复制-集合包" '#:executables? "可执行文件?" '#:relative-base "相对-基础"))
))
