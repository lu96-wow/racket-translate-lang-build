;; framework/notify
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (6)
(define plain-map (hash
  'notify:check-box/notify-box  #f
  'notify:choice/notify-box  #f
  'notify:define-notify  #f
  'notify:menu-group/notify-box  #f
  'notify:menu-option/notify-box  #f
  'notify:notify-box%  #f
))

;; with-kw (1)
(define kw-map (hash
  'notify:notify-box/pref  (cons #f (hash '#:readonly? #f))
))
