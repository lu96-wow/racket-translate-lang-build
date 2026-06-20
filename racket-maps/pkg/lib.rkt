;; pkg/lib
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (45/45 translated)
(define plain-map (hash
  'current-pkg-catalogs  "当前-包-目录"
  'current-pkg-download-cache-dir  "当前-包-下载-缓存-目录"
  'current-pkg-download-cache-max-bytes  "当前-包-下载-缓存-最大-字节"
  'current-pkg-download-cache-max-files  "当前-包-下载-缓存-最大-文件数"
  'current-pkg-error  "当前-包-错误"
  'current-pkg-lookup-version  "当前-包-查找-版本"
  'current-pkg-network-retries  "当前-包-网络-重试"
  'current-pkg-network-timeout  "当前-包-网络-超时"
  'current-pkg-scope  "当前-包-作用域"
  'current-pkg-scope-version  "当前-包-作用域-版本"
  'current-pkg-trash-max-packages  "当前-包-垃圾-最大-包数"
  'current-pkg-trash-max-seconds  "当前-包-垃圾-最大-秒数"
  'default-pkg-scope  "默认-包-作用域"
  'get-all-pkg-details-from-catalogs  "从-目录-获取-所有-包-详情"
  'get-all-pkg-names-from-catalogs  "从-目录-获取-所有-包-名称"
  'get-all-pkg-scopes  "获取-所有-包-作用域"
  'get-pkg-details-from-catalogs  "从-目录-获取-包-详情"
  'get-pkgs-dir  "获取-包-目录"
  'pkg-config-catalogs  "包-配置-目录"
  'pkg-config-default-scope-scope  "包-配置-默认-作用域-作用域"
  'pkg-desc?  "包-描述?"
  'pkg-info  "包-信息"
  'pkg-info-auto?  "包-信息-自动?"
  'pkg-info-checksum  "包-信息-校验和"
  'pkg-info-orig-pkg  "包-信息-原始-包"
  'pkg-info/alt  "包-信息/替代"
  'pkg-info/alt-dir-name  "包-信息/替代-目录-名称"
  'pkg-info/alt?  "包-信息/替代?"
  'pkg-info?  "包-信息?"
  'pkg-migrate-available-versions  "包-迁移-可用-版本"
  'pkg-new  "包-新"
  'read-pkg-file-hash  "读取-包-文件-哈希"
  'read-pkgs-db  "读取-包-数据库"
  'sc-pkg-info  "SC-包-信息"
  'sc-pkg-info-collect  "SC-包-信息-收集"
  'sc-pkg-info/alt  "SC-包-信息/替代"
  'sc-pkg-info/alt-dir-name  "SC-包-信息/替代-目录-名称"
  'sc-pkg-info/alt?  "SC-包-信息/替代?"
  'sc-pkg-info?  "SC-包-信息?"
  'struct:pkg-info  "结构:包-信息"
  'struct:pkg-info/alt  "结构:包-信息/替代"
  'struct:sc-pkg-info  "结构:SC-包-信息"
  'struct:sc-pkg-info/alt  "结构:SC-包-信息/替代"
  'with-pkg-lock  "带-包-锁"
  'with-pkg-lock/read-only  "带-包-锁/只读"
))

;; with-kw (31)
(define kw-map (hash
  'call-in-pkg-timeout-sandbox  (cons "在-包-超时-沙盒-中-调用" (hash '#:make-exn "创建-异常"))
  'extract-pkg-dependencies  (cons "提取-包-依赖" (hash '#:build-deps? "构建-依赖?" '#:filter? "过滤?" '#:versions? "版本?"))
  'find-pkg-installation-scope  (cons "查找-包-安装-作用域" (hash '#:next? "下一个?"))
  'get-pkg-content  (cons "获取-包-内容" (hash '#:extract-info "提取-信息" '#:namespace "命名空间" '#:quiet? "安静?" '#:use-cache? "使用-缓存?"))
  'installed-pkg-names  (cons "已安装-包-名称" (hash '#:scope "作用域"))
  'installed-pkg-table  (cons "已安装-包-表" (hash '#:scope "作用域"))
  'path->pkg  (cons "路径->包" (hash '#:cache "缓存"))
  'path->pkg+subpath  (cons "路径->包+子路径" (hash '#:cache "缓存"))
  'path->pkg+subpath+collect  (cons "路径->包+子路径+收集" (hash '#:cache "缓存"))
  'path->pkg+subpath+collect+scope  (cons "路径->包+子路径+收集+作用域" (hash '#:cache "缓存"))
  'path->pkg+subpath+scope  (cons "路径->包+子路径+作用域" (hash '#:cache "缓存"))
  'pkg-archive-pkgs  (cons "包-归档-包" (hash '#:exclude "排除" '#:include-deps? "包含-依赖?" '#:package-exn-handler "包-异常-处理器" '#:quiet? "安静?" '#:relative-sources? "相对-源?"))
  'pkg-catalog-archive  (cons "包-目录-归档" (hash '#:exclude "排除" '#:fast-file-copy? "快速-文件-复制?" '#:from-config? "来自-配置?" '#:include "包含" '#:include-deps-sys+subpath "包含-依赖-系统+子路径" '#:include-deps? "包含-依赖?" '#:package-exn-handler "包-异常-处理器" '#:quiet? "安静?" '#:relative-sources? "相对-源?" '#:state-catalog "状态-目录"))
  'pkg-catalog-copy  (cons "包-目录-复制" (hash '#:force? "强制?" '#:from-config? "来自-配置?" '#:include-only "仅-包含" '#:merge? "合并?" '#:override? "覆盖?" '#:relative-sources? "相对-源?"))
  'pkg-catalog-show  (cons "包-目录-显示" (hash '#:all? "所有?" '#:modules? "模块?" '#:only-names? "仅-名称?"))
  'pkg-catalog-suggestions-for-module  (cons "包-目录-建议-为-模块" (hash '#:catalog-file "目录-文件"))
  'pkg-catalog-update-local  (cons "包-目录-更新-本地" (hash '#:catalog-file "目录-文件" '#:catalogs "目录集" '#:consult-packages? "咨询-包?" '#:quiet? "安静?" '#:set-catalogs? "设置-目录?" '#:skip-download-failures? "跳过-下载-失败?"))
  'pkg-config  (cons "包-配置" (hash '#:default-scope-scope "默认-作用域-作用域" '#:from-command-line? "来自-命令行?"))
  'pkg-create  (cons "包-创建" (hash '#:dest "目标" '#:from-command-line? "来自-命令行?" '#:mode "模式" '#:original "原始" '#:pkg-name "包-名称" '#:quiet? "安静?" '#:source "源"))
  'pkg-desc  (cons "包-描述" (hash '#:path "路径"))
  'pkg-directory  (cons "包-目录" (hash '#:cache "缓存"))
  'pkg-directory->additional-installs  (cons "包-目录->额外-安装" (hash '#:namespace "命名空间" '#:system-library-subpath "系统-库-子路径" '#:system-type "系统-类型"))
  'pkg-directory->module-paths  (cons "包-目录->模块-路径" (hash '#:namespace "命名空间"))
  'pkg-empty-trash  (cons "包-清空-垃圾" (hash '#:list? "列表?" '#:quiet? "安静?"))
  'pkg-install  (cons "包-安装" (hash '#:all-platforms? "所有-平台?" '#:catalog-lookup-cache "目录-查找-缓存" '#:check-pkg-early? "提前-检查-包?" '#:conversation "对话" '#:convert-to-non-clone? "转换为-非-克隆?" '#:dep-behavior "依赖-行为" '#:dry-run? "试运行?" '#:force-strip? "强制-剥离?" '#:force? "强制?" '#:from-command-line? "来自-命令行?" '#:ignore-checksums? "忽略-校验和?" '#:link-dirs? "链接-目录?" '#:lookup-for-clone? "为-克隆-查找?" '#:multi-clone-behavior "多-克隆-行为" '#:old-descs "旧-描述" '#:old-infos "旧-信息" '#:pre-succeed "预-成功" '#:prefetch-group "预取-组" '#:pull-behavior "拉取-行为" '#:quiet? "安静?" '#:remote-checksum-cache "远程-校验和-缓存" '#:repo-descs "仓库-描述" '#:skip-auto-installed? "跳过-自动-安装?" '#:skip-installed? "跳过-已安装?" '#:strict-doc-conflicts? "严格-文档-冲突?" '#:strip "剥离" '#:summary-deps "摘要-依赖" '#:update-cache "更新-缓存" '#:update-deps? "更新-依赖?" '#:update-implies? "更新-隐含?" '#:updating? "正在更新?" '#:use-cache? "使用-缓存?" '#:use-trash? "使用-垃圾?"))
  'pkg-migrate  (cons "包-迁移" (hash '#:all-platforms? "所有-平台?" '#:dep-behavior "依赖-行为" '#:dry-run? "试运行?" '#:force-strip? "强制-剥离?" '#:force? "强制?" '#:from-command-line? "来自-命令行?" '#:ignore-checksums? "忽略-校验和?" '#:quiet? "安静?" '#:strict-doc-conflicts? "严格-文档-冲突?" '#:strip "剥离" '#:use-cache? "使用-缓存?"))
  'pkg-remove  (cons "包-移除" (hash '#:auto? "自动?" '#:demote? "降级?" '#:dry-run? "试运行?" '#:force? "强制?" '#:from-command-line? "来自-命令行?" '#:quiet? "安静?" '#:use-trash? "使用-垃圾?"))
  'pkg-show  (cons "包-显示" (hash '#:auto? "自动?" '#:directory? "目录?" '#:full-checksum? "完整-校验和?" '#:long? "详细?" '#:name "名称" '#:prefix-line "前缀-行" '#:rx? "正则?"))
  'pkg-single-collection  (cons "包-单个-集合" (hash '#:name "名称" '#:namespace "命名空间"))
  'pkg-stage  (cons "包-阶段" (hash '#:force-strip? "强制-剥离?" '#:in-place? "原地?" '#:namespace "命名空间" '#:quiet? "安静?" '#:strip "剥离" '#:use-cache? "使用-缓存?"))
  'pkg-update  (cons "包-更新" (hash '#:all-platforms? "所有-平台?" '#:all? "所有?" '#:dep-behavior "依赖-行为" '#:dry-run? "试运行?" '#:force-strip? "强制-剥离?" '#:force? "强制?" '#:from-command-line? "来自-命令行?" '#:ignore-checksums? "忽略-校验和?" '#:infer-clone-from-dir? "从-目录-推断-克隆?" '#:link-dirs? "链接-目录?" '#:lookup-for-clone? "为-克隆-查找?" '#:multi-clone-behavior "多-克隆-行为" '#:pull-behavior "拉取-行为" '#:quiet? "安静?" '#:skip-uninstalled? "跳过-未安装?" '#:strict-doc-conflicts? "严格-文档-冲突?" '#:strip "剥离" '#:update-deps? "更新-依赖?" '#:update-implies? "更新-隐含?" '#:use-cache? "使用-缓存?" '#:use-trash? "使用-垃圾?"))
))

;; kw-value-map (4 keywords)
(define kw-value-map (hash
  '#:dep-behavior #hash((fail . #f) (force . #f) (search-ask . #f) (search-auto . #f))
  '#:mode #hash((as-is . #f) (binary . #f) (binary-lib . #f) (built . #f) (source . #f))
  '#:source #hash((dir . #f) (name . #f))
  '#:strip #hash((binary . #f) (binary-lib . #f) (source . #f))
))
