;; pkg/main
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/1 translated)
(define plain-map (hash
  'pkg-new-command  "包-新-命令"
))

;; with-kw (13)
(define kw-map (hash
  'pkg-archive-command  (cons "包-归档-命令" (hash '#:exclude "排除" '#:include-deps "包含-依赖" '#:relative "相对"))
  'pkg-catalog-archive-command  (cons "包-目录-归档-命令" (hash '#:exclude "排除" '#:fast-file-copy "快速-文件-复制" '#:from-config "来自-配置" '#:include "包含" '#:include-deps "包含-依赖" '#:include-deps-platform "包含-依赖-平台" '#:pkg-fail "包-失败" '#:relative "相对" '#:state "状态" '#:version "版本"))
  'pkg-catalog-copy-command  (cons "包-目录-复制-命令" (hash '#:force "强制" '#:from-config "来自-配置" '#:merge "合并" '#:override "覆盖" '#:relative "相对" '#:version "版本"))
  'pkg-catalog-show-command  (cons "包-目录-显示-命令" (hash '#:all "所有" '#:catalog "目录" '#:modules "模块" '#:only-names "仅-名称" '#:version "版本"))
  'pkg-config-command  (cons "包-配置-命令" (hash '#:installation "安装" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:set "设置" '#:user "用户"))
  'pkg-create-command  (cons "包-创建-命令" (hash '#:as-is "原样" '#:binary "二进制" '#:binary-lib "二进制-库" '#:built "已构建" '#:dest "目标" '#:format "格式" '#:from-dir "来自-目录" '#:from-install "来自-安装" '#:manifest "清单" '#:original "原始" '#:source "源"))
  'pkg-empty-trash-command  (cons "包-清空-垃圾-命令" (hash '#:installation "安装" '#:list "列表" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:user "用户"))
  'pkg-install-command  (cons "包-安装-命令" (hash '#:all-platforms "所有-平台" '#:auto "自动" '#:batch "批处理" '#:binary "二进制" '#:binary-lib "二进制-库" '#:catalog "目录" '#:checksum "校验和" '#:clone "克隆" '#:copy "复制" '#:deps "依赖" '#:dry-run "试运行" '#:fail-fast "快速失败" '#:force "强制" '#:force-strip "强制-剥离" '#:ignore-checksums "忽略-校验和" '#:ignore-implies "忽略-隐含" '#:installation "安装" '#:jobs "作业" '#:link "链接" '#:multi-clone "多-克隆" '#:name "名称" '#:no-cache "无-缓存" '#:no-docs "无-文档" '#:no-setup "无-设置" '#:no-trash "无-垃圾" '#:pkgs "包" '#:pull "拉取" '#:recompile-cache "重新编译-缓存" '#:recompile-only "仅-重新编译" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:skip-installed "跳过-已安装" '#:source "源" '#:static-link "静态-链接" '#:strict-doc-conflicts "严格-文档-冲突" '#:type "类型" '#:update-deps "更新-依赖" '#:user "用户"))
  'pkg-migrate-command  (cons "包-迁移-命令" (hash '#:all-platforms "所有-平台" '#:auto "自动" '#:batch "批处理" '#:binary "二进制" '#:binary-lib "二进制-库" '#:catalog "目录" '#:deps "依赖" '#:dry-run "试运行" '#:force "强制" '#:force-strip "强制-剥离" '#:ignore-checksums "忽略-校验和" '#:installation "安装" '#:jobs "作业" '#:no-cache "无-缓存" '#:no-docs "无-文档" '#:no-setup "无-设置" '#:recompile-cache "重新编译-缓存" '#:recompile-only "仅-重新编译" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:source "源" '#:strict-doc-conflicts "严格-文档-冲突" '#:user "用户"))
  'pkg-remove-command  (cons "包-移除-命令" (hash '#:auto "自动" '#:batch "批处理" '#:demote "降级" '#:dry-run "试运行" '#:force "强制" '#:installation "安装" '#:jobs "作业" '#:no-docs "无-文档" '#:no-setup "无-设置" '#:no-trash "无-垃圾" '#:recompile-cache "重新编译-缓存" '#:recompile-only "仅-重新编译" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:user "用户"))
  'pkg-show-command  (cons "包-显示-命令" (hash '#:all "所有" '#:dir "目录" '#:full-checksum "完整-校验和" '#:installation "安装" '#:long "详细" '#:rx "正则" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:user "用户" '#:version "版本"))
  'pkg-uninstall-command  (cons "包-卸载-命令" (hash '#:auto "自动" '#:batch "批处理" '#:demote "降级" '#:dry-run "试运行" '#:force "强制" '#:installation "安装" '#:jobs "作业" '#:no-docs "无-文档" '#:no-setup "无-设置" '#:no-trash "无-垃圾" '#:recompile-cache "重新编译-缓存" '#:recompile-only "仅-重新编译" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:user "用户"))
  'pkg-update-command  (cons "包-更新-命令" (hash '#:all "所有" '#:all-platforms "所有-平台" '#:auto "自动" '#:batch "批处理" '#:binary "二进制" '#:binary-lib "二进制-库" '#:catalog "目录" '#:checksum "校验和" '#:clone "克隆" '#:copy "复制" '#:deps "依赖" '#:dry-run "试运行" '#:force "强制" '#:force-strip "强制-剥离" '#:ignore-checksums "忽略-校验和" '#:ignore-implies "忽略-隐含" '#:installation "安装" '#:jobs "作业" '#:link "链接" '#:lookup "查找" '#:multi-clone "多-克隆" '#:name "名称" '#:no-cache "无-缓存" '#:no-docs "无-文档" '#:no-setup "无-设置" '#:no-trash "无-垃圾" '#:pull "拉取" '#:recompile-cache "重新编译-缓存" '#:recompile-only "仅-重新编译" '#:scope "作用域" '#:scope-dir "作用域-目录" '#:skip-uninstalled "跳过-未安装" '#:source "源" '#:static-link "静态-链接" '#:strict-doc-conflicts "严格-文档-冲突" '#:type "类型" '#:unclone "取消克隆" '#:update-deps "更新-依赖" '#:user "用户"))
))
