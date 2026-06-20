;; racket/logging
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'log-level/c  "日志-级别/契约"
))

;; with-kw (2)
(define kw-map (hash
  'with-intercepted-logging  (cons "带-拦截-日志" (hash '#:logger "日志器"))
  'with-logging-to-port  (cons "带-日志-到-端口" (hash '#:logger "日志器"))
))
