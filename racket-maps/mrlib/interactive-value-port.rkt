;; mrlib/interactive-value-port
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (3)
(define kw-map (hash
  'set-interactive-display-handler  (cons "设置-interactive-显示-handler" (hash '#:snip-handler "片段-处理器"))
  'set-interactive-print-handler  (cons "设置-interactive-打印-handler" (hash '#:snip-handler "片段-处理器"))
  'set-interactive-write-handler  (cons "设置-interactive-写入-handler" (hash '#:snip-handler "片段-处理器"))
))
