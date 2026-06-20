#lang racket-cn
(需要 racket/gui)

;; eval 用的命名空间
(定义 计算命名空间 (创建-基础-命名空间))

;; 主窗口
(定义 主窗口
  (新建 frame%
    [label "中文 Racket 计算器"]
    [width 320]
    [height 150]))

;; 输入框
(定义 输入框
  (新建 text-field%
    [label "表达式: "]
    [parent 主窗口]
    [init-value "(+ 1 2 3 4 5)"]))

;; 结果显示
(定义 结果显示
  (新建 message%
    [label "结果: 待计算"]
    [parent 主窗口]
    [auto-resize #t]))

;; 计算按钮
(新建 button%
  [label "计 算"]
  [parent 主窗口]
  [callback
   (函数 (按钮 事件)
     (带-处理器
       ([exn:fail? (函数 (e)
         (发送 结果显示 set-label
           (格式 "错误: ~a" (exn-message e))))])
       (定义 表达式 (发送 输入框 get-value))
       (定义 结果
         (求值 (read (open-input-string 表达式)) 计算命名空间))
       (发送 结果显示 set-label
         (格式 "结果: ~a" 结果))))])

;; 显示窗口
(发送 主窗口 show #t)
