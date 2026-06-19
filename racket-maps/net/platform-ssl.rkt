;; net/platform-ssl
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (8/8 translated)
(define plain-map (hash
  'osx-old-openssl?  "OSX-旧-OpenSSL?"
  'osx-ssl-abandon-port  "OSX-SSL-放弃-端口"
  'osx-ssl-connect  "OSX-SSL-连接"
  'osx-ssl-output-port?  "OSX-SSL-输出-端口?"
  'win32-ssl-abandon-port  "Win32-SSL-放弃-端口"
  'win32-ssl-available?  "Win32-SSL-可用?"
  'win32-ssl-connect  "Win32-SSL-连接"
  'win32-ssl-port?  "Win32-SSL-端口?"
))

;; with-kw (1)
(define kw-map (hash
  'ports->win32-ssl-ports  (cons "端口->Win32-SSL-端口" (hash '#:encrypt "加密" '#:hostname "主机名"))
))
