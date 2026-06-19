;; racket/tcp
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (14/14 translated)
(define plain-map (hash
  'listen-port-number?  "监听-端口-编号?"
  'port-number?  "端口-编号?"
  'tcp-abandon-port  "tcp-放弃-端口"
  'tcp-accept  "tcp-接受"
  'tcp-accept-evt  "tcp-接受-事件"
  'tcp-accept-ready?  "tcp-接受-就绪?"
  'tcp-accept/enable-break  "tcp-接受/启用-中断"
  'tcp-addresses  "tcp-地址"
  'tcp-close  "tcp-关闭"
  'tcp-connect  "tcp-连接"
  'tcp-connect/enable-break  "tcp-连接/启用-中断"
  'tcp-listen  "tcp-监听"
  'tcp-listener?  "tcp-监听器?"
  'tcp-port?  "tcp-端口?"
))

