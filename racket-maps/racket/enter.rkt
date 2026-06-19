;; racket/enter
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'enter!  "进入!"
))

;; with-kw (1)
(define kw-map (hash
  'dynamic-enter!  (cons "动态-进入!" (hash '#:re-require-enter? #f '#:verbosity #f))
))
