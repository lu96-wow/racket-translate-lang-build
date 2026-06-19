;; racket/string
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (6/6 translated)
(define plain-map (hash
  'non-empty-string?  "非-空-字符串?"
  'string-append*  "字符串-追加*"
  'string-contains?  "字符串-包含?"
  'string-find  "字符串-查找"
  'string-prefix?  "字符串-前缀?"
  'string-suffix?  "字符串-后缀?"
))

;; with-kw (5)
(define kw-map (hash
  'string-join  (cons "字符串-连接" (hash '#:after-last "之后-最后" '#:before-first "之前-第一" '#:before-last "之前-最后"))
  'string-normalize-spaces  (cons "字符串-标准化-空格" (hash '#:repeat? "重复?" '#:trim? "修剪?"))
  'string-replace  (cons "字符串-替换" (hash '#:all? "所有?"))
  'string-split  (cons "字符串-分割" (hash '#:repeat? "重复?" '#:trim? "修剪?"))
  'string-trim  (cons "字符串-修剪" (hash '#:left? "左边?" '#:repeat? "重复?" '#:right? "右边?"))
))
