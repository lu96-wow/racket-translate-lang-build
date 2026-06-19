;; syntax/keyword
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/6 translated)
(define plain-map (hash
  'check-expression  #f
  'check-identifier  #f
  'check-stx-boolean  #f
  'check-stx-listof  #f
  'check-stx-string  #f
  'options-select  #f
))

;; with-kw (4)
(define kw-map (hash
  'options-select-row  (cons #f (hash '#:default #f))
  'options-select-value  (cons #f (hash '#:default #f))
  'parse-keyword-options  (cons #f (hash '#:context #f '#:incompatible #f '#:no-duplicates? #f '#:on-incompatible #f '#:on-not-in-table #f '#:on-too-short #f))
  'parse-keyword-options/eol  (cons #f (hash '#:context #f '#:incompatible #f '#:no-duplicates? #f '#:on-incompatible #f '#:on-not-eol #f '#:on-not-in-table #f '#:on-too-short #f))
))
