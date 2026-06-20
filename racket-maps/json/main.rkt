;; json/main
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'json-null  "json-空"
))

;; with-kw (7)
(define kw-map (hash
  'bytes->jsexpr  (cons "字节->json表达式" (hash '#:null "空" '#:replace-malformed-surrogate? "替换-畸形-代理项?"))
  'jsexpr->bytes  (cons "json表达式->字节" (hash '#:encode "编码" '#:indent "缩进" '#:null "空"))
  'jsexpr->string  (cons "json表达式->字符串" (hash '#:encode "编码" '#:indent "缩进" '#:null "空"))
  'jsexpr?  (cons "json表达式?" (hash '#:null "空"))
  'read-json  (cons "读取-json" (hash '#:null "空" '#:replace-malformed-surrogate? "替换-畸形-代理项?"))
  'string->jsexpr  (cons "字符串->json表达式" (hash '#:null "空" '#:replace-malformed-surrogate? "替换-畸形-代理项?"))
  'write-json  (cons "写入-json" (hash '#:encode "编码" '#:indent "缩进" '#:null "空"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:encode (hash 'all #f 'control #f)
))
