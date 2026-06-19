;; version/utils
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/6 translated)
(define plain-map (hash
  'alpha-version?  #f
  'valid-version?  #f
  'version->integer  #f
  'version->list  #f
  'version<=?  #f
  'version<?  #f
))

