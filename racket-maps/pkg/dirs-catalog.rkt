;; pkg/dirs-catalog
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'create-dirs-catalog  (cons "创建-dirs-catalog" (hash '#:check-metadata? "检查-元数据?" '#:immediate? "立即?" '#:link? "链接?" '#:merge? "合并?" '#:status-printf "状态-打印"))
))
