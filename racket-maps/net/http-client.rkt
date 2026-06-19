;; net/http-client
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (10/10 translated)
(define plain-map (hash
  'base-ssl?-tnl/c  "基础-SSL?-tnl/合同"
  'base-ssl?/c  "基础-SSL?/合同"
  'data-procedure/c  "数据-过程/合同"
  'http-conn  "HTTP-连接"
  'http-conn-abandon!  "HTTP-连接-放弃!"
  'http-conn-close!  "HTTP-连接-关闭!"
  'http-conn-enliven!  "HTTP-连接-激活!"
  'http-conn-live?  "HTTP-连接-活跃?"
  'http-conn-liveable?  "HTTP-连接-可活跃?"
  'http-conn?  "HTTP-连接对象?"
))

;; with-kw (7)
(define kw-map (hash
  'http-conn-CONNECT-tunnel  (cons "HTTP-连接-CONNECT-隧道" (hash '#:proxy-auth "代理-认证" '#:ssl? "SSL?"))
  'http-conn-open  (cons "HTTP-连接-打开" (hash '#:auto-reconnect? "自动-重连?" '#:port "端口" '#:ssl? "SSL?"))
  'http-conn-open!  (cons "HTTP-连接-打开!" (hash '#:auto-reconnect? "自动-重连?" '#:port "端口" '#:ssl? "SSL?"))
  'http-conn-recv!  (cons "HTTP-连接-接收!" (hash '#:close? "关闭?" '#:content-decode "内容-解码" '#:method "方法"))
  'http-conn-send!  (cons "HTTP-连接-发送!" (hash '#:close? "关闭?" '#:content-decode "内容-解码" '#:data "数据" '#:headers "请求头" '#:method "方法" '#:version "版本"))
  'http-conn-sendrecv!  (cons "HTTP-连接-发送接收!" (hash '#:close? "关闭?" '#:content-decode "内容-解码" '#:data "数据" '#:headers "请求头" '#:method "方法" '#:version "版本"))
  'http-sendrecv  (cons "HTTP-发送接收" (hash '#:content-decode "内容-解码" '#:data "数据" '#:headers "请求头" '#:method "方法" '#:port "端口" '#:ssl? "SSL?" '#:version "版本"))
))
