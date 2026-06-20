;; mrlib/gif
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'write-gif  #f
))

;; with-kw (1)
(define kw-map (hash
  'write-animated-gif  (cons "写入-动画-gif" (hash '#:disposal "释放" '#:last-frame-delay "最后帧-延迟" '#:loop? "循环?" '#:one-at-a-time? "逐个?"))
))
