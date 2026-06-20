;; racket/pretty
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (21/21 translated)
(define plain-map (hash
  'make-tentative-pretty-print-output-port  "创建-暂定-美化-打印-输出-端口"
  'pretty-print-.-symbol-without-bars  "美化-打印-.-符号-无-竖线"
  'pretty-print-abbreviate-read-macros  "美化-打印-缩写-读取-宏"
  'pretty-print-columns  "美化-打印-列"
  'pretty-print-current-style-table  "美化-打印-当前-样式-表"
  'pretty-print-depth  "美化-打印-深度"
  'pretty-print-exact-as-decimal  "美化-打印-精确-作为-小数"
  'pretty-print-extend-style-table  "美化-打印-扩展-样式-表"
  'pretty-print-handler  "美化-打印-处理器"
  'pretty-print-newline  "美化-打印-换行"
  'pretty-print-post-print-hook  "美化-打印-后-打印-钩子"
  'pretty-print-pre-print-hook  "美化-打印-前-打印-钩子"
  'pretty-print-print-hook  "美化-打印-打印-钩子"
  'pretty-print-print-line  "美化-打印-打印-行"
  'pretty-print-remap-stylable  "美化-打印-重映射-可样式化"
  'pretty-print-show-inexactness  "美化-打印-显示-不精确"
  'pretty-print-size-hook  "美化-打印-大小-钩子"
  'pretty-print-style-table?  "美化-打印-样式-表?"
  'pretty-printing  "美化-打印中"
  'tentative-pretty-print-port-cancel  "暂定-美化-打印-端口-取消"
  'tentative-pretty-print-port-transfer  "暂定-美化-打印-端口-转移"
))

;; with-kw (4)
(define kw-map (hash
  'pretty-display  (cons "美化-显示" (hash '#:newline? "换行?"))
  'pretty-format  (cons "美化-格式" (hash '#:mode "模式"))
  'pretty-print  (cons "美化-打印" (hash '#:newline? "换行?"))
  'pretty-write  (cons "美化-写" (hash '#:newline? "换行?"))
))
