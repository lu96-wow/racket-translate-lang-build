;; mrlib/name-message
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4)
(define plain-map (hash
  'calc-button-min-sizes  #f
  'get-left-side-padding  #f
  'name-message%  #f
  'pad-xywh  #f
))

;; with-kw (1)
(define kw-map (hash
  'draw-button-label  (cons #f (hash '#:wob? #f))
))
