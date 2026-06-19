;; racket/udp
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (33/33 translated)
(define plain-map (hash
  'udp-addresses  "udp-地址"
  'udp-bind!  "udp-绑定!"
  'udp-bound?  "udp-已绑定?"
  'udp-close  "udp-关闭"
  'udp-connect!  "udp-连接!"
  'udp-connected?  "udp-已连接?"
  'udp-multicast-interface  "udp-多播-接口"
  'udp-multicast-join-group!  "udp-多播-加入-组!"
  'udp-multicast-leave-group!  "udp-多播-离开-组!"
  'udp-multicast-loopback?  "udp-多播-回环?"
  'udp-multicast-set-interface!  "udp-多播-设置-接口!"
  'udp-multicast-set-loopback!  "udp-多播-设置-回环!"
  'udp-multicast-set-ttl!  "udp-多播-设置-ttl!"
  'udp-multicast-ttl  "udp-多播-ttl"
  'udp-open-socket  "udp-打开-套接字"
  'udp-receive!  "udp-接收!"
  'udp-receive!*  "udp-接收!*"
  'udp-receive!-evt  "udp-接收!-事件"
  'udp-receive!/enable-break  "udp-接收!/启用-中断"
  'udp-receive-ready-evt  "udp-接收-就绪-事件"
  'udp-send  "udp-发送"
  'udp-send*  "udp-发送*"
  'udp-send-evt  "udp-发送-事件"
  'udp-send-ready-evt  "udp-发送-就绪-事件"
  'udp-send-to  "udp-发送-到"
  'udp-send-to*  "udp-发送-到*"
  'udp-send-to-evt  "udp-发送-到-事件"
  'udp-send-to/enable-break  "udp-发送-到/启用-中断"
  'udp-send/enable-break  "udp-发送/启用-中断"
  'udp-set-receive-buffer-size!  "udp-设置-接收-缓冲区-大小!"
  'udp-set-ttl!  "udp-设置-ttl!"
  'udp-ttl  "udp-ttl"
  'udp?  "udp?"
))

