;; file/untgz
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'untgz  (cons "解压-tgz" (hash '#:dest "目标" '#:filter "过滤" '#:permissive? "宽松?" '#:strip-count "剥离-计数"))
))
