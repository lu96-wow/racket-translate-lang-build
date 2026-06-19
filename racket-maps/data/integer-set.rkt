;; data/integer-set
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (20/20 translated)
(define plain-map (hash
  'complement  "补集"
  'count  "计数"
  'foldr  "右-折叠"
  'get-integer  "获取-整数"
  'integer-set  "整数-集合"
  'integer-set-contents  "整数-集合-内容"
  'integer-set?  "整数-集合?"
  'intersect  "交集"
  'make-integer-set  "创建-整数-集合"
  'make-range  "创建-范围"
  'member?  "成员?"
  'partition  "分区"
  'set-integer-set-contents!  "设置-整数-集合-内容!"
  'split  "拆分"
  'struct:integer-set  "结构:整数-集合"
  'subset?  "子集?"
  'subtract  "减去"
  'symmetric-difference  "对称-差"
  'union  "并集"
  'well-formed-set?  "格式良好-集合?"
))

