;; syntax/template
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'transform-template  (cons #f (hash '#:cons-stx #f '#:constant-as-leaf? #f '#:ellipses-end-stx #f '#:leaf-datum-stx #f '#:leaf-restore-stx #f '#:leaf-save #f '#:pvar-restore-stx #f '#:pvar-save #f '#:restore-stx #f '#:save #f))
))
