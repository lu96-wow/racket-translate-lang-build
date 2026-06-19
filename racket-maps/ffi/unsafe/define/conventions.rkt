;; ffi/unsafe/define/conventions
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/4 translated)
(define plain-map (hash
  'convention:hyphen->PascalCase  #f
  'convention:hyphen->camelCase  #f
  'convention:hyphen->camelcase  #f
  'convention:hyphen->underscore  #f
))

