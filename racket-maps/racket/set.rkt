;; racket/set
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (94/94 translated)
(define plain-map (hash
  'chaperone-hash-set  "监护-哈希-集合"
  'define-custom-set-types  "定义-自定义-集合-类型"
  'for*/mutable-set  "遍历*-可变-集合"
  'for*/mutable-setalw  "遍历*-可变-集合始终"
  'for*/mutable-seteq  "遍历*-可变-集合等同"
  'for*/mutable-seteqv  "遍历*-可变-集合等同值"
  'for*/set  "遍历*-集合"
  'for*/setalw  "遍历*-集合始终"
  'for*/seteq  "遍历*-集合等同"
  'for*/seteqv  "遍历*-集合等同值"
  'for*/weak-set  "遍历*-弱-集合"
  'for*/weak-setalw  "遍历*-弱-集合始终"
  'for*/weak-seteq  "遍历*-弱-集合等同"
  'for*/weak-seteqv  "遍历*-弱-集合等同值"
  'for/mutable-set  "遍历-可变-集合"
  'for/mutable-setalw  "遍历-可变-集合始终"
  'for/mutable-seteq  "遍历-可变-集合等同"
  'for/mutable-seteqv  "遍历-可变-集合等同值"
  'for/set  "遍历-集合"
  'for/setalw  "遍历-集合始终"
  'for/seteq  "遍历-集合等同"
  'for/seteqv  "遍历-集合等同值"
  'for/weak-set  "遍历-弱-集合"
  'for/weak-setalw  "遍历-弱-集合始终"
  'for/weak-seteq  "遍历-弱-集合等同"
  'for/weak-seteqv  "遍历-弱-集合等同值"
  'gen:set  "生成:集合"
  'generic-set?  "泛型-集合?"
  'impersonate-hash-set  "冒充-哈希-集合"
  'in-immutable-set  "在-不可变-集合"
  'in-mutable-set  "在-可变-集合"
  'in-set  "在-集合中"
  'in-weak-set  "在-弱集合-设置"
  'list->mutable-set  "列表->可变-集合"
  'list->mutable-setalw  "列表->可变-集合始终"
  'list->mutable-seteq  "列表->可变-集合等同"
  'list->mutable-seteqv  "列表->可变-集合等同值"
  'list->set  "列表->集合"
  'list->setalw  "列表->集合始终"
  'list->seteq  "列表->集合等同"
  'list->seteqv  "列表->集合等同值"
  'list->weak-set  "列表->弱-集合"
  'list->weak-setalw  "列表->弱-集合始终"
  'list->weak-seteq  "列表->弱-集合等同"
  'list->weak-seteqv  "列表->弱-集合等同值"
  'mutable-set  "可变-集合"
  'mutable-setalw  "可变-集合始终"
  'mutable-seteq  "可变-集合等同"
  'mutable-seteqv  "可变-集合等同值"
  'proper-subset?  "真-子集?"
  'set  "集合"
  'set->list  "集合->列表"
  'set->stream  "集合->流"
  'set-add  "集合-添加"
  'set-add!  "集合-添加!"
  'set-clear  "集合-清空"
  'set-clear!  "集合-清空!"
  'set-copy  "集合-复制"
  'set-copy-clear  "集合-复制-清空"
  'set-count  "集合-计数"
  'set-empty?  "集合-空?"
  'set-eq?  "集合-等同?"
  'set-equal-always?  "集合-相等-始终?"
  'set-equal?  "集合-相等?"
  'set-eqv?  "集合-等同值?"
  'set-first  "集合-第一"
  'set-for-each  "集合-遍历-每个"
  'set-implements/c  "集合-实现/合约"
  'set-implements?  "集合-实现?"
  'set-intersect  "集合-交集"
  'set-intersect!  "集合-交集!"
  'set-map  "集合-映射"
  'set-member?  "集合-成员?"
  'set-mutable?  "集合-可变?"
  'set-remove  "集合-移除"
  'set-remove!  "集合-移除!"
  'set-rest  "集合-剩余"
  'set-subtract  "集合-减去"
  'set-subtract!  "集合-减去!"
  'set-symmetric-difference  "集合-对称-差"
  'set-symmetric-difference!  "集合-对称-差!"
  'set-union  "集合-并集"
  'set-union!  "集合-并集!"
  'set-weak?  "集合-弱?"
  'set=?  "集合=?"
  'set?  "集合?"
  'setalw  "集合始终"
  'seteq  "集合等同"
  'seteqv  "集合等同值"
  'subset?  "子集?"
  'weak-set  "弱-集合"
  'weak-setalw  "弱-集合始终"
  'weak-seteq  "弱-集合等同"
  'weak-seteqv  "弱-集合等同值"
))

;; with-kw (5)
(define kw-map (hash
  'make-custom-set  (cons "创建-自定义-集合" (hash '#:elem? "元素?"))
  'make-custom-set-types  (cons "创建-自定义-集合-类型" (hash '#:elem? "元素?" '#:for "针对" '#:name "名称"))
  'make-mutable-custom-set  (cons "创建-可变-自定义-集合" (hash '#:elem? "元素?"))
  'make-weak-custom-set  (cons "创建-弱-自定义-集合" (hash '#:elem? "元素?"))
  'set/c  (cons "集合/合约" (hash '#:cmp "比较" '#:equal-key/c "相等-键/合约" '#:kind "种类" '#:lazy? "惰性?"))
))

;; kw-value-map (2 keywords)
(define kw-value-map (hash
  '#:cmp (hash 'dont-care #f 'eq #f 'equal #f 'equal-always #f 'eqv #f)
  '#:kind (hash 'dont-care #f 'immutable #f 'mutable #f 'mutable-or-weak #f 'weak #f)
))
