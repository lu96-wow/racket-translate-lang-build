;; file/glob
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'glob-capture-dotfiles?  "通配-捕获-点文件?"
  'glob-quote  "通配-引用"
  'glob/c  "通配/连续"
))

;; with-kw (3)
(define kw-map (hash
  'glob  (cons "通配" (hash '#:capture-dotfiles? "捕获-点文件?"))
  'glob-match?  (cons "通配-匹配?" (hash '#:capture-dotfiles? "捕获-点文件?"))
  'in-glob  (cons "在-通配" (hash '#:capture-dotfiles? "捕获-点文件?"))
))
