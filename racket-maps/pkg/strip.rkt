;; pkg/strip
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (2/2 translated)
(define plain-map (hash
  'check-strip-compatible  "检查-剥离-兼容"
  'strip-binary-compile-info  "剥离-二进制-编译-信息"
))

;; with-kw (2)
(define kw-map (hash
  'fixup-local-redirect-reference  (cons "修复-本地-重定向-引用" (hash '#:user "用户"))
  'generate-stripped-directory  (cons "生成-剥离-目录" (hash '#:check-status? "检查-状态?" '#:original-source "原始-源"))
))
