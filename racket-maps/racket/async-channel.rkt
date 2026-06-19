;; racket/async-channel
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (9/9 translated)
(define plain-map (hash
  'async-channel-get  "异步通道-获取"
  'async-channel-put  "异步通道-放入"
  'async-channel-put-evt  "异步通道-放入-事件"
  'async-channel-try-get  "异步通道-尝试-获取"
  'async-channel/c  "异步通道/契约"
  'async-channel?  "异步通道?"
  'chaperone-async-channel  "监护-异步通道"
  'impersonate-async-channel  "模拟-异步通道"
  'make-async-channel  "创建-异步通道"
))

