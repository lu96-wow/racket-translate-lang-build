;; syntax/location
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/13 translated)
(define plain-map (hash
  'module-name-fixup  #f
  'quote-character-position  #f
  'quote-character-span  #f
  'quote-column-number  #f
  'quote-line-number  #f
  'quote-module-name  #f
  'quote-module-path  #f
  'quote-source-file  #f
  'quote-srcloc  #f
  'quote-srcloc-prefix  #f
  'quote-srcloc-string  #f
  'syntax-source-directory  #f
  'syntax-source-file-name  #f
))

