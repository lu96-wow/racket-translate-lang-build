;; mrlib/terminal
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/2 translated)
(define plain-map (hash
  'on-terminal-run  #f
  'terminal<%>  #f
))

;; with-kw (1)
(define kw-map (hash
  'in-terminal  (cons "在-终端" (hash '#:abort-label "中止-标签" '#:aborted-message "中止-消息" '#:canvas-min-height "画布-最小-高度" '#:canvas-min-width "画布-最小-宽度" '#:cleanup-thunk "清理-函数" '#:close-button? "关闭-按钮?" '#:close-callback "关闭-回调" '#:close-label "关闭-标签" '#:close-when-hidden? "隐藏时-关闭?" '#:container "容器" '#:title "标题"))
))
