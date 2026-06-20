;; file/tar
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (8/8 translated)
(define plain-map (hash
  'struct:tar-entry  "结构:tar-条目"
  'tar-entry  "tar-条目"
  'tar-entry-attribs  "tar-条目-属性"
  'tar-entry-content  "tar-条目-内容"
  'tar-entry-kind  "tar-条目-种类"
  'tar-entry-path  "tar-条目-路径"
  'tar-entry-size  "tar-条目-大小"
  'tar-entry?  "tar-条目?"
))

;; with-kw (3)
(define kw-map (hash
  'tar  (cons "tar" (hash '#:exists-ok? "存在-可以?" '#:follow-links? "跟随-链接?" '#:format "格式" '#:get-timestamp "获取-时间戳" '#:path-filter "路径-过滤" '#:path-prefix "路径-前缀" '#:timestamp "时间戳"))
  'tar->output  (cons "tar->输出" (hash '#:follow-links? "跟随-链接?" '#:format "格式" '#:get-timestamp "获取-时间戳" '#:path-prefix "路径-前缀" '#:timestamp "时间戳"))
  'tar-gzip  (cons "tar-gzip" (hash '#:exists-ok? "存在-可以?" '#:follow-links? "跟随-链接?" '#:format "格式" '#:get-timestamp "获取-时间戳" '#:path-filter "路径-过滤" '#:path-prefix "路径-前缀" '#:timestamp "时间戳"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:format #hash((gnu . "gnu") (pax . "pax") (ustar . "ustar"))
))
