;; syntax/template
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'transform-template  (cons "变换-模板" (hash '#:cons-stx "构造-语法" '#:constant-as-leaf? "常量-作为-叶?" '#:ellipses-end-stx "省略号-结束-语法" '#:leaf-datum-stx "叶-数据-语法" '#:leaf-restore-stx "叶-恢复-语法" '#:leaf-save "叶-保存" '#:pvar-restore-stx "模式变量-恢复-语法" '#:pvar-save "模式变量-保存" '#:restore-stx "恢复-语法" '#:save "保存"))
))
