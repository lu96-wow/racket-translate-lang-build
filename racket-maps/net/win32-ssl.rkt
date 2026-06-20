;; net/win32-ssl
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4/4 translated)
(define plain-map (hash
  'win32-ssl-abandon-port  "Win32-SSL-放弃-端口"
  'win32-ssl-available?  "Win32-SSL-可用?"
  'win32-ssl-connect  "Win32-SSL-连接"
  'win32-ssl-port?  "Win32-SSL-端口?"
))

;; with-kw (1)
(define kw-map (hash
  'ports->win32-ssl-ports  (cons "端口->Win32-SSL-端口" (hash '#:encrypt "加密" '#:hostname "主机名"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:encrypt #hash((auto . #f) (secure . #f) (sslv2 . #f) (sslv2-or-v3 . #f) (sslv3 . #f) (tls . #f) (tls11 . #f) (tls12 . #f))
))
