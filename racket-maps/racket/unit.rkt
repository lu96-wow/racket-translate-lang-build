;; racket/unit
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (37/37 translated)
(define plain-map (hash
  'compound-unit  "复合-单元"
  'compound-unit/infer  "复合-单元/推断"
  'contracted  "已签约"
  'define-compound-unit  "定义-复合-单元"
  'define-compound-unit/infer  "定义-复合-单元/推断"
  'define-signature  "定义-签名"
  'define-signature-form  "定义-签名-形式"
  'define-unit  "定义-单元"
  'define-unit-binding  "定义-单元-绑定"
  'define-unit-from-context  "定义-单元-自-上下文"
  'define-unit/contract  "定义-单元/契约"
  'define-unit/new-import-export  "定义-单元/新-导入-导出"
  'define-unit/s  "定义-单元/s"
  'define-values-for-export  "定义-值-用于-导出"
  'define-values/invoke-unit  "定义-值/调用-单元"
  'define-values/invoke-unit/infer  "定义-值/调用-单元/推断"
  'except  "排除"
  'export  "导出"
  'extends  "扩展"
  'import  "导入"
  'init-depend  "初始化-依赖"
  'invoke-unit  "调用-单元"
  'invoke-unit/infer  "调用-单元/推断"
  'link  "链接"
  'only  "仅"
  'open  "打开"
  'prefix  "前缀"
  'provide-signature-elements  "提供-签名-元素"
  'rename  "重命名"
  'struct/ctc  "结构/单元契约"
  'tag  "标签"
  'unit  "单元"
  'unit-from-context  "单元-自-上下文"
  'unit/c  "单元/契约"
  'unit/new-import-export  "单元/新-导入-导出"
  'unit/s  "单元/s"
  'unit?  "单元?"
))

