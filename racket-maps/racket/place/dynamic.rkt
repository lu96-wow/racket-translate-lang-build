;; racket/place/dynamic
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (15/15 translated)
(define plain-map (hash
  'place-break  "场所-中断"
  'place-channel  "场所-通道"
  'place-channel-get  "场所-通道-获取"
  'place-channel-put  "场所-通道-放入"
  'place-channel-put/get  "场所-通道-放入/获取"
  'place-channel?  "场所-通道?"
  'place-dead-evt  "场所-死亡-事件"
  'place-enabled?  "场所-已启用?"
  'place-kill  "场所-终止"
  'place-location?  "场所-位置?"
  'place-message-allowed?  "场所-消息-允许?"
  'place-wait  "场所-等待"
  'place?  "场所?"
  'processor-count  "处理器-计数"
  'prop:place-location  "属性:场所-位置"
))

;; with-kw (2)
(define kw-map (hash
  'dynamic-place  (cons "动态-场所" (hash '#:at #f '#:named #f))
  'dynamic-place*  (cons "动态-场所*" (hash '#:err #f '#:in #f '#:out #f))
))
