;; pkg/name
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'package-source->name  "包-源->名称"
  'package-source->path  "包-源->路径"
  'package-source-format?  "包-源-格式?"
))

;; with-kw (1)
(define kw-map (hash
  'package-source->name+type  (cons "包-源->名称+类型" (hash '#:complain "投诉" '#:link-dirs? "链接-目录?" '#:must-infer-name? "必须-推断-名称?"))
))
