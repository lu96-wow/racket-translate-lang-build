;; data/queue
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (13/13 translated)
(define plain-map (hash
  'dequeue!  "出队!"
  'enqueue!  "入队!"
  'enqueue-front!  "入队-前!"
  'in-queue  "在-队列"
  'make-queue  "创建-队列"
  'non-empty-queue?  "非-空-队列?"
  'nonempty-queue/c  "非空-队列/合同"
  'queue->list  "队列->列表"
  'queue-empty?  "队列-空?"
  'queue-filter!  "队列-过滤!"
  'queue-length  "队列-长度"
  'queue/c  "队列/合同"
  'queue?  "队列?"
))

