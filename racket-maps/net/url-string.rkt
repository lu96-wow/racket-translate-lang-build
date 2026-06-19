;; net/url-string
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (38/38 translated)
(define plain-map (hash
  'combine-url/relative  "合并-URL/相对"
  'current-url-encode-mode  "当前-URL-编码-模式"
  'file-url-path-convention-type  "文件-URL-路径-约定-类型"
  'file://->path  "file://->路径"
  'make-path/param  "创建-路径/参数"
  'make-url  "创建-URL"
  'netscape/string->url  "netscape/字符串->URL"
  'path->url  "路径->URL"
  'path/param  "路径/参数"
  'path/param-param  "路径/参数-参数"
  'path/param-path  "路径/参数-路径"
  'path/param?  "路径/参数?"
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

