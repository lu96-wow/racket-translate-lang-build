;; net/head
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (12/12 translated)
(define plain-map (hash
  'append-headers  "追加-请求头"
  'assemble-address-field  "组装-地址-字段"
  'data-lines->data  "数据-行->数据"
  'empty-header  "空-请求头"
  'extract-addresses  "提取-地址"
  'extract-all-fields  "提取-所有-字段"
  'extract-field  "提取-字段"
  'insert-field  "插入-字段"
  'remove-field  "移除-字段"
  'replace-field  "替换-字段"
  'standard-message-header  "标准-消息-请求头"
  'validate-header  "验证-请求头"
))

