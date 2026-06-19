;; pkg/db
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (22/22 translated)
(define plain-map (hash
  'call-with-pkgs-transaction  "调用-带-包-事务"
  'current-pkg-catalog-file  "当前-包-目录-文件"
  'get-catalogs  "获取-目录"
  'get-module-pkgs  "获取-模块-包"
  'get-pkg-dependencies  "获取-包-依赖"
  'get-pkg-modules  "获取-包-模块"
  'get-pkg-ring  "获取-包-环"
  'get-pkg-tags  "获取-包-标签"
  'pkg  "包"
  'pkg-author  "包-作者"
  'pkg-catalog  "包-分类目录"
  'pkg-checksum  "包-校验和"
  'pkg-desc  "包-描述"
  'pkg-name  "包-名称"
  'pkg-source  "包-源"
  'pkg?  "包?"
  'set-catalogs!  "设置-目录!"
  'set-pkg-dependencies!  "设置-包-依赖!"
  'set-pkg-modules!  "设置-包-模块!"
  'set-pkg-ring!  "设置-包-环!"
  'set-pkg-tags!  "设置-包-标签!"
  'struct:pkg  "结构:包"
))

;; with-kw (4)
(define kw-map (hash
  'get-pkgs  (cons "获取-包" (hash '#:catalog "目录" '#:name "名称"))
  'get-pkgs-without-modules  (cons "获取-无-模块-包" (hash '#:catalog "目录"))
  'set-pkg!  (cons "设置-包!" (hash '#:clear-other-checksums? "清除-其他-校验和?"))
  'set-pkgs!  (cons "设置-包集!" (hash '#:clear-other-checksums? "清除-其他-校验和?"))
))
