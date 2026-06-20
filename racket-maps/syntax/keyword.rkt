;; syntax/keyword
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/6 translated)
(define plain-map (hash
  'check-expression  #f
  'check-identifier  #f
  'check-stx-boolean  #f
  'check-stx-listof  #f
  'check-stx-string  #f
  'options-select  #f
))

;; with-kw (4)
(define kw-map (hash
  'options-select-row  (cons "选项-选择-行" (hash '#:default "默认"))
  'options-select-value  (cons "options-select-值" (hash '#:default "默认"))
  'parse-keyword-options  (cons "parse-关键字-options" (hash '#:context "上下文" '#:incompatible "不兼容" '#:no-duplicates? "无-重复?" '#:on-incompatible "不兼容时" '#:on-not-in-table "不在-表中时" '#:on-too-short "太短时"))
  'parse-keyword-options/eol  (cons "parse-关键字-options/eol" (hash '#:context "上下文" '#:incompatible "不兼容" '#:no-duplicates? "无-重复?" '#:on-incompatible "不兼容时" '#:on-not-eol "非-行尾时" '#:on-not-in-table "不在-表中时" '#:on-too-short "太短时"))
))
