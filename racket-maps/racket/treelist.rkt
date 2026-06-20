;; racket/treelist
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (39/39 translated)
(define plain-map (hash
  'empty-treelist  "空-树列表"
  'for*/treelist  "for*/树列表"
  'for/treelist  "for/树列表"
  'in-treelist  "在-树列表"
  'list->treelist  "列表->树列表"
  'make-treelist  "创建-树列表"
  'sequence->treelist  "序列->树列表"
  'treelist  "树列表"
  'treelist->list  "树列表->列表"
  'treelist->vector  "树列表->向量"
  'treelist-add  "树列表-添加"
  'treelist-append  "树列表-追加"
  'treelist-append*  "树列表-追加*"
  'treelist-chaperone-state  "树列表-监护-状态"
  'treelist-cons  "树列表-构造"
  'treelist-delete  "树列表-删除"
  'treelist-drop  "树列表-丢弃"
  'treelist-drop-right  "树列表-丢弃-右边"
  'treelist-empty?  "树列表-空?"
  'treelist-filter  "树列表-过滤"
  'treelist-find  "树列表-查找"
  'treelist-first  "树列表-第一"
  'treelist-flatten  "树列表-扁平化"
  'treelist-for-each  "树列表-对于-每个"
  'treelist-index-of  "树列表-索引-之"
  'treelist-insert  "树列表-插入"
  'treelist-last  "树列表-最后"
  'treelist-length  "树列表-长度"
  'treelist-map  "树列表-映射"
  'treelist-member?  "树列表-成员?"
  'treelist-ref  "树列表-引用"
  'treelist-rest  "树列表-剩余"
  'treelist-reverse  "树列表-反转"
  'treelist-set  "树列表-设置"
  'treelist-sublist  "树列表-子列表"
  'treelist-take  "树列表-取"
  'treelist-take-right  "树列表-取-右边"
  'treelist?  "树列表?"
  'vector->treelist  "向量->树列表"
))

;; with-kw (2)
(define kw-map (hash
  'chaperone-treelist  (cons "监护-树列表" (hash '#:append "追加" '#:append2 "追加2" '#:delete "删除" '#:drop "丢弃" '#:insert "插入" '#:prepend "前置" '#:ref "引用" '#:set "设置" '#:state "状态" '#:state-key "状态-键" '#:take "取"))
  'treelist-sort  (cons "树列表-排序" (hash '#:cache-keys? "缓存-键?" '#:key "键"))
))
