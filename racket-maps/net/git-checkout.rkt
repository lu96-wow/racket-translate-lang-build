;; net/git-checkout
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (5/5 translated)
(define plain-map (hash
  'current-git-password  "当前-git-密码"
  'current-git-username  "当前-git-用户名"
  'exn:fail:git  "异常:失败:git"
  'exn:fail:git?  "异常:失败:git?"
  'struct:exn:fail:git  "结构:异常:失败:git"
))

;; with-kw (1)
(define kw-map (hash
  'git-checkout  (cons "git-检出" (hash '#:clean-tmp-dir? "清理-临时-目录?" '#:depth "深度" '#:dest-dir "目标-目录" '#:initial-error "初始-错误" '#:initial-search-ref "初始-搜索-引用" '#:password "密码" '#:port "端口" '#:ref "引用" '#:status-printf "状态-打印" '#:strict-links? "严格-链接?" '#:tmp-dir "临时-目录" '#:transport "传输" '#:username "用户名" '#:verify-server? "验证-服务器?"))
))
