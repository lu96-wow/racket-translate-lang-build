;; racket/match/parse-helper
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/12 translated)
(define plain-map (hash
  'all-vars  #f
  'ddk?  #f
  'in-splicing?  #f
  'match-expander-transform  #f
  'match:syntax-err  #f
  'parse-id  #f
  'parse-literal  #f
  'parse-quote  #f
  'parse-struct  #f
  'pattern-var?  #f
  'trans-match  #f
  'trans-match*  #f
))

;; with-kw (1)
(define kw-map (hash
  'dd-parse  (cons "dd-解析" (hash '#:mutable "可变" '#:to-list "转-列表"))
))
