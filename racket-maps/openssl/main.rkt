;; openssl/main
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (45/45 translated)
(define plain-map (hash
  'ssl-abandon-port  "SSL-放弃-端口"
  'ssl-accept  "SSL-接受"
  'ssl-accept/enable-break  "SSL-接受/启用-中断"
  'ssl-addresses  "SSL-地址"
  'ssl-available?  "SSL-可用?"
  'ssl-channel-binding  "SSL-通道-绑定"
  'ssl-client-context?  "SSL-客户端-上下文?"
  'ssl-close  "SSL-关闭"
  'ssl-context?  "SSL-上下文?"
  'ssl-default-channel-binding  "SSL-默认-通道-绑定"
  'ssl-default-verify-sources  "SSL-默认-验证-源"
  'ssl-dh4096-param-bytes  "SSL-DH4096-参数-字节"
  'ssl-get-alpn-selected  "SSL-获取-ALPN-已选"
  'ssl-listen  "SSL-监听"
  'ssl-listener?  "SSL-监听器?"
  'ssl-load-certificate-chain!  "SSL-加载-证书-链!"
  'ssl-load-default-verify-sources!  "SSL-加载-默认-验证-源!"
  'ssl-load-fail-reason  "SSL-加载-失败-原因"
  'ssl-load-private-key!  "SSL-加载-私钥!"
  'ssl-load-suggested-certificate-authorities!  "SSL-加载-建议-证书-颁发机构!"
  'ssl-load-verify-root-certificates!  "SSL-加载-验证-根-证书!"
  'ssl-max-client-protocol  "SSL-最大-客户端-协议"
  'ssl-max-server-protocol  "SSL-最大-服务器-协议"
  'ssl-peer-certificate-hostnames  "SSL-对等-证书-主机名"
  'ssl-peer-check-hostname  "SSL-对等-检查-主机名"
  'ssl-peer-issuer-name  "SSL-对等-颁发者-名称"
  'ssl-peer-subject-name  "SSL-对等-主题-名称"
  'ssl-peer-verified?  "SSL-对等-已验证?"
  'ssl-port?  "SSL-端口?"
  'ssl-protocol-symbol/c  "SSL-协议-符号/合同"
  'ssl-protocol-version  "SSL-协议-版本"
  'ssl-seal-context!  "SSL-密封-上下文!"
  'ssl-secure-client-context  "SSL-安全-客户端-上下文"
  'ssl-server-context-enable-dhe!  "SSL-服务器-上下文-启用-DHE!"
  'ssl-server-context-enable-ecdhe!  "SSL-服务器-上下文-启用-ECDHE!"
  'ssl-server-context?  "SSL-服务器-上下文?"
  'ssl-set-ciphers!  "SSL-设置-密码!"
  'ssl-set-keylogger!  "SSL-设置-密钥记录器!"
  'ssl-set-server-alpn!  "SSL-设置-服务器-ALPN!"
  'ssl-set-server-name-identification-callback!  "SSL-设置-服务器-名称-识别-回调!"
  'ssl-set-verify!  "SSL-设置-验证!"
  'ssl-set-verify-hostname!  "SSL-设置-验证-主机名!"
  'ssl-try-verify!  "SSL-尝试-验证!"
  'supported-client-protocols  "支持的-客户端-协议"
  'supported-server-protocols  "支持的-服务器-协议"
))

;; with-kw (6)
(define kw-map (hash
  'ports->ssl-ports  (cons "端口->SSL-端口" (hash '#:alpn "ALPN" '#:close-original? "关闭-原始?" '#:context "上下文" '#:encrypt "加密" '#:error/ssl "错误/SSL" '#:hostname "主机名" '#:mode "模式" '#:shutdown-on-close? "关闭时关机?"))
  'ssl-connect  (cons "SSL-连接" (hash '#:alpn "ALPN"))
  'ssl-connect/enable-break  (cons "SSL-连接/启用-中断" (hash '#:alpn "ALPN"))
  'ssl-load-verify-source!  (cons "SSL-加载-验证-源!" (hash '#:try? "尝试?"))
  'ssl-make-client-context  (cons "SSL-创建-客户端-上下文" (hash '#:certificate-chain "证书-链" '#:private-key "私钥"))
  'ssl-make-server-context  (cons "SSL-创建-服务器-上下文" (hash '#:certificate-chain "证书-链" '#:private-key "私钥"))
))

;; kw-value-map (2 keywords)
(define kw-value-map (hash
  '#:mode (hash 'accept #f 'connect #f)
  '#:private-key (hash 'pem #f)
))
