;; ffi/com-registry
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4/4 translated)
(define plain-map (hash
  'clsid->coclass  "CLSID->组件类"
  'coclass->clsid  "组件类->CLSID"
  'com-all-coclasses  "COM-所有-组件类"
  'com-all-controls  "COM-所有-控件"
))

