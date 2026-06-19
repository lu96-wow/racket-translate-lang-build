;; racket/promise
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (14/14 translated)
(define plain-map (hash
  'delay  "延迟"
  'delay/idle  "延迟/空闲"
  'delay/name  "延迟/名称"
  'delay/strict  "延迟/严格"
  'delay/sync  "延迟/同步"
  'delay/thread  "延迟/线程"
  'for*/list/concurrent  "for*/列表/并发"
  'for/list/concurrent  "for/列表/并发"
  'force  "强制"
  'lazy  "惰性"
  'promise-forced?  "承诺-已强制?"
  'promise-running?  "承诺-运行中?"
  'promise/name?  "承诺/名称?"
  'promise?  "承诺?"
))

