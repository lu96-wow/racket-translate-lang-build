;; file/ico
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (12/12 translated)
(define plain-map (hash
  'ico->argb  "图标->ARGB"
  'ico->png-bytes  "图标->PNG-字节"
  'ico-depth  "图标-深度"
  'ico-format  "图标-格式"
  'ico-height  "图标-高度"
  'ico-width  "图标-宽度"
  'ico?  "图标?"
  'png-bytes->ico  "PNG-字节->图标"
  'read-icos  "读取-图标"
  'read-icos-from-exe  "从-EXE-读取-图标"
  'replace-all-icos  "替换-所有-图标"
  'replace-icos  "替换-图标"
))

;; with-kw (2)
(define kw-map (hash
  'argb->ico  (cons "ARGB->图标" (hash '#:depth "深度"))
  'write-icos  (cons "写入-图标" (hash '#:exists "存在"))
))
