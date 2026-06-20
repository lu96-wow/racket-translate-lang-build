;; syntax/contract
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'wrap-expr/c  (cons "包装-表达式/c" (hash '#:arg? "参数?" '#:context "上下文" '#:macro "宏" '#:name "名称" '#:negative "负数" '#:phase "阶段" '#:positive "正数"))
))

;; kw-value-map (2 keywords)
(define kw-value-map (hash
  '#:negative #hash((from-macro . "来自-宏") (unknown . "未知") (use-site . "使用-位置"))
  '#:positive #hash((from-macro . "来自-宏") (unknown . "未知") (use-site . "使用-位置"))
))
