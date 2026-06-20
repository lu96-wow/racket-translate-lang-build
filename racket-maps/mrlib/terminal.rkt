;; mrlib/terminal
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/2 translated)
(define plain-map (hash
  'on-terminal-run  #f
  'terminal<%>  #f
))

;; with-kw (1)
(define kw-map (hash
  'in-terminal  (cons #f (hash '#:abort-label #f '#:aborted-message #f '#:canvas-min-height #f '#:canvas-min-width #f '#:cleanup-thunk #f '#:close-button? #f '#:close-callback #f '#:close-label #f '#:close-when-hidden? #f '#:container #f '#:title #f))
))
