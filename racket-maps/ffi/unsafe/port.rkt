;; ffi/unsafe/port
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/7 translated)
(define plain-map (hash
  'unsafe-fd->evt  #f
  'unsafe-file-descriptor->port  #f
  'unsafe-file-descriptor->semaphore  #f
  'unsafe-port->file-descriptor  #f
  'unsafe-port->socket  #f
  'unsafe-socket->port  #f
  'unsafe-socket->semaphore  #f
))

