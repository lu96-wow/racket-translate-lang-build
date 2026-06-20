;; file/resource
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (2)
(define kw-map (hash
  'get-resource  (cons "获取-资源" (hash '#:type "类型"))
  'write-resource  (cons "写入-资源" (hash '#:create-key? "创建-键?" '#:type "类型"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:type #hash((bytes . "字节") (bytes/expand-string . "字节/展开-字符串") (bytes/string . "字节/字符串") (dword . "dword") (expand-string . "展开-字符串") (string . "字符串"))
))
