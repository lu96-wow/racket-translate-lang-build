;; openssl/sha1
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "file/sha1"
))

;; plain (2/2 translated)
(define plain-map (hash
  'sha1  "SHA1"
  'sha1-bytes  "SHA1-字节串"
))

