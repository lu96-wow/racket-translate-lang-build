;; net/base64
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4/4 translated)
(define plain-map (hash
  'base64-decode  "base64-解码"
  'base64-decode-stream  "base64-解码-流"
  'base64-encode  "base64-编码"
  'base64-encode-stream  "base64-编码-流"
))

