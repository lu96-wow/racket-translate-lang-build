;; racket/dict
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (44/44 translated)
(define plain-map (hash
  'define-custom-hash-types  "定义-自定义-哈希-类型"
  'dict->list  "字典->列表"
  'dict-can-functional-set?  "字典-可-函数式-设置?"
  'dict-can-remove-keys?  "字典-可-移除-键?"
  'dict-clear  "字典-清空"
  'dict-clear!  "字典-清空!"
  'dict-copy  "字典-复制"
  'dict-count  "字典-计数"
  'dict-empty?  "字典-空?"
  'dict-for-each  "字典-遍历-每个"
  'dict-has-key?  "字典-有-键?"
  'dict-implements/c  "字典-实现/合约"
  'dict-implements?  "字典-实现?"
  'dict-iter-contract  "字典-迭代器-合约"
  'dict-iterate-first  "字典-迭代-第一"
  'dict-iterate-key  "字典-迭代-键"
  'dict-iterate-next  "字典-迭代-下一个"
  'dict-iterate-value  "字典-迭代-值"
  'dict-key-contract  "字典-键-合约"
  'dict-keys  "字典-键"
  'dict-map  "字典-映射"
  'dict-map/copy  "字典-映射/复制"
  'dict-mutable?  "字典-可变?"
  'dict-ref  "字典-引用"
  'dict-ref!  "字典-引用!"
  'dict-remove  "字典-移除"
  'dict-remove!  "字典-移除!"
  'dict-set  "字典-设置"
  'dict-set!  "字典-设置!"
  'dict-set*  "字典-设置*"
  'dict-set*!  "字典-设置*!"
  'dict-update  "字典-更新"
  'dict-update!  "字典-更新!"
  'dict-value-contract  "字典-值-合约"
  'dict-values  "字典-值"
  'dict?  "字典?"
  'gen:dict  "生成:字典"
  'in-dict  "在-字典中"
  'in-dict-keys  "在-字典-键"
  'in-dict-pairs  "在-字典-对"
  'in-dict-values  "在-字典-值"
  'keyword-apply/dict  "关键字-应用/字典"
  'prop:dict  "属性:字典"
  'prop:dict/contract  "属性:字典/合约"
))

;; with-kw (4)
(define kw-map (hash
  'make-custom-hash  (cons "创建-自定义-哈希" (hash '#:key? #f))
  'make-custom-hash-types  (cons "创建-自定义-哈希-类型" (hash '#:for #f '#:key? #f '#:name #f))
  'make-immutable-custom-hash  (cons "创建-不可变-自定义-哈希" (hash '#:key? #f))
  'make-weak-custom-hash  (cons "创建-弱-自定义-哈希" (hash '#:key? #f))
))
