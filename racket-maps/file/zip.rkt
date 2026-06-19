;; file/zip
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'zip-verbose  "压缩-详细"
))

;; with-kw (2)
(define kw-map (hash
  'zip  (cons "压缩" (hash '#:get-timestamp "获取-时间戳" '#:path-prefix "路径-前缀" '#:round-timestamps-down? "向下取整-时间戳?" '#:system-type "系统-类型" '#:timestamp "时间戳" '#:utc-timestamps? "UTC-时间戳?"))
  'zip->output  (cons "压缩->输出" (hash '#:get-timestamp "获取-时间戳" '#:path-prefix "路径-前缀" '#:round-timestamps-down? "向下取整-时间戳?" '#:system-type "系统-类型" '#:timestamp "时间戳" '#:utc-timestamps? "UTC-时间戳?"))
))
