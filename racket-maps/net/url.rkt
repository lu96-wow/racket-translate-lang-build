;; net/url
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (60/60 translated)
(define plain-map (hash
  'call/input-url  "调用/输入-URL"
  'combine-url/relative  "合并-URL/相对"
  'current-no-proxy-servers  "当前-无-代理-服务器"
  'current-proxy-servers  "当前-代理-服务器"
  'current-url-encode-mode  "当前-URL-编码-模式"
  'delete-impure-port  "删除-非纯-端口"
  'delete-pure-port  "删除-纯-端口"
  'display-pure-port  "显示-纯-端口"
  'file-url-path-convention-type  "文件-URL-路径-约定-类型"
  'file://->path  "file://->路径"
  'get-impure-port  "获取-非纯-端口"
  'head-impure-port  "HEAD-非纯-端口"
  'head-pure-port  "HEAD-纯-端口"
  'http-connection-close  "HTTP-连接-关闭"
  'http-connection?  "HTTP-连接?"
  'make-http-connection  "创建-HTTP-连接"
  'make-path/param  "创建-路径/参数"
  'make-url  "创建-URL"
  'netscape/string->url  "netscape/字符串->URL"
  'options-impure-port  "OPTIONS-非纯-端口"
  'options-pure-port  "OPTIONS-纯-端口"
  'path->url  "路径->URL"
  'path/param  "路径/参数"
  'path/param-param  "路径/参数-参数"
  'path/param-path  "路径/参数-路径"
  'path/param?  "路径/参数?"
  'post-impure-port  "POST-非纯-端口"
  'post-pure-port  "POST-纯-端口"
  'proxiable-url-schemes  "可代理-URL-方案"
  'proxy-server-for  "代理-服务器-为"
  'purify-port  "纯化-端口"
  'put-impure-port  "PUT-非纯-端口"
  'put-pure-port  "PUT-纯-端口"
  'relative-path->relative-url-string  "相对-路径->相对-URL-字符串"
  'set-url-fragment!  "设置-URL-片段!"
  'set-url-host!  "设置-URL-主机!"
  'set-url-path!  "设置-URL-路径!"
  'set-url-path-absolute?!  "设置-URL-路径-绝对?!"
  'set-url-port!  "设置-URL-端口!"
  'set-url-query!  "设置-URL-查询!"
  'set-url-scheme!  "设置-URL-方案!"
  'set-url-user!  "设置-URL-用户!"
  'string->url  "字符串->URL"
  'struct:path/param  "结构:路径/参数"
  'struct:url  "结构:URL"
  'tcp-or-tunnel-connect  "TCP-或-隧道-连接"
  'url  "URL"
  'url->path  "URL->路径"
  'url->string  "URL->字符串"
  'url-exception?  "URL-异常?"
  'url-fragment  "URL-片段"
  'url-host  "URL-主机"
  'url-path  "URL-路径"
  'url-path-absolute?  "URL-路径-绝对?"
  'url-port  "URL-端口"
  'url-query  "URL-查询"
  'url-regexp  "URL-正则"
  'url-scheme  "URL-方案"
  'url-user  "URL-用户"
  'url?  "URL?"
))

;; with-kw (3)
(define kw-map (hash
  'get-pure-port  (cons "获取-纯-端口" (hash '#:redirections "重定向"))
  'get-pure-port/headers  (cons "获取-纯-端口/请求头" (hash '#:connection "连接" '#:method "方法" '#:redirections "重定向" '#:status? "状态?"))
  'http-sendrecv/url  (cons "HTTP-发送接收/URL" (hash '#:content-decode "内容-解码" '#:data "数据" '#:headers "请求头" '#:method "方法"))
))
