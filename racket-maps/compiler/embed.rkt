;; compiler/embed
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (5/5 translated)
(define plain-map (hash
  'embedding-executable-add-suffix  "嵌入-可执行-添加-后缀"
  'embedding-executable-is-actually-directory?  "嵌入-可执行-实际是-目录?"
  'embedding-executable-is-directory?  "嵌入-可执行-是-目录?"
  'embedding-executable-put-file-extension+style+filters  "嵌入-可执行-放置-文件-扩展名+样式+过滤"
  'make-embedding-executable  "创建-嵌入-可执行文件"
))

;; with-kw (2)
(define kw-map (hash
  'create-embedding-executable  (cons "创建-嵌入-可执行" (hash '#:aux "辅助" '#:cmdline "命令行" '#:collects-dest "收集-目标" '#:collects-path "收集-路径" '#:compiler "编译器" '#:configure-via-first-module? "通过-首个-模块-配置?" '#:early-literal-expressions "早期-字面-表达式" '#:expand-namespace "展开-命名空间" '#:get-extra-imports "获取-额外-导入" '#:gracket? "图形-Racket?" '#:launcher? "启动器?" '#:literal-expression "字面-表达式" '#:literal-expressions "字面-表达式集" '#:literal-files "字面-文件" '#:modules "模块" '#:mred? "MrEd?" '#:on-extension "在-扩展名" '#:src-filter "源-过滤" '#:variant "变体" '#:verbose? "详细?"))
  'write-module-bundle  (cons "写入-模块-捆绑" (hash '#:compiler "编译器" '#:configure-via-first-module? "通过-首个-模块-配置?" '#:early-literal-expressions "早期-字面-表达式" '#:expand-namespace "展开-命名空间" '#:get-extra-imports "获取-额外-导入" '#:literal-expressions "字面-表达式集" '#:literal-files "字面-文件" '#:modules "模块" '#:on-extension "在-扩展名" '#:src-filter "源-过滤" '#:verbose? "详细?"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:variant (hash 'cgc #f 'cs #f)
))
