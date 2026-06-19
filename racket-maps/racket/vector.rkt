;; racket/vector
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (26/26 translated)
(define plain-map (hash
  'vector*-append  "向量*-追加"
  'vector*-copy  "向量*-复制"
  'vector*-extend  "向量*-扩展"
  'vector*-set/copy  "向量*-设置/复制"
  'vector-append  "向量-追加"
  'vector-argmax  "向量-自变量最大"
  'vector-argmin  "向量-自变量最小"
  'vector-copy  "向量-复制"
  'vector-count  "向量-计数"
  'vector-drop  "向量-丢弃"
  'vector-drop-right  "向量-丢弃-右边"
  'vector-empty?  "向量-空?"
  'vector-extend  "向量-扩展"
  'vector-filter  "向量-过滤"
  'vector-filter-not  "向量-过滤-非"
  'vector-map  "向量-映射"
  'vector-map!  "向量-映射!"
  'vector-member  "向量-成员"
  'vector-memq  "向量-成员eq"
  'vector-memv  "向量-成员eqv"
  'vector-set*!  "向量-设置*!"
  'vector-set/copy  "向量-设置/复制"
  'vector-split-at  "向量-分割-于"
  'vector-split-at-right  "向量-分割-于-右边"
  'vector-take  "向量-取"
  'vector-take-right  "向量-取-右边"
))

;; with-kw (2)
(define kw-map (hash
  'vector-sort  (cons "向量-排序" (hash '#:cache-keys? "缓存-键?" '#:key "键"))
  'vector-sort!  (cons "向量-排序!" (hash '#:cache-keys? "缓存-键?" '#:key "键"))
))
