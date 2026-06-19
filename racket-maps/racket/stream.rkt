;; racket/stream
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (30/30 translated)
(define plain-map (hash
  'empty-stream  "空-流"
  'for*/stream  "遍历*/流"
  'for/stream  "遍历/流"
  'gen:stream  "生成:流"
  'in-stream  "在-流中"
  'prop:stream  "属性:流"
  'stream  "流"
  'stream*  "流*"
  'stream->list  "流->列表"
  'stream-add-between  "流-添加-之间"
  'stream-andmap  "流-全称映射"
  'stream-append  "流-追加"
  'stream-cons  "流-构造"
  'stream-count  "流-计数"
  'stream-empty?  "流-空?"
  'stream-filter  "流-过滤"
  'stream-first  "流-第一"
  'stream-fold  "流-折叠"
  'stream-for-each  "流-遍历-每个"
  'stream-force  "流-强制"
  'stream-lazy  "流-惰性"
  'stream-length  "流-长度"
  'stream-map  "流-映射"
  'stream-ormap  "流-存在映射"
  'stream-ref  "流-引用"
  'stream-rest  "流-剩余"
  'stream-tail  "流-尾部"
  'stream-take  "流-取前"
  'stream/c  "流/合约"
  'stream?  "流?"
))

