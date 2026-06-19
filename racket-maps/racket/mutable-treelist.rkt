;; racket/mutable-treelist
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (35/35 translated)
(define plain-map (hash
  'for*/mutable-treelist  "for*/可变-树列表"
  'for/mutable-treelist  "for/可变-树列表"
  'in-mutable-treelist  "在-可变-树列表"
  'list->mutable-treelist  "列表->可变-树列表"
  'make-mutable-treelist  "创建-可变-树列表"
  'mutable-treelist  "可变-树列表"
  'mutable-treelist->list  "可变-树列表->列表"
  'mutable-treelist->vector  "可变-树列表->向量"
  'mutable-treelist-add!  "可变-树列表-添加!"
  'mutable-treelist-append!  "可变-树列表-追加!"
  'mutable-treelist-cons!  "可变-树列表-构造!"
  'mutable-treelist-copy  "可变-树列表-复制"
  'mutable-treelist-delete!  "可变-树列表-删除!"
  'mutable-treelist-drop!  "可变-树列表-丢弃!"
  'mutable-treelist-drop-right!  "可变-树列表-丢弃-右边!"
  'mutable-treelist-empty?  "可变-树列表-空?"
  'mutable-treelist-find  "可变-树列表-查找"
  'mutable-treelist-first  "可变-树列表-第一"
  'mutable-treelist-for-each  "可变-树列表-对于-每个"
  'mutable-treelist-insert!  "可变-树列表-插入!"
  'mutable-treelist-last  "可变-树列表-最后"
  'mutable-treelist-length  "可变-树列表-长度"
  'mutable-treelist-map!  "可变-树列表-映射!"
  'mutable-treelist-member?  "可变-树列表-成员?"
  'mutable-treelist-prepend!  "可变-树列表-前置!"
  'mutable-treelist-ref  "可变-树列表-引用"
  'mutable-treelist-reverse!  "可变-树列表-反转!"
  'mutable-treelist-set!  "可变-树列表-设置!"
  'mutable-treelist-snapshot  "可变-树列表-快照"
  'mutable-treelist-sublist!  "可变-树列表-子列表!"
  'mutable-treelist-take!  "可变-树列表-取!"
  'mutable-treelist-take-right!  "可变-树列表-取-右边!"
  'mutable-treelist?  "可变-树列表?"
  'treelist-copy  "树列表-复制"
  'vector->mutable-treelist  "向量->可变-树列表"
))

;; with-kw (3)
(define kw-map (hash
  'chaperone-mutable-treelist  (cons "监护-可变-树列表" (hash '#:append #f '#:insert #f '#:prepend #f '#:ref #f '#:set #f))
  'impersonate-mutable-treelist  (cons "模拟-可变-树列表" (hash '#:append #f '#:insert #f '#:prepend #f '#:ref #f '#:set #f))
  'mutable-treelist-sort!  (cons "可变-树列表-排序!" (hash '#:cache-keys? #f '#:key #f))
))
