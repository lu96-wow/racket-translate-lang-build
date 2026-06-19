;; compiler/compilation-path
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (3)
(define kw-map (hash
  'get-compilation-bytecode-file  (cons #f (hash '#:default-root #f '#:modes #f '#:roots #f))
  'get-compilation-dir  (cons #f (hash '#:default-root #f '#:modes #f '#:roots #f))
  'get-compilation-dir+name  (cons #f (hash '#:default-root #f '#:modes #f '#:roots #f))
))
