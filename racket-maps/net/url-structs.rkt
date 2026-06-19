;; net/url-structs
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (26/26 translated)
(define plain-map (hash
  'make-path/param  "创建-路径/参数"
  'make-url  "创建-URL"
  'path/param  "路径/参数"
  'path/param-param  "路径/参数-参数"
  'path/param-path  "路径/参数-路径"
  'path/param?  "路径/参数?"
  'set-url-fragment!  "设置-URL-片段!"
  'set-url-host!  "设置-URL-主机!"
  'set-url-path!  "设置-URL-路径!"
  'set-url-path-absolute?!  "设置-URL-路径-绝对?!"
  'set-url-port!  "设置-URL-端口!"
  'set-url-query!  "设置-URL-查询!"
  'set-url-scheme!  "设置-URL-方案!"
  'set-url-user!  "设置-URL-用户!"
  'struct:path/param  "结构:路径/参数"
  'struct:url  "结构:URL"
  'url  "URL"
  'url-fragment  "URL-片段"
  'url-host  "URL-主机"
  'url-path  "URL-路径"
  'url-path-absolute?  "URL-路径-绝对?"
  'url-port  "URL-端口"
  'url-query  "URL-查询"
  'url-scheme  "URL-方案"
  'url-user  "URL-用户"
  'url?  "URL?"
))

