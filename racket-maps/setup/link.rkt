;; setup/link
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'links  (cons "链接" (hash '#:error "错误" '#:file "文件" '#:name "名称" '#:remove? "移除?" '#:repair? "修复?" '#:root? "根?" '#:show? "显示?" '#:static-root? "静态-根?" '#:user-version "用户-版本" '#:user? "用户?" '#:version-regexp "版本-正则" '#:with-path? "带-路径?"))
))
