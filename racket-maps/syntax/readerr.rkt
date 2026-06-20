;; syntax/readerr
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'raise-read-eof-error  #f
))

;; with-kw (1)
(define kw-map (hash
  'raise-read-error  (cons "raise-读取-error" (hash '#:extra-srclocs "额外-源位置"))
))
