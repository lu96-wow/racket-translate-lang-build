;; planet/config
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (14/14 translated)
(define plain-map (hash
  'CACHE-DIR  "缓存-目录"
  'DEFAULT-PACKAGE-LANGUAGE  "默认-包-语言"
  'HARD-LINK-FILE  "硬-链接-文件"
  'HTTP-DOWNLOAD-SERVLET-URL  "HTTP-下载-Servlet-URL"
  'LINKAGE-FILE  "链接-文件"
  'LOG-FILE  "日志-文件"
  'PLANET-ARCHIVE-FILTER  "行星-归档-过滤"
  'PLANET-BASE-DIR  "行星-基础-目录"
  'PLANET-CODE-VERSION  "行星-代码-版本"
  'PLANET-DIR  "行星-目录"
  'PLANET-SERVER-NAME  "行星-服务器-名称"
  'PLANET-SERVER-PORT  "行星-服务器-端口"
  'UNINSTALLED-PACKAGE-CACHE  "未安装-包-缓存"
  'USE-HTTP-DOWNLOADS?  "使用-HTTP-下载?"
))

