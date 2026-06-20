;; framework/keybinding-lang
#lang racket/base
(provide plain-map re-exports)

;; re-exports (4)
(define re-exports '(
  "gui-lib/framework/main"
  "gui-lib/mred/main"
  "scheme-lib/scheme/class"
  "scheme-lib/scheme/main"
))

;; plain (1/1 translated)
(define plain-map (hash
  '#%module-begin  "#%模块-开始"
))

