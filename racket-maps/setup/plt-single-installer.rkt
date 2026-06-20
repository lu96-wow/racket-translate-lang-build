;; setup/plt-single-installer
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/3 translated)
(define plain-map (hash
  'clean-planet-package  #f
  'install-planet-package  #f
  'reindex-user-documentation  #f
))

;; with-kw (1)
(define kw-map (hash
  'run-single-installer  (cons "运行-单个-安装器" (hash '#:show-beginning-of-file? "显示-文件-开头?"))
))
