;; racket/date
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (10/10 translated)
(define plain-map (hash
  'current-date  "当前-日期"
  'date*->seconds  "日期*->秒"
  'date->julian/scaliger  "日期->儒略/斯卡利杰"
  'date->julian/scalinger  "日期->儒略/斯卡林杰"
  'date->seconds  "日期->秒"
  'date->string  "日期->字符串"
  'date-display-format  "日期-显示-格式"
  'find-seconds  "查找-秒"
  'julian/scaliger->string  "儒略/斯卡利杰->字符串"
  'julian/scalinger->string  "儒略/斯卡林杰->字符串"
))

