;; openssl/openssl
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'ssl-connect  (cons "SSL-连接" (hash '#:alpn "ALPN"))
))
