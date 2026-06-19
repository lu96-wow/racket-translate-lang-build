;; racket/random
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (2/2 translated)
(define plain-map (hash
  'crypto-random-bytes  "加密-随机-字节"
  'random-ref  "随机-引用"
))

;; with-kw (1)
(define kw-map (hash
  'random-sample  (cons "随机-采样" (hash '#:replacement? "放回?"))
))
