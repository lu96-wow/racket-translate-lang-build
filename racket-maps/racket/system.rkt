;; racket/system
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (2/2 translated)
(define plain-map (hash
  'bytes-no-nuls?  "字节-无-空?"
  'string-no-nuls?  "字符串-无-空?"
))

;; with-kw (8)
(define kw-map (hash
  'process  (cons "进程" (hash '#:set-pwd? "设置-工作目录?"))
  'process*  (cons "进程*" (hash '#:set-pwd? "设置-工作目录?"))
  'process*/ports  (cons "进程*/端口" (hash '#:set-pwd? "设置-工作目录?"))
  'process/ports  (cons "进程/端口" (hash '#:set-pwd? "设置-工作目录?"))
  'system  (cons "系统" (hash '#:set-pwd? "设置-工作目录?"))
  'system*  (cons "系统*" (hash '#:set-pwd? "设置-工作目录?"))
  'system*/exit-code  (cons "系统*/退出-码" (hash '#:set-pwd? "设置-工作目录?"))
  'system/exit-code  (cons "系统/退出-码" (hash '#:set-pwd? "设置-工作目录?"))
))
