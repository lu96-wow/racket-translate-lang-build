;; compiler/cm
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (19/19 translated)
(define plain-map (hash
  'compile-lock->parallel-lock-client  "编译-锁->并行-锁-客户端"
  'current-multi-compile-any  "当前-多-编译-任意"
  'current-path->mode  "当前-路径->模式"
  'file-stamp-in-collection  "文件-标记-在-集合"
  'file-stamp-in-paths  "文件-标记-在-路径集"
  'get-compiled-file-sha1  "获取-已编译-文件-SHA1"
  'get-file-sha1  "获取-文件-SHA1"
  'install-module-hashes!  "安装-模块-哈希!"
  'make-compilation-context-error-display-handler  "创建-编译-上下文-错误-显示-处理器"
  'make-compile-lock  "创建-编译-锁"
  'managed-compiled-context-key  "管理-编译-上下文-键"
  'managed-recompile-cache-dir  "管理-重新编译-缓存-目录"
  'managed-recompile-only  "管理-仅-重新编译"
  'manager-compile-notify-handler  "管理器-编译-通知-处理器"
  'manager-skip-file-handler  "管理器-跳过-文件-处理器"
  'manager-trace-handler  "管理器-跟踪-处理器"
  'parallel-lock-client  "并行-锁-客户端"
  'trust-existing-zos  "信任-现有-ZO"
  'with-compile-output  "带-编译-输出"
))

;; with-kw (3)
(define kw-map (hash
  'make-caching-managed-compile-zo  (cons "创建-缓存-管理-编译-ZO" (hash '#:security-guard "安全-守卫"))
  'make-compilation-manager-load/use-compiled-handler  (cons "创建-编译-管理器-加载/使用-已编译-处理器" (hash '#:security-guard "安全-守卫"))
  'managed-compile-zo  (cons "管理-编译-ZO" (hash '#:security-guard "安全-守卫"))
))
