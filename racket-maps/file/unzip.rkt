;; file/unzip
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (12/12 translated)
(define plain-map (hash
  'call-with-unzip-entry  "调用-带-解压-条目"
  'exn:fail:unzip:no-such-entry  "异常:失败:解压:无-此-条目"
  'exn:fail:unzip:no-such-entry-entry  "异常:失败:解压:无-此-条目-条目"
  'exn:fail:unzip:no-such-entry?  "异常:失败:解压:无-此-条目?"
  'make-exn:fail:unzip:no-such-entry  "创建-异常:失败:解压:无-此-条目"
  'path->zip-path  "路径->压缩-路径"
  'read-zip-directory  "读取-压缩-目录"
  'struct:exn:fail:unzip:no-such-entry  "结构:异常:失败:解压:无-此-条目"
  'zip-directory-contains?  "压缩-目录-包含?"
  'zip-directory-entries  "压缩-目录-条目"
  'zip-directory-includes-directory?  "压缩-目录-包含-目录?"
  'zip-directory?  "压缩-目录?"
))

;; with-kw (4)
(define kw-map (hash
  'call-with-unzip  (cons "调用-带-解压" (hash '#:must-unzip? "必须-解压?"))
  'make-filesystem-entry-reader  (cons "创建-文件系统-条目-读取器" (hash '#:dest "目标" '#:exists "存在" '#:permissive? "宽松?" '#:strip-count "剥离-计数"))
  'unzip  (cons "解压" (hash '#:must-unzip? "必须-解压?" '#:preserve-attributes? "保留-属性?" '#:preserve-timestamps? "保留-时间戳?" '#:utc-timestamps? "UTC-时间戳?"))
  'unzip-entry  (cons "解压-条目" (hash '#:preserve-attributes? "保留-属性?" '#:preserve-timestamps? "保留-时间戳?" '#:utc-timestamps? "UTC-时间戳?"))
))
