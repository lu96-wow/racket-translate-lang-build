;; syntax/modresolve
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/2 translated)
(define plain-map (hash
  'resolve-module-path  #f
  'resolve-module-path-index  #f
))

