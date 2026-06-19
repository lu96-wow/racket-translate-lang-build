;; racket/sequence
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (16/16 translated)
(define plain-map (hash
  'empty-sequence  "空-序列"
  'in-slice  "在-切片中"
  'in-syntax  "在-语法中"
  'sequence->list  "序列->列表"
  'sequence-add-between  "序列-添加-之间"
  'sequence-andmap  "序列-全称映射"
  'sequence-append  "序列-追加"
  'sequence-count  "序列-计数"
  'sequence-filter  "序列-过滤"
  'sequence-fold  "序列-折叠"
  'sequence-for-each  "序列-遍历-每个"
  'sequence-length  "序列-长度"
  'sequence-map  "序列-映射"
  'sequence-ormap  "序列-存在映射"
  'sequence-ref  "序列-引用"
  'sequence-tail  "序列-尾部"
))

;; with-kw (2)
(define kw-map (hash
  'initiate-sequence  (cons "初始化-序列" (hash '#:continue-after-pos+val? "在-位置+值-后-继续?" '#:continue-with-pos? "用-位置-继续?" '#:continue-with-val? "用-值-继续?" '#:early-next-pos "早期-下一个-位置" '#:init-pos "初始-位置" '#:next-pos "下一个-位置" '#:pos->element "位置->元素"))
  'sequence/c  (cons "序列/合约" (hash '#:min-count "最小-计数"))
))
