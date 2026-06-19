;; file/untar
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'handle-tar-entry  "处理-tar-条目"
))

;; with-kw (1)
(define kw-map (hash
  'untar  (cons "解压-tar" (hash '#:dest "目标" '#:filter "过滤" '#:handle-entry "处理-条目" '#:permissive? "宽松?" '#:strip-count "剥离-计数"))
))
