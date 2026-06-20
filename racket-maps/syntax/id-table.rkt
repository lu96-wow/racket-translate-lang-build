;; syntax/id-table
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/47 translated)
(define plain-map (hash
  'bound-id-table-count  #f
  'bound-id-table-for-each  #f
  'bound-id-table-iterate-first  #f
  'bound-id-table-iterate-key  #f
  'bound-id-table-iterate-next  #f
  'bound-id-table-iterate-value  #f
  'bound-id-table-keys  #f
  'bound-id-table-map  #f
  'bound-id-table-ref  #f
  'bound-id-table-ref!  #f
  'bound-id-table-remove  #f
  'bound-id-table-remove!  #f
  'bound-id-table-set  #f
  'bound-id-table-set!  #f
  'bound-id-table-set*  #f
  'bound-id-table-set*!  #f
  'bound-id-table-update  #f
  'bound-id-table-update!  #f
  'bound-id-table-values  #f
  'bound-id-table?  #f
  'free-id-table-count  #f
  'free-id-table-for-each  #f
  'free-id-table-iterate-first  #f
  'free-id-table-iterate-key  #f
  'free-id-table-iterate-next  #f
  'free-id-table-iterate-value  #f
  'free-id-table-keys  #f
  'free-id-table-map  #f
  'free-id-table-ref  #f
  'free-id-table-ref!  #f
  'free-id-table-remove  #f
  'free-id-table-remove!  #f
  'free-id-table-set  #f
  'free-id-table-set!  #f
  'free-id-table-set*  #f
  'free-id-table-set*!  #f
  'free-id-table-update  #f
  'free-id-table-update!  #f
  'free-id-table-values  #f
  'free-id-table?  #f
  'id-table-iter?  #f
  'immutable-bound-id-table?  #f
  'immutable-free-id-table?  #f
  'in-bound-id-table  #f
  'in-free-id-table  #f
  'mutable-bound-id-table?  #f
  'mutable-free-id-table?  #f
))

;; with-kw (6)
(define kw-map (hash
  'bound-id-table/c  (cons "绑定-标识符-table/c" (hash '#:immutable "不可变"))
  'free-id-table/c  (cons "自由-标识符-table/c" (hash '#:immutable "不可变"))
  'make-bound-id-table  (cons "创建-绑定-标识符-表" (hash '#:phase "阶段"))
  'make-free-id-table  (cons "创建-自由-标识符-表" (hash '#:phase "阶段"))
  'make-immutable-bound-id-table  (cons "创建-不可变-绑定-标识符-表" (hash '#:phase "阶段"))
  'make-immutable-free-id-table  (cons "创建-不可变-自由-标识符-表" (hash '#:phase "阶段"))
))
