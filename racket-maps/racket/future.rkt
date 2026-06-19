;; racket/future
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (15/15 translated)
(define plain-map (hash
  'current-future  "当前-未来"
  'for*/async  "for*/异步"
  'for/async  "for/异步"
  'fsemaphore-count  "未来信号量-计数"
  'fsemaphore-post  "未来信号量-发送"
  'fsemaphore-try-wait?  "未来信号量-尝试-等待?"
  'fsemaphore-wait  "未来信号量-等待"
  'fsemaphore?  "未来信号量?"
  'future  "未来"
  'future?  "未来?"
  'futures-enabled?  "未来-已启用?"
  'make-fsemaphore  "创建-未来信号量"
  'processor-count  "处理器-计数"
  'touch  "触及"
  'would-be-future  "将是-未来"
))

