;; racket/contract/combinator
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (81/81 translated)
(define plain-map (hash
  'arrow-contract-info  "箭头-契约-信息"
  'arrow-contract-info-accepts-arglist  "箭头-契约-信息-接受-参数列表"
  'arrow-contract-info-chaperone-procedure  "箭头-契约-信息-监护-过程"
  'arrow-contract-info-check-first-order  "箭头-契约-信息-检查-一阶"
  'arrow-contract-info?  "箭头-契约-信息?"
  'blame-add-missing-party  "责备-添加-缺失-方"
  'blame-add-unknown-context  "责备-添加-未知-上下文"
  'blame-context  "责备-上下文"
  'blame-contract  "责备-契约"
  'blame-fmt->-string  "责备-格式->字符串"
  'blame-missing-party?  "责备-缺失-方?"
  'blame-negative  "责备-负面"
  'blame-original?  "责备-原始?"
  'blame-positive  "责备-正面"
  'blame-replace-negative  "责备-替换-负面"
  'blame-replaced-negative?  "责备-已替换-负面?"
  'blame-source  "责备-源"
  'blame-swap  "责备-交换"
  'blame-swapped?  "责备-已交换?"
  'blame-update  "责备-更新"
  'blame-value  "责备-值"
  'blame?  "责备?"
  'build-compound-type-name  "构建-复合-类型-名称"
  'chaperone-contract-property?  "监护-契约-属性?"
  'char-in/c  "字符-在/契约"
  'coerce-chaperone-contract  "强制-监护-契约"
  'coerce-chaperone-contracts  "强制-监护-契约集"
  'coerce-contract  "强制-契约"
  'coerce-contract/f  "强制-契约/f"
  'coerce-contracts  "强制-契约集"
  'coerce-flat-contract  "强制-平坦-契约"
  'coerce-flat-contracts  "强制-平坦-契约集"
  'contract-continuation-mark-key  "契约-续延-标记-键"
  'contract-custom-write-property-proc  "契约-自定义-写入-属性-过程"
  'contract-equivalent?  "契约-等价?"
  'contract-first-order  "契约-一阶"
  'contract-first-order-passes?  "契约-一阶-通过?"
  'contract-pos/neg-doubling  "契约-正面/负面-加倍"
  'contract-property?  "契约-属性?"
  'contract-stronger?  "契约-更强?"
  'contract-struct-exercise  "契约-结构-练习"
  'contract-struct-generate  "契约-结构-生成"
  'contract-struct-late-neg-projection  "契约-结构-后期-否定-投影"
  'contract-struct-list-contract?  "契约-结构-列表-契约?"
  'current-blame-format  "当前-责备-格式"
  'custom-write-property-proc  "自定义-写入-属性-过程"
  'define/final-prop  "定义/最终-属性"
  'define/subexpression-pos-prop  "定义/子表达式-位置-属性"
  'define/subexpression-pos-prop/name  "定义/子表达式-位置-属性/名称"
  'eq-contract-val  "eq-契约-值"
  'eq-contract?  "eq-契约?"
  'equal-contract-val  "相等-契约-值"
  'equal-contract?  "相等-契约?"
  'exn:fail:contract:blame  "异常:失败:契约:责备"
  'exn:fail:contract:blame-object  "异常:失败:契约:责备-对象"
  'exn:fail:contract:blame?  "异常:失败:契约:责备?"
  'flat-contract-property?  "平坦-契约-属性?"
  'has-blame?  "有-责备?"
  'impersonator-prop:blame  "冒充-属性:责备"
  'impersonator-prop:contracted  "冒充-属性:已契约"
  'list-contract?  "列表-契约?"
  'make-exn:fail:contract:blame  "创建-异常:失败:契约:责备"
  'prop:arrow-contract  "属性:箭头-契约"
  'prop:arrow-contract-get-info  "属性:箭头-契约-获取-信息"
  'prop:arrow-contract?  "属性:箭头-契约?"
  'prop:blame  "属性:责备"
  'prop:chaperone-contract  "属性:监护-契约"
  'prop:contract  "属性:契约"
  'prop:contracted  "属性:已契约"
  'prop:flat-contract  "属性:平坦-契约"
  'prop:orc-contract  "属性:ORC-契约"
  'prop:orc-contract-get-subcontracts  "属性:ORC-契约-获取-子契约"
  'prop:orc-contract?  "属性:ORC-契约?"
  'prop:recursive-contract  "属性:递归-契约"
  'prop:recursive-contract-unroll  "属性:递归-契约-展开"
  'prop:recursive-contract?  "属性:递归-契约?"
  'skip-projection-wrapper?  "跳过-投影-包装器?"
  'struct:arrow-contract-info  "结构:箭头-契约-信息"
  'struct:exn:fail:contract:blame  "结构:异常:失败:契约:责备"
  'value-blame  "值-责备"
  'with-contract-continuation-mark  "带-契约-续延-标记"
))

;; with-kw (8)
(define kw-map (hash
  'blame-add-context  (cons "责备-添加-上下文" (hash '#:important #f '#:swap? #f))
  'build-chaperone-contract-property  (cons "构建-监护-契约-属性" (hash '#:collapsible-late-neg-projection #f '#:equivalent #f '#:exercise #f '#:first-order #f '#:generate #f '#:late-neg-projection #f '#:list-contract? #f '#:name #f '#:projection #f '#:stronger #f '#:val-first-projection #f))
  'build-contract-property  (cons "构建-契约-属性" (hash '#:collapsible-late-neg-projection #f '#:equivalent #f '#:exercise #f '#:first-order #f '#:generate #f '#:late-neg-projection #f '#:list-contract? #f '#:name #f '#:projection #f '#:stronger #f '#:trusted #f '#:val-first-projection #f))
  'build-flat-contract-property  (cons "构建-平坦-契约-属性" (hash '#:collapsible-late-neg-projection #f '#:equivalent #f '#:first-order #f '#:generate #f '#:late-neg-projection #f '#:list-contract? #f '#:name #f '#:projection #f '#:stronger #f '#:val-first-projection #f))
  'make-chaperone-contract  (cons "创建-监护-契约" (hash '#:collapsible-late-neg-projection #f '#:equivalent #f '#:first-order #f '#:late-neg-projection #f '#:list-contract? #f '#:name #f '#:projection #f '#:stronger #f '#:val-first-projection #f))
  'make-contract  (cons "创建-契约" (hash '#:collapsible-late-neg-projection #f '#:equivalent #f '#:exercise #f '#:first-order #f '#:generate #f '#:late-neg-projection #f '#:list-contract? #f '#:name #f '#:projection #f '#:stronger #f '#:val-first-projection #f))
  'make-flat-contract  (cons "创建-平坦-契约" (hash '#:collapsible-late-neg-projection #f '#:equivalent #f '#:first-order #f '#:late-neg-projection #f '#:list-contract? #f '#:name #f '#:projection #f '#:stronger #f '#:val-first-projection #f))
  'raise-blame-error  (cons "引发-责备-错误" (hash '#:missing-party #f))
))
