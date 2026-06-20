;; scheme/gui/base
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "gui-lib/mred/main"
))

;; plain (2)
(define plain-map (hash
  'make-gui-empty-namespace  #f
  'make-gui-namespace  #f
))

