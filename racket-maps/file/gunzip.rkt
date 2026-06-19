;; file/gunzip
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'gunzip  "解压-gzip"
  'gunzip-through-ports  "解压-gzip-通过-端口"
  'inflate  "膨胀"
))

