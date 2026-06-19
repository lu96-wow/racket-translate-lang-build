;; racket/hash
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'hash-filter  "哈希-过滤"
  'hash-filter-keys  "哈希-过滤-键"
  'hash-filter-values  "哈希-过滤-值"
))

;; with-kw (3)
(define kw-map (hash
  'hash-intersect  (cons "哈希-交集" (hash '#:combine "组合" '#:combine/key "组合/键"))
  'hash-union  (cons "哈希-并集" (hash '#:combine "组合" '#:combine/key "组合/键"))
  'hash-union!  (cons "哈希-并集!" (hash '#:combine "组合" '#:combine/key "组合/键"))
))
