;; racket/path
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (11/11 translated)
(define plain-map (hash
  'file-name-from-path  "文件-名称-从-路径"
  'filename-extension  "文件名-扩展名"
  'normalize-path  "归一化-路径"
  'path-element?  "路径-元素?"
  'path-get-extension  "路径-获取-扩展名"
  'path-has-extension?  "路径-有-扩展名?"
  'path-only  "路径-仅"
  'shrink-path-wrt  "收缩-路径-相对于"
  'simple-form-path  "简单-形式-路径"
  'some-system-path->string  "某个-系统-路径->字符串"
  'string->some-system-path  "字符串->某个-系统-路径"
))

;; with-kw (1)
(define kw-map (hash
  'find-relative-path  (cons "查找-相对-路径" (hash '#:more-than-root? "比-根-多?" '#:more-than-same? "比-相同-多?" '#:normalize-case? "归一化-大小写?"))
))
