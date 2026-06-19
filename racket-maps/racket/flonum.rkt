;; racket/flonum
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (46/46 translated)
(define plain-map (hash
  '->fl  "->浮点"
  'fl*  "浮点-*"
  'fl+  "浮点-+"
  'fl-  "浮点-减"
  'fl->exact-integer  "浮点->精确-整数"
  'fl/  "浮点-/"
  'fl<  "浮点-<"
  'fl<=  "浮点-<="
  'fl=  "浮点-="
  'fl>  "浮点->"
  'fl>=  "浮点->="
  'flabs  "浮点-绝对值"
  'flacos  "浮点-反余弦"
  'flasin  "浮点-反正弦"
  'flatan  "浮点-反正切"
  'flbit-field  "浮点-位字段"
  'flceiling  "浮点-向上取整"
  'flcos  "浮点-余弦"
  'flexp  "浮点-指数"
  'flexpt  "浮点-幂"
  'flfloor  "浮点-向下取整"
  'flimag-part  "浮点-虚部"
  'fllog  "浮点-对数"
  'flmax  "浮点-最大值"
  'flmin  "浮点-最小值"
  'flrandom  "浮点-随机"
  'flreal-part  "浮点-实部"
  'flround  "浮点-四舍五入"
  'flsin  "浮点-正弦"
  'flsingle  "浮点-单精度"
  'flsqrt  "浮点-平方根"
  'fltan  "浮点-正切"
  'fltruncate  "浮点-截断"
  'flvector  "浮点向量"
  'flvector-copy  "浮点向量-复制"
  'flvector-length  "浮点向量-长度"
  'flvector-ref  "浮点向量-引用"
  'flvector-set!  "浮点向量-设置!"
  'flvector?  "浮点向量?"
  'for*/flvector  "for*/浮点向量"
  'for/flvector  "for/浮点向量"
  'in-flvector  "在-浮点向量"
  'make-flrectangular  "创建-浮点矩形"
  'make-flvector  "创建-浮点向量"
  'make-shared-flvector  "创建-共享-浮点向量"
  'shared-flvector  "共享-浮点向量"
))

