;; framework/gui-utils
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (10)
(define plain-map (hash
  'gui-utils:cancel-on-right?  #f
  'gui-utils:cursor-delay  #f
  'gui-utils:delay-action  #f
  'gui-utils:format-literal-label  #f
  'gui-utils:get-clickback-delta  #f
  'gui-utils:get-clicked-clickback-delta  #f
  'gui-utils:local-busy-cursor  #f
  'gui-utils:next-untitled-name  #f
  'gui-utils:show-busy-cursor  #f
  'gui-utils:trim-string  #f
))

;; with-kw (4)
(define kw-map (hash
  'gui-utils:get-choice  (cons #f (hash '#:dialog-mixin #f))
  'gui-utils:ok/cancel-buttons  (cons #f (hash '#:confirm-style #f))
  'gui-utils:quote-literal-label  (cons #f (hash '#:quote-amp? #f))
  'gui-utils:unsaved-warning  (cons #f (hash '#:dialog-mixin #f))
))
