;; syntax/parse/pre
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/58 translated)
(define plain-map (hash
  '...+  #f
  'attribute  #f
  'boolean  #f
  'char  #f
  'character  #f
  'define-conventions  #f
  'define-eh-alternative-set  #f
  'define-literal-set  #f
  'define-splicing-syntax-class  #f
  'define-syntax-class  #f
  'define/syntax-parse  #f
  'exact-integer  #f
  'exact-nonnegative-integer  #f
  'exact-positive-integer  #f
  'expr  #f
  'id  #f
  'identifier  #f
  'integer  #f
  'kernel-literals  #f
  'keyword  #f
  'literal-set->predicate  #f
  'nat  #f
  'number  #f
  'pattern  #f
  'static  #f
  'str  #f
  'syntax-parse  #f
  'syntax-parse-state-cons!  #f
  'syntax-parse-state-ref  #f
  'syntax-parse-state-set!  #f
  'syntax-parse-state-update!  #f
  'syntax-parser  #f
  'this-syntax  #f
  '~!  #f
  '~alt  #f
  '~and  #f
  '~between  #f
  '~bind  #f
  '~commit  #f
  '~datum  #f
  '~delimit-cut  #f
  '~describe  #f
  '~do  #f
  '~fail  #f
  '~literal  #f
  '~not  #f
  '~once  #f
  '~optional  #f
  '~or  #f
  '~or*  #f
  '~parse  #f
  '~peek  #f
  '~peek-not  #f
  '~post  #f
  '~rest  #f
  '~seq  #f
  '~undo  #f
  '~var  #f
))

;; with-kw (1)
(define kw-map (hash
  'syntax-parse-track-literals  (cons #f (hash '#:introduce? #f))
))
