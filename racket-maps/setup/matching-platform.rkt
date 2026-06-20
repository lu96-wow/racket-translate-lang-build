;; setup/matching-platform
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'platform-spec?  #f
))

;; with-kw (1)
(define kw-map (hash
  'matching-platform?  (cons "匹配-平台?" (hash '#:cross? "交叉?" '#:system-library-subpath "系统-库-子路径" '#:system-type "系统-类型"))
))
