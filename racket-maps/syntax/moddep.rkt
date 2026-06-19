;; syntax/moddep
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/12 translated)
(define plain-map (hash
  'check-module-form  #f
  'collapse-module-path  #f
  'collapse-module-path-index  #f
  'default-compiled-sub-path  #f
  'exn:get-module-code  #f
  'exn:get-module-code-path  #f
  'exn:get-module-code?  #f
  'make-exn:get-module-code  #f
  'moddep-current-open-input-file  #f
  'resolve-module-path  #f
  'resolve-module-path-index  #f
  'with-module-reading-parameterization  #f
))

;; with-kw (4)
(define kw-map (hash
  'get-metadata-path  (cons #f (hash '#:roots #f))
  'get-module-code  (cons #f (hash '#:choose #f '#:compile #f '#:extension-handler #f '#:notify #f '#:rkt-try-ss? #f '#:roots #f '#:source-reader #f '#:sub-path #f '#:submodule-path #f))
  'get-module-path  (cons #f (hash '#:choose #f '#:rkt-try-ss? #f '#:roots #f '#:sub-path #f '#:submodule? #f))
  'show-import-tree  (cons #f (hash '#:dag? #f '#:path-to #f '#:show #f))
))
