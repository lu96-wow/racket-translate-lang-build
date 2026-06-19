;; racket/splicing
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (12/12 translated)
(define plain-map (hash
  'splicing-let  "拼接-let"
  'splicing-let-syntax  "拼接-let-语法"
  'splicing-let-syntaxes  "拼接-let-语法集"
  'splicing-let-values  "拼接-let-值"
  'splicing-letrec  "拼接-letrec"
  'splicing-letrec-syntax  "拼接-letrec-语法"
  'splicing-letrec-syntaxes  "拼接-letrec-语法集"
  'splicing-letrec-syntaxes+values  "拼接-letrec-语法集+值"
  'splicing-letrec-values  "拼接-letrec-值"
  'splicing-local  "拼接-局部"
  'splicing-parameterize  "拼接-参数化"
  'splicing-syntax-parameterize  "拼接-语法-参数化"
))

