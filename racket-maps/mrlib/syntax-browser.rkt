;; mrlib/syntax-browser
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/3 translated)
(define plain-map (hash
  'render-syntax-focused-syntax-color-style-name  #f
  'render-syntax-subtitle-color-style-name  #f
  'snip-class  #f
))

;; with-kw (2)
(define kw-map (hash
  'render-syntax/snip  (cons "渲染-语法/片段" (hash '#:summary-width "摘要-宽度"))
  'render-syntax/window  (cons "渲染-语法/窗口" (hash '#:summary-width "摘要-宽度"))
))
