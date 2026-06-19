;; racket/math
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (22/22 translated)
(define plain-map (hash
  'conjugate  "共轭"
  'cosh  "双曲余弦"
  'degrees->radians  "度->弧度"
  'exact-ceiling  "精确-向上取整"
  'exact-floor  "精确-向下取整"
  'exact-round  "精确-四舍五入"
  'exact-truncate  "精确-截断"
  'infinite?  "无穷?"
  'nan?  "非数?"
  'natural?  "自然数?"
  'negative-integer?  "负-整数?"
  'nonnegative-integer?  "非负-整数?"
  'nonpositive-integer?  "非正-整数?"
  'order-of-magnitude  "阶-之-幅度"
  'pi  "圆周率"
  'pi.f  "圆周率.f"
  'positive-integer?  "正-整数?"
  'radians->degrees  "弧度->度"
  'sgn  "正负号"
  'sinh  "双曲正弦"
  'sqr  "平方"
  'tanh  "双曲正切"
))

