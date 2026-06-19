;; racket/control
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (25/26 translated)
(define plain-map (hash
  '%  #f
  'abort  "中止"
  'abort/cc  "中止/当前续延"
  'call/comp  "调用/复合"
  'call/prompt  "调用/提示"
  'control  "控制"
  'control-at  "控制-于"
  'control0  "控制0"
  'control0-at  "控制0-于"
  'cupto  "捕获-到"
  'new-prompt  "新-提示"
  'prompt  "提示"
  'prompt-at  "提示-于"
  'prompt0  "提示0"
  'prompt0-at  "提示0-于"
  'reset  "重置"
  'reset-at  "重置-于"
  'reset0  "重置0"
  'reset0-at  "重置0-于"
  'set  "集合"
  'shift  "移位"
  'shift-at  "移位-于"
  'shift0  "移位0"
  'shift0-at  "移位0-于"
  'spawn  "派生"
  'splitter  "分割器"
))

;; with-kw (1)
(define kw-map (hash
  'fcontrol  (cons "控制流" (hash '#:tag "标签"))
))
