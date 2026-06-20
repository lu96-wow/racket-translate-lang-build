;; syntax/struct
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/4 translated)
(define plain-map (hash
  'build-struct-generation*  #f
  'extract-struct-info  "提取-结构-信息"
  'parse-define-struct  #f
  'struct-declaration-info?  #f
))

;; with-kw (4)
(define kw-map (hash
  'build-struct-expand-info  (cons "build-结构-expand-信息" (hash '#:constructor-name "构造器-名称" '#:omit-constructor? "省略-构造器?" '#:omit-struct-type? "省略-结构-类型?"))
  'build-struct-generation  (cons "build-结构-generation" (hash '#:constructor-name "构造器-名称"))
  'build-struct-names  (cons "build-结构-names" (hash '#:constructor-name "构造器-名称"))
  'generate-struct-declaration  (cons "generate-结构-declaration" (hash '#:constructor-name "构造器-名称"))
))
