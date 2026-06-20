;; mrlib/interactive-value-port
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (3)
(define kw-map (hash
  'set-interactive-display-handler  (cons #f (hash '#:snip-handler #f))
  'set-interactive-print-handler  (cons #f (hash '#:snip-handler #f))
  'set-interactive-write-handler  (cons #f (hash '#:snip-handler #f))
))
