;; mrlib/gif
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'write-gif  #f
))

;; with-kw (1)
(define kw-map (hash
  'write-animated-gif  (cons #f (hash '#:disposal #f '#:last-frame-delay #f '#:loop? #f '#:one-at-a-time? #f))
))
