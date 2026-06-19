;; setup/infotab
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "racket/base"
))

;; plain (2/2 translated)
(define plain-map (hash
  '#%module-begin  "#%模块-开始"
  'require  "需要"
))

