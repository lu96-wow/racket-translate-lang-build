;; pkg/path
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (21/21 translated)
(define plain-map (hash
  'get-pkgs-dir  "获取-包-目录"
  'pkg-info  "包-信息"
  'pkg-info-auto?  "包-信息-自动?"
  'pkg-info-checksum  "包-信息-校验和"
  'pkg-info-orig-pkg  "包-信息-原始-包"
  'pkg-info/alt  "包-信息/替代"
  'pkg-info/alt-dir-name  "包-信息/替代-目录-名称"
  'pkg-info/alt?  "包-信息/替代?"
  'pkg-info?  "包-信息?"
  'read-pkg-file-hash  "读取-包-文件-哈希"
  'read-pkgs-db  "读取-包-数据库"
  'sc-pkg-info  "SC-包-信息"
  'sc-pkg-info-collect  "SC-包-信息-收集"
  'sc-pkg-info/alt  "SC-包-信息/替代"
  'sc-pkg-info/alt-dir-name  "SC-包-信息/替代-目录-名称"
  'sc-pkg-info/alt?  "SC-包-信息/替代?"
  'sc-pkg-info?  "SC-包-信息?"
  'struct:pkg-info  "结构:包-信息"
  'struct:pkg-info/alt  "结构:包-信息/替代"
  'struct:sc-pkg-info  "结构:SC-包-信息"
  'struct:sc-pkg-info/alt  "结构:SC-包-信息/替代"
))

;; with-kw (5)
(define kw-map (hash
  'path->pkg  (cons "路径->包" (hash '#:cache "缓存"))
  'path->pkg+subpath  (cons "路径->包+子路径" (hash '#:cache "缓存"))
  'path->pkg+subpath+collect  (cons "路径->包+子路径+收集" (hash '#:cache "缓存"))
  'path->pkg+subpath+collect+scope  (cons "路径->包+子路径+收集+作用域" (hash '#:cache "缓存"))
  'path->pkg+subpath+scope  (cons "路径->包+子路径+作用域" (hash '#:cache "缓存"))
))
