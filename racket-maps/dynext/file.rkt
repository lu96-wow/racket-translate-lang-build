;; dynext/file
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (9/9 translated)
(define plain-map (hash
  'append-c-suffix  "追加-C-后缀"
  'append-constant-pool-suffix  "追加-常量-池-后缀"
  'append-extension-suffix  "追加-扩展名-后缀"
  'append-object-suffix  "追加-对象-后缀"
  'append-zo-suffix  "追加-ZO-后缀"
  'extract-base-filename/c  "提取-基础-文件名/C"
  'extract-base-filename/ext  "提取-基础-文件名/扩展"
  'extract-base-filename/kp  "提取-基础-文件名/KP"
  'extract-base-filename/o  "提取-基础-文件名/O"
))

;; with-kw (1)
(define kw-map (hash
  'extract-base-filename/ss  (cons "提取-基础-文件名/SS" (hash '#:module-pattern "模块-模式"))
))
