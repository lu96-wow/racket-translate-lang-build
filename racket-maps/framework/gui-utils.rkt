;; framework/gui-utils
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/10 translated)
(define plain-map (hash
  'gui-utils:cancel-on-right?  #f
  'gui-utils:cursor-delay  #f
  'gui-utils:delay-action  #f
  'gui-utils:format-literal-label  #f
  'gui-utils:get-clickback-delta  #f
  'gui-utils:get-clicked-clickback-delta  #f
  'gui-utils:local-busy-cursor  #f
  'gui-utils:next-untitled-name  #f
  'gui-utils:show-busy-cursor  #f
  'gui-utils:trim-string  #f
))

;; with-kw (4)
(define kw-map (hash
  'gui-utils:get-choice  (cons "gui-工具:获取-选择" (hash '#:dialog-mixin "对话框-混入"))
  'gui-utils:ok/cancel-buttons  (cons "gui-工具:确定/取消-按钮" (hash '#:confirm-style "确认-样式"))
  'gui-utils:quote-literal-label  (cons "gui-工具:引用-字面-标签" (hash '#:quote-amp? "引用-&?"))
  'gui-utils:unsaved-warning  (cons "gui-工具:未保存-警告" (hash '#:dialog-mixin "对话框-混入"))
))
