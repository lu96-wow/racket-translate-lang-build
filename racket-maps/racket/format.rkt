;; racket/format
#lang racket/base
(provide kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (8)
(define kw-map (hash
  '~.a  (cons "~.任意" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
  '~.s  (cons "~.sexp" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
  '~.v  (cons "~.值" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
  '~a  (cons "~任意" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
  '~e  (cons "~表达式" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
  '~r  (cons "~数" (hash '#:base "基数" '#:decimal-sep "小数-分隔符" '#:format-exponent "格式-指数" '#:group-sep "分组-分隔符" '#:groups "分组" '#:min-width "最小-宽度" '#:notation "记法" '#:pad-string "填充-字符串" '#:precision "精度" '#:sign "符号"))
  '~s  (cons "~sexp" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
  '~v  (cons "~值" (hash '#:align "对齐" '#:left-pad-string "左-填充-字符串" '#:limit-marker "限制-标记" '#:limit-prefix? "限制-前缀?" '#:max-width "最大-宽度" '#:min-width "最小-宽度" '#:pad-string "填充-字符串" '#:right-pad-string "右-填充-字符串" '#:separator "分隔符" '#:width "宽度"))
))

;; kw-value-map (3 keywords)
(define kw-value-map (hash
  '#:align #hash((center . #f) (left . #f) (right . #f))
  '#:notation #hash((exponential . #f) (positional . #f))
  '#:sign #hash((parens . #f))
))
