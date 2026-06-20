;; compiler/cm-accomplice
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'register-external-file  (cons "register-external-文件" (hash '#:indirect? "间接?"))
  'register-external-module  (cons "register-external-模块" (hash '#:indirect? "间接?"))
))
