;; framework/splash
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (17)
(define plain-map (hash
  'add-splash-icon  #f
  'close-splash  #f
  'get-splash-bitmap  #f
  'get-splash-canvas  #f
  'get-splash-event-callback  #f
  'get-splash-eventspace  #f
  'get-splash-height  #f
  'get-splash-paint-callback  #f
  'get-splash-width  #f
  'refresh-splash  #f
  'set-refresh-splash-on-gauge-change?!  #f
  'set-splash-bitmap  #f
  'set-splash-char-observer  #f
  'set-splash-event-callback  #f
  'set-splash-paint-callback  #f
  'set-splash-progress-bar?!  #f
  'shutdown-splash  #f
))

;; with-kw (1)
(define kw-map (hash
  'start-splash  (cons #f (hash '#:allow-funny? #f '#:frame-icon #f '#:increment-splash #f))
))
