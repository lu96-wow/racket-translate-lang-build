;; setup/matching-platform
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/1 translated)
(define plain-map (hash
  'platform-spec?  #f
))

;; with-kw (1)
(define kw-map (hash
  'matching-platform?  (cons #f (hash '#:cross? #f '#:system-library-subpath #f '#:system-type #f))
))
