;; racket/place
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "racket/place/dynamic"
))

;; plain (3/3 translated)
(define plain-map (hash
  'place  "场所"
  'place*  "场所*"
  'place/context  "场所/上下文"
))

