;; racket/list
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (64/64 translated)
(define plain-map (hash
  'append*  "追加*"
  'append-map  "追加-映射"
  'argmax  "自变量最大"
  'argmin  "自变量最小"
  'cartesian-product  "笛卡尔-积"
  'combinations  "组合集"
  'cons?  "构造?"
  'count  "计数"
  'drop  "丢弃"
  'drop-common-prefix  "丢弃-公共-前缀"
  'drop-right  "丢弃-右边"
  'dropf  "丢弃过滤"
  'dropf-right  "丢弃过滤-右边"
  'eighth  "第八"
  'eleventh  "第十一"
  'empty  "空"
  'empty?  "空?"
  'fifteenth  "第十五"
  'fifth  "第五"
  'filter-map  "过滤-映射"
  'filter-not  "过滤-非"
  'first  "第一"
  'flatten  "扁平化"
  'fourteenth  "第十四"
  'fourth  "第四"
  'group-by  "分组-依据"
  'in-combinations  "在-组合中"
  'in-permutations  "在-排列中"
  'inclusive-range  "包含-范围"
  'index-of  "索引-之"
  'index-where  "索引-之处"
  'indexes-of  "索引-之复数"
  'indexes-where  "索引-之处复数"
  'last  "最后"
  'last-pair  "最后-对"
  'list-prefix?  "列表-前缀?"
  'list-set  "列表-设置"
  'list-update  "列表-更新"
  'make-list  "创建-列表"
  'ninth  "第九"
  'partition  "分区"
  'permutations  "排列"
  'range  "范围"
  'remf  "移除过滤"
  'remf*  "移除过滤*"
  'rest  "剩余"
  'second  "第二"
  'seventh  "第七"
  'shuffle  "打乱"
  'sixth  "第六"
  'split-at  "分割-于"
  'split-at-right  "分割-于-右边"
  'split-common-prefix  "分割-公共-前缀"
  'splitf-at  "分割过滤-于"
  'splitf-at-right  "分割过滤-于-右边"
  'take  "取"
  'take-common-prefix  "取-公共-前缀"
  'take-right  "取-右边"
  'takef  "取过滤"
  'takef-right  "取过滤-右边"
  'tenth  "第十"
  'third  "第三"
  'thirteenth  "第十三"
  'twelfth  "第十二"
))

;; with-kw (3)
(define kw-map (hash
  'add-between  (cons "添加-之间" (hash '#:after-last "之后-最后" '#:before-first "之前-第一" '#:before-last "之前-最后" '#:splice? "拼接?"))
  'check-duplicates  (cons "检查-重复" (hash '#:default "默认" '#:key "键"))
  'remove-duplicates  (cons "移除-重复" (hash '#:key "键"))
))
