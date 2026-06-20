;; file/cache
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'cache-file  (cons "cache-文件" (hash '#:evict-before? "驱逐前?" '#:exists-ok? "存在-确认?" '#:log-debug-string "日志-调试-字符串" '#:log-error-string "日志-错误-字符串" '#:max-cache-files "最大-缓存-文件数" '#:max-cache-size "最大-缓存-大小" '#:notify-cache-use "通知-缓存-使用"))
  'cache-remove  (cons "cache-移除" (hash '#:log-debug-string "日志-调试-字符串" '#:log-error-string "日志-错误-字符串"))
))
