;; racket/mutability
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (10/10 translated)
(define plain-map (hash
  'immutable-box?  "不可变-盒?"
  'immutable-bytes?  "不可变-字节串?"
  'immutable-hash?  "不可变-哈希?"
  'immutable-string?  "不可变-字符串?"
  'immutable-vector?  "不可变-向量?"
  'mutable-box?  "可变-盒?"
  'mutable-bytes?  "可变-字节串?"
  'mutable-hash?  "可变-哈希?"
  'mutable-string?  "可变-字符串?"
  'mutable-vector?  "可变-向量?"
))

