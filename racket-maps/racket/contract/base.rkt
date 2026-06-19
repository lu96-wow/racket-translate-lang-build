;; racket/contract/base
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (103/105 translated)
(define plain-map (hash
  '*list/c  "*列表/契约"
  '->  #f
  '->*  #f
  '->d  "->依赖"
  '->i  "->不可变"
  '</c  "</契约"
  '<=/c  "<=/契约"
  '=/c  "=/契约"
  '>/c  ">/契约"
  '>=/c  ">=/契约"
  'and/c  "与/契约"
  'any  "任意"
  'any/c  "任意/契约"
  'arity-checking-wrapper  "元数-检查-包装器"
  'base->-doms/c  "基础->-域/契约"
  'base->-rngs/c  "基础->-范围/契约"
  'base->?  "基础->?"
  'between/c  "之间/契约"
  'blame-add-car-context  "责备-添加-取首-上下文"
  'blame-add-cdr-context  "责备-添加-取余-上下文"
  'blame-add-nth-arg-context  "责备-添加-第n-参数-上下文"
  'blame-add-range-context  "责备-添加-范围-上下文"
  'box-immutable/c  "盒-不可变/契约"
  'case->  "分支->"
  'channel/c  "通道/契约"
  'chaperone-contract?  "监护-契约?"
  'char-in  "字符-在"
  'complex/c  "复数/契约"
  'cons/c  "构造/契约"
  'cons/dc  "构造/依赖契约"
  'continuation-mark-key/c  "续延-标记-键/契约"
  'contract  "契约"
  'contract-continuation-mark-key  "契约-续延-标记-键"
  'contract-in  "契约-入"
  'contract-late-neg-projection  "契约-后期-否定-投影"
  'contract-name  "契约-名称"
  'contract-out  "契约-出"
  'contract-projection  "契约-投影"
  'contract-val-first-projection  "契约-值-优先-投影"
  'contract?  "契约?"
  'define-module-boundary-contract  "定义-模块-边界-契约"
  'define-opt/c  "定义-可选/契约"
  'evt/c  "事件/契约"
  'failure-result/c  "失败-结果/契约"
  'false/c  "假/契约"
  'first-or/c  "优先-或/契约"
  'flat-contract  "平坦-契约"
  'flat-contract-predicate  "平坦-契约-谓词"
  'flat-contract?  "平坦-契约?"
  'flat-murec-contract  "平坦-互递归-契约"
  'flat-named-contract  "平坦-命名-契约"
  'flat-rec-contract  "平坦-递归-契约"
  'get/build-late-neg-projection  "获取/构建-后期-否定-投影"
  'get/build-val-first-projection  "获取/构建-值-优先-投影"
  'has-blame?  "有-责备?"
  'has-contract?  "有-契约?"
  'hash/dc  "哈希/依赖契约"
  'if/c  "如果/契约"
  'impersonator-contract?  "冒充-契约?"
  'integer-in  "整数-在"
  'invariant-assertion  "不变-断言"
  'keywords-match  "关键字-匹配"
  'list*of  "列表*之"
  'list-contract?  "列表-契约?"
  'list/c  "列表/契约"
  'listof  "列表之"
  'make-none/c  "创建-无/契约"
  'matches-arity-exactly?  "匹配-元数-完全?"
  'mutable-treelist/c  "可变-树列表/契约"
  'n->th  "n->第"
  'natural-number/c  "自然-数/契约"
  'non-empty-listof  "非-空-列表之"
  'none/c  "无/契约"
  'not/c  "非/契约"
  'one-of/c  "之一/契约"
  'opt/c  "可选/契约"
  'or/c  "或/契约"
  'predicate/c  "谓词/契约"
  'printable/c  "可打印/契约"
  'procedure-arity-includes/c  "过程-元数-包含/契约"
  'promise/c  "承诺/契约"
  'prompt-tag/c  "提示-标签/契约"
  'provide/contract  "提供/契约"
  'real-in  "实数-在"
  'recontract-out  "重新契约-出"
  'recursive-contract  "递归-契约"
  'rename-contract  "重命名-契约"
  'string-len/c  "字符串-长度/契约"
  'struct-guard/c  "结构-守卫/契约"
  'struct-type-property/c  "结构-类型-属性/契约"
  'struct/c  "结构/契约"
  'struct/dc  "结构/依赖契约"
  'suggest/c  "建议/契约"
  'symbols  "符号"
  'syntax/c  "语法/契约"
  'tail-marks-match?  "尾部-标记-匹配?"
  'the-unsupplied-arg  "未提供的-参数"
  'unconstrained-domain->  "无约束-域->"
  'unspecified-dom  "未指定-域"
  'unsupplied-arg?  "未提供-参数?"
  'value-blame  "值-责备"
  'value-contract  "值-契约"
  'values/drop  "值/丢弃"
  'vector-immutable/c  "向量-不可变/契约"
  'vector-immutableof  "向量-不可变之"
))

;; with-kw (11)
(define kw-map (hash
  'bad-number-of-results  (cons "错误-结果-数" (hash '#:missing-party "缺失-方"))
  'box/c  (cons "箱/契约" (hash '#:flat? "平坦?" '#:immutable "不可变"))
  'dynamic->*  (cons "动态->*" (hash '#:mandatory-domain-contracts "强制-域-契约" '#:mandatory-keyword-contracts "强制-关键字-契约" '#:mandatory-keywords "强制-关键字" '#:optional-domain-contracts "可选-域-契约" '#:optional-keyword-contracts "可选-关键字-契约" '#:optional-keywords "可选-关键字" '#:range-contracts "范围-契约" '#:rest-contract "剩余-契约"))
  'flat-contract-with-explanation  (cons "平坦-契约-带-解释" (hash '#:name "名称"))
  'hash/c  (cons "哈希/契约" (hash '#:flat? "平坦?" '#:immutable "不可变"))
  'parameter/c  (cons "参数/契约" (hash '#:impersonator? "冒充?"))
  'property/c  (cons "属性/契约" (hash '#:name "名称"))
  'raise-not-cons-blame-error  (cons "引发-非-构造-责备-错误" (hash '#:missing-party "缺失-方"))
  'treelist/c  (cons "树列表/契约" (hash '#:flat? "平坦?" '#:lazy? "惰性?"))
  'vector/c  (cons "向量/契约" (hash '#:flat? "平坦?" '#:immutable "不可变"))
  'vectorof  (cons "向量之" (hash '#:eager "急切" '#:flat? "平坦?" '#:immutable "不可变"))
))
