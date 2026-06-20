;; mrlib/syntax-browser
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3)
(define plain-map (hash
  'render-syntax-focused-syntax-color-style-name  #f
  'render-syntax-subtitle-color-style-name  #f
  'snip-class  #f
))

;; with-kw (2)
(define kw-map (hash
  'render-syntax/snip  (cons #f (hash '#:summary-width #f))
  'render-syntax/window  (cons #f (hash '#:summary-width #f))
))
