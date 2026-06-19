;; syntax/id-set
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/64 translated)
(define plain-map (hash
  'bound-id-proper-subset?  #f
  'bound-id-set->list  #f
  'bound-id-set->stream  #f
  'bound-id-set-add  #f
  'bound-id-set-add!  #f
  'bound-id-set-clear  #f
  'bound-id-set-clear!  #f
  'bound-id-set-copy  #f
  'bound-id-set-copy-clear  #f
  'bound-id-set-count  #f
  'bound-id-set-empty?  #f
  'bound-id-set-first  #f
  'bound-id-set-for-each  #f
  'bound-id-set-intersect  #f
  'bound-id-set-intersect!  #f
  'bound-id-set-map  #f
  'bound-id-set-member?  #f
  'bound-id-set-remove  #f
  'bound-id-set-remove!  #f
  'bound-id-set-rest  #f
  'bound-id-set-subtract  #f
  'bound-id-set-subtract!  #f
  'bound-id-set-symmetric-difference  #f
  'bound-id-set-symmetric-difference!  #f
  'bound-id-set-union  #f
  'bound-id-set-union!  #f
  'bound-id-set=?  #f
  'bound-id-set?  #f
  'bound-id-subset?  #f
  'free-id-proper-subset?  #f
  'free-id-set->list  #f
  'free-id-set->stream  #f
  'free-id-set-add  #f
  'free-id-set-add!  #f
  'free-id-set-clear  #f
  'free-id-set-clear!  #f
  'free-id-set-copy  #f
  'free-id-set-copy-clear  #f
  'free-id-set-count  #f
  'free-id-set-empty?  #f
  'free-id-set-first  #f
  'free-id-set-for-each  #f
  'free-id-set-intersect  #f
  'free-id-set-intersect!  #f
  'free-id-set-map  #f
  'free-id-set-member?  #f
  'free-id-set-remove  #f
  'free-id-set-remove!  #f
  'free-id-set-rest  #f
  'free-id-set-subtract  #f
  'free-id-set-subtract!  #f
  'free-id-set-symmetric-difference  #f
  'free-id-set-symmetric-difference!  #f
  'free-id-set-union  #f
  'free-id-set-union!  #f
  'free-id-set=?  #f
  'free-id-set?  #f
  'free-id-subset?  #f
  'immutable-bound-id-set?  #f
  'immutable-free-id-set?  #f
  'in-bound-id-set  #f
  'in-free-id-set  #f
  'mutable-bound-id-set?  #f
  'mutable-free-id-set?  #f
))

;; with-kw (7)
(define kw-map (hash
  'bound-id-set/c  (cons #f (hash '#:mutability #f))
  'free-id-set/c  (cons #f (hash '#:mutability #f))
  'id-set/c  (cons #f (hash '#:idsettype #f '#:mutability #f))
  'immutable-bound-id-set  (cons #f (hash '#:phase #f))
  'immutable-free-id-set  (cons #f (hash '#:phase #f))
  'mutable-bound-id-set  (cons #f (hash '#:phase #f))
  'mutable-free-id-set  (cons #f (hash '#:phase #f))
))
