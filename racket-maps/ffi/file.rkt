;; ffi/file
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (6/6 translated)
(define plain-map (hash
  '_file/guard  "_文件/守卫"
  '_file/r  "_文件/读"
  '_file/rw  "_文件/读写"
  'security-guard-check-file  "安全-守卫-检查-文件"
  'security-guard-check-file-link  "安全-守卫-检查-文件-链接"
  'security-guard-check-network  "安全-守卫-检查-网络"
))

