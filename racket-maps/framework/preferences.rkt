;; framework/preferences
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (20)
(define plain-map (hash
  'exn:make-unknown-preference  #f
  'exn:struct:unknown-preference  #f
  'exn:unknown-preference?  #f
  'preferences:add-callback  #f
  'preferences:current-layer  #f
  'preferences:default-set?  #f
  'preferences:get  #f
  'preferences:get-prefs-snapshot  #f
  'preferences:get/set  #f
  'preferences:layer?  #f
  'preferences:low-level-get-preference  #f
  'preferences:low-level-put-preferences  #f
  'preferences:new-layer  #f
  'preferences:register-save-callback  #f
  'preferences:restore-defaults  #f
  'preferences:restore-prefs-snapshot  #f
  'preferences:set  #f
  'preferences:set-un/marshall  #f
  'preferences:snapshot?  #f
  'preferences:unregister-save-callback  #f
))

;; with-kw (1)
(define kw-map (hash
  'preferences:set-default  (cons #f (hash '#:aliases #f '#:rewrite-aliases #f))
))
