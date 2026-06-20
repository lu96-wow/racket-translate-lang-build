;; racket/enter
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'enter!  "进入!"
))

;; with-kw (1)
(define kw-map (hash
  'dynamic-enter!  (cons "动态-进入!" (hash '#:re-require-enter? "重新-需求-进入?" '#:verbosity "详细程度"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:verbosity #hash((all . "全部") (none . "无") (reload . "重新加载"))
))
