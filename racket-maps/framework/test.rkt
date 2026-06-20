;; framework/test
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (22)
(define plain-map (hash
  'button-in-top-level-focusd-window?  #f
  'enabled-shown-button?  #f
  'label-of-enabled/shown-button-in-top-level-window?  #f
  'test:button-push  #f
  'test:close-top-level-window  #f
  'test:current-get-eventspaces  #f
  'test:get-active-top-level-window  #f
  'test:keystroke  #f
  'test:menu-select  #f
  'test:mouse-click  #f
  'test:new-window  #f
  'test:number-pending-actions  #f
  'test:reraise-error  #f
  'test:run-interval  #f
  'test:run-one  #f
  'test:set-check-box!  #f
  'test:set-choice!  #f
  'test:set-list-box!  #f
  'test:set-radio-box!  #f
  'test:set-radio-box-item!  #f
  'test:top-level-focus-window-has?  #f
  'test:use-focus-table  #f
))

