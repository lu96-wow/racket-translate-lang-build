;; racket/file
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (29/29 translated)
(define plain-map (hash
  'block-device-type-bits  "块-设备-类型-位"
  'character-device-type-bits  "字符-设备-类型-位"
  'directory-type-bits  "目录-类型-位"
  'fifo-type-bits  "先进先出-类型-位"
  'file-type-bits  "文件-类型-位"
  'fold-files  "折叠-文件"
  'group-execute-bit  "组-执行-位"
  'group-permission-bits  "组-权限-位"
  'group-read-bit  "组-读-位"
  'group-write-bit  "组-写-位"
  'make-directory*  "创建-目录*"
  'make-lock-file-name  "创建-锁-文件-名称"
  'make-parent-directory*  "创建-父-目录*"
  'other-execute-bit  "其他-执行-位"
  'other-permission-bits  "其他-权限-位"
  'other-read-bit  "其他-读-位"
  'other-write-bit  "其他-写-位"
  'preferences-lock-file-mode  "偏好-锁-文件-模式"
  'put-preferences  "设置-偏好"
  'regular-file-type-bits  "常规-文件-类型-位"
  'set-group-id-bit  "设置-组-标识-位"
  'set-user-id-bit  "设置-用户-标识-位"
  'socket-type-bits  "套接字-类型-位"
  'sticky-bit  "粘滞-位"
  'symbolic-link-type-bits  "符号-链接-类型-位"
  'user-execute-bit  "用户-执行-位"
  'user-permission-bits  "用户-权限-位"
  'user-read-bit  "用户-读-位"
  'user-write-bit  "用户-写-位"
))

;; with-kw (21)
(define kw-map (hash
  'call-with-atomic-output-file  (cons "调用-带-原子-输出-文件" (hash '#:rename-fail-handler #f '#:security-guard #f))
  'call-with-file-lock/timeout  (cons "调用-带-文件-锁/超时" (hash '#:delay #f '#:lock-file #f '#:max-delay #f))
  'copy-directory/files  (cons "复制-目录/文件" (hash '#:keep-modify-seconds? #f '#:preserve-links? #f))
  'delete-directory/files  (cons "删除-目录/文件" (hash '#:must-exist? #f))
  'display-lines-to-file  (cons "显示-行-到-文件" (hash '#:exists #f '#:mode #f '#:separator #f))
  'display-to-file  (cons "显示-到-文件" (hash '#:exists #f '#:mode #f))
  'file->bytes  (cons "文件->字节" (hash '#:mode #f))
  'file->bytes-lines  (cons "文件->字节-行" (hash '#:line-mode #f '#:mode #f))
  'file->lines  (cons "文件->行" (hash '#:line-mode #f '#:mode #f))
  'file->list  (cons "文件->列表" (hash '#:mode #f))
  'file->string  (cons "文件->字符串" (hash '#:mode #f))
  'file->value  (cons "文件->值" (hash '#:mode #f))
  'find-files  (cons "查找-文件" (hash '#:follow-links? #f '#:skip-filtered-directory? #f))
  'get-preference  (cons "获取-偏好" (hash '#:lock-there #f '#:timeout-lock-there #f '#:use-lock? #f))
  'make-handle-get-preference-locked  (cons "创建-句柄-获取-偏好-已锁定" (hash '#:lock-there #f '#:max-delay #f))
  'make-temporary-directory  (cons "创建-临时-目录" (hash '#:base-dir #f))
  'make-temporary-directory*  (cons "创建-临时-目录*" (hash '#:base-dir #f))
  'make-temporary-file  (cons "创建-临时-文件" (hash '#:base-dir #f '#:copy-from #f))
  'make-temporary-file*  (cons "创建-临时-文件*" (hash '#:base-dir #f '#:copy-from #f))
  'pathlist-closure  (cons "路径列表-闭包" (hash '#:follow-links? #f '#:path-filter #f))
  'write-to-file  (cons "写-到-文件" (hash '#:exists #f '#:mode #f))
))
