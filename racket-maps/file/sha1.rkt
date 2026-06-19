;; file/sha1
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "racket/base"
))

;; plain (3/3 translated)
(define plain-map (hash
  'bytes->hex-string  "字节->十六进制-字符串"
  'hex-string->bytes  "十六进制-字符串->字节"
  'sha1  "SHA1"
))

