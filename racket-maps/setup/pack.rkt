;; setup/pack
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/3 translated)
(define plain-map (hash
  'pack  #f
  'pack-collections  #f
  'std-filter  #f
))

;; with-kw (3)
(define kw-map (hash
  'mztar  (cons #f (hash '#:as-path #f))
  'pack-collections-plt  (cons #f (hash '#:at-plt-home? #f '#:extra-setup-collections #f '#:file-filter #f '#:replace? #f '#:test-plt-collects? #f))
  'pack-plt  (cons #f (hash '#:as-paths #f '#:at-plt-home? #f '#:collections #f '#:conflicts #f '#:encode? #f '#:file-filter #f '#:file-mode #f '#:plt-relative? #f '#:requires #f '#:test-plt-dirs #f '#:unpack-unit #f))
))
