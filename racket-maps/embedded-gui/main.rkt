;; embedded-gui/main
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (43)
(define plain-map (hash
  'aligned-pasteboard%  #f
  'alignment-parent<%>  #f
  'alignment<%>  #f
  'button-snip%  #f
  'control-style  #f
  'cue-text%  #f
  'cue-text-mixin  #f
  'dllist<%>  #f
  'embedded-button%  #f
  'embedded-message%  #f
  'embedded-text-button%  #f
  'embedded-toggle-button%  #f
  'fixed-width-label-snip  #f
  'fold-snip  #f
  'for-each-snip  #f
  'grey-editor-mixin  #f
  'grey-editor-snip-mixin  #f
  'grid-alignment  #f
  'hline%  #f
  'horizontal-alignment%  #f
  'map-snip  #f
  'on-show-editor-canvas-mixin  #f
  'on-show-editor-snip-mixin  #f
  'on-show-editor<%>  #f
  'set-tabbing  #f
  'single-line-text-mixin  #f
  'snip-height  #f
  'snip-min-height  #f
  'snip-min-width  #f
  'snip-parent  #f
  'snip-width  #f
  'snip-wrapper%  #f
  'stretchable-editor-snip%  #f
  'stretchable-editor-snip-mixin  #f
  'stretchable-height?  #f
  'stretchable-snip<%>  #f
  'stretchable-width?  #f
  'tabbable-text-mixin  #f
  'tabbable-text<%>  #f
  'text-button-snip%  #f
  'toggle-button-snip%  #f
  'vertical-alignment%  #f
  'vline%  #f
))

