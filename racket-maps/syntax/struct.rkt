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
  'build-struct-expand-info  (cons #f (hash '#:constructor-name #f '#:omit-constructor? #f '#:omit-struct-type? #f))
  'build-struct-generation  (cons #f (hash '#:constructor-name #f))
  'build-struct-names  (cons #f (hash '#:constructor-name #f))
  'generate-struct-declaration  (cons #f (hash '#:constructor-name #f))
))
