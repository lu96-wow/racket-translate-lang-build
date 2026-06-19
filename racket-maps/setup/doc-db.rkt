;; setup/doc-db
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/8 translated)
(define plain-map (hash
  'doc-db-available?  #f
  'doc-db-clean-files  #f
  'doc-db-disconnect  #f
  'doc-db-file->connection  #f
  'doc-db-get-provides-timestamp  #f
  'doc-db-init-pause  #f
  'doc-db-pause  #f
  'log-doc-db-info  #f
))

;; with-kw (12)
(define kw-map (hash
  'doc-db-add-dependencies  (cons #f (hash '#:pkg #f))
  'doc-db-add-provides  (cons #f (hash '#:pkg #f))
  'doc-db-add-searches  (cons #f (hash '#:pkg #f))
  'doc-db-check-duplicates  (cons #f (hash '#:attach #f '#:main-doc-relative-ok? #f))
  'doc-db-check-unsatisfied  (cons #f (hash '#:attach #f))
  'doc-db-clear-dependencies  (cons #f (hash '#:pkg #f))
  'doc-db-clear-provides  (cons #f (hash '#:pkg #f))
  'doc-db-clear-searches  (cons #f (hash '#:pkg #f))
  'doc-db-get-dependencies  (cons #f (hash '#:attach #f '#:include-tags? #f '#:main-doc-relative-ok? #f))
  'doc-db-key->path  (cons #f (hash '#:main-doc-relative-ok? #f))
  'doc-db-key->path+pkg  (cons #f (hash '#:main-doc-relative-ok? #f))
  'doc-db-set-provides-timestamp  (cons #f (hash '#:pkg #f))
))
