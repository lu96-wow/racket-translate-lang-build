;; racket/linklet
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (37/37 translated)
(define plain-map (hash
  'compile-linklet  "编译-链接小程序"
  'correlated->datum  "关联->数据"
  'correlated-column  "关联-列"
  'correlated-e  "关联-e"
  'correlated-line  "关联-行"
  'correlated-position  "关联-位置"
  'correlated-property  "关联-属性"
  'correlated-property-symbol-keys  "关联-属性-符号-键"
  'correlated-source  "关联-源"
  'correlated-span  "关联-跨度"
  'correlated?  "关联?"
  'datum->correlated  "数据->关联"
  'decompile-linklet  "反编译-链接小程序"
  'eval-linklet  "求值-链接小程序"
  'hash->linklet-bundle  "哈希->链接小程序-包"
  'hash->linklet-directory  "哈希->链接小程序-目录"
  'instance-data  "实例-数据"
  'instance-name  "实例-名称"
  'instance-set-variable-value!  "实例-设置-变量-值!"
  'instance-unset-variable!  "实例-取消设置-变量!"
  'instance-variable-names  "实例-变量-名称"
  'instance-variable-value  "实例-变量-值"
  'instance?  "实例?"
  'instantiate-linklet  "实例化-链接小程序"
  'linklet-add-target-machine-info  "链接小程序-添加-目标-机器-信息"
  'linklet-body-reserved-symbol?  "链接小程序-体-保留-符号?"
  'linklet-bundle->hash  "链接小程序-包->哈希"
  'linklet-bundle?  "链接小程序-包?"
  'linklet-directory->hash  "链接小程序-目录->哈希"
  'linklet-directory?  "链接小程序-目录?"
  'linklet-export-variables  "链接小程序-导出-变量"
  'linklet-import-variables  "链接小程序-导入-变量"
  'linklet-summarize-target-machine-info  "链接小程序-汇总-目标-机器-信息"
  'linklet?  "链接小程序?"
  'make-instance  "创建-实例"
  'recompile-linklet  "重新编译-链接小程序"
  'variable-reference->instance  "变量-引用->实例"
))

