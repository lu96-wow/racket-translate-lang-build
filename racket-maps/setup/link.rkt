;; setup/link
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'links  (cons #f (hash '#:error #f '#:file #f '#:name #f '#:remove? #f '#:repair? #f '#:root? #f '#:show? #f '#:static-root? #f '#:user-version #f '#:user? #f '#:version-regexp #f '#:with-path? #f))
))
