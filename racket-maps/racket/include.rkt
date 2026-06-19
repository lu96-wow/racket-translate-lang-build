;; racket/include
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4/4 translated)
(define plain-map (hash
  'include  "包含"
  'include-at/relative-to  "包含-于/相对-于"
  'include-at/relative-to/reader  "包含-于/相对-于/读取器"
  'include/reader  "包含/读取器"
))

