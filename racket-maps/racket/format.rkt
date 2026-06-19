;; racket/format
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (8)
(define kw-map (hash
  '~.a  (cons "~.任意" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
  '~.s  (cons "~.sexp" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
  '~.v  (cons "~.值" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
  '~a  (cons "~任意" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
  '~e  (cons "~表达式" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
  '~r  (cons "~数" (hash '#:base #f '#:decimal-sep #f '#:format-exponent #f '#:group-sep #f '#:groups #f '#:min-width #f '#:notation #f '#:pad-string #f '#:precision #f '#:sign #f))
  '~s  (cons "~sexp" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
  '~v  (cons "~值" (hash '#:align #f '#:left-pad-string #f '#:limit-marker #f '#:limit-prefix? #f '#:max-width #f '#:min-width #f '#:pad-string #f '#:right-pad-string #f '#:separator #f '#:width #f))
))
