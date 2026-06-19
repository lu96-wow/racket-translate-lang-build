;; compiler/cm-accomplice
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'register-external-file  (cons #f (hash '#:indirect? #f))
  'register-external-module  (cons #f (hash '#:indirect? #f))
))
