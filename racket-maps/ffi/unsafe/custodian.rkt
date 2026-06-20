;; ffi/unsafe/custodian
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/2 translated)
(define plain-map (hash
  'make-custodian-at-root  #f
  'unregister-custodian-shutdown  #f
))

;; with-kw (2)
(define kw-map (hash
  'register-custodian-shutdown  (cons "注册-管理器-关闭" (hash '#:at-exit? "退出时?" '#:ordered? "有序?" '#:weak? "弱引用?"))
  'register-finalizer-and-custodian-shutdown  (cons "注册-终结器-和-管理器-关闭" (hash '#:at-exit? "退出时?" '#:custodian-available "管理器-可用" '#:custodian-unavailable "管理器-不可用"))
))
