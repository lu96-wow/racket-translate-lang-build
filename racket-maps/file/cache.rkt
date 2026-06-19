;; file/cache
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'cache-file  (cons #f (hash '#:evict-before? #f '#:exists-ok? #f '#:log-debug-string #f '#:log-error-string #f '#:max-cache-files #f '#:max-cache-size #f '#:notify-cache-use #f))
  'cache-remove  (cons #f (hash '#:log-debug-string #f '#:log-error-string #f))
))
