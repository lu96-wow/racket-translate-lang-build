;; setup/setup
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (1)
(define kw-map (hash
  'setup  (cons "设置" (hash '#:avoid-main? "避免-main?" '#:check-pkg-deps? "检查-包-依赖?" '#:clean? "清理?" '#:collections "集合包" '#:fail-fast? "快速-失败?" '#:file "文件" '#:fix-pkg-deps? "修复-包-依赖?" '#:force-user-docs? "强制-用户-文档?" '#:get-target-dir "获取-目标-目录" '#:jobs "任务数" '#:make-doc-index? "创建-文档-索引?" '#:make-docs? "创建-文档?" '#:make-user? "创建-用户?" '#:pkgs "包列表" '#:planet-specs "planet-规范" '#:recompile-cache "重编译-缓存" '#:recompile-only? "仅-重编译?" '#:tidy? "整理?" '#:unused-pkg-deps? "未使用-包-依赖?"))
))
