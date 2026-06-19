;; pkg/dirs-catalog
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'create-dirs-catalog  (cons #f (hash '#:check-metadata? #f '#:immediate? #f '#:link? #f '#:merge? #f '#:status-printf #f))
))
