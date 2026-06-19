;; racket/fixnum
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (45/45 translated)
(define plain-map (hash
  'fixnum-for-every-system?  "定长数-对于-所有-系统?"
  'fl->fx  "浮点->定长"
  'for*/fxvector  "for*/定长向量"
  'for/fxvector  "for/定长向量"
  'fx*  "定长-*"
  'fx*/wraparound  "定长-*/环绕"
  'fx+  "定长-+"
  'fx+/wraparound  "定长-+/环绕"
  'fx-  "定长-减"
  'fx-/wraparound  "定长-减/环绕"
  'fx->fl  "定长->浮点"
  'fx<  "定长-<"
  'fx<=  "定长-<="
  'fx=  "定长-="
  'fx>  "定长->"
  'fx>=  "定长->="
  'fxabs  "定长-绝对值"
  'fxand  "定长-与"
  'fxior  "定长-或"
  'fxlshift  "定长-左移"
  'fxlshift/wraparound  "定长-左移/环绕"
  'fxmax  "定长-最大值"
  'fxmin  "定长-最小值"
  'fxmodulo  "定长-模"
  'fxnot  "定长-非"
  'fxpopcount  "定长-位计数"
  'fxpopcount16  "定长-位计数16"
  'fxpopcount32  "定长-位计数32"
  'fxquotient  "定长-商"
  'fxremainder  "定长-余数"
  'fxrshift  "定长-右移"
  'fxrshift/logical  "定长-右移/逻辑"
  'fxvector  "定长向量"
  'fxvector-copy  "定长向量-复制"
  'fxvector-length  "定长向量-长度"
  'fxvector-ref  "定长向量-引用"
  'fxvector-set!  "定长向量-设置!"
  'fxvector?  "定长向量?"
  'fxxor  "定长-异或"
  'in-fxvector  "在-定长向量"
  'make-fxvector  "创建-定长向量"
  'make-shared-fxvector  "创建-共享-定长向量"
  'most-negative-fixnum  "最-负-定长数"
  'most-positive-fixnum  "最-正-定长数"
  'shared-fxvector  "共享-定长向量"
))

