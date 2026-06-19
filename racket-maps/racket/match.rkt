;; racket/match
#lang racket/base
(provide plain-map re-exports)

;; re-exports (1)
(define re-exports '(
  "racket/match/match"
))

;; plain (4/4 translated)
(define plain-map (hash
  'define-match-expander  "定义-匹配-扩展器"
  'exn:misc:match?  "异常:杂项:匹配?"
  'failure-cont  "失败-延续"
  'match-equality-test  "匹配-相等-测试"
))

