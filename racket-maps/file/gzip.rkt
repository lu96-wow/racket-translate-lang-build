;; file/gzip
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'deflate  "deflate-压缩"
  'gzip  "gzip"
  'gzip-through-ports  "gzip-通过-端口"
))

