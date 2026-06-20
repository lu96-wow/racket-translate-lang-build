;; mred/main
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (1/264 translated)
(define plain-map (hash
  'add-color<%>  #f
  'add-editor-keymap-functions  #f
  'add-pasteboard-keymap-functions  #f
  'add-text-keymap-functions  #f
  'any-control+alt-is-altgr  #f
  'append-editor-font-menu-items  #f
  'application-about-handler  #f
  'application-dark-mode-handler  #f
  'application-file-handler  #f
  'application-preferences-handler  #f
  'application-quit-handler  #f
  'application-start-empty-handler  #f
  'area-container-window<%>  #f
  'area-container<%>  #f
  'area<%>  #f
  'begin-busy-cursor  #f
  'bell  #f
  'bitmap%  #f
  'bitmap-dc%  #f
  'brush%  #f
  'brush-list%  #f
  'brush-style/c  #f
  'button%  #f
  'can-get-page-setup-from-user?  #f
  'canvas%  #f
  'canvas<%>  #f
  'caret-status?  #f
  'check-box%  #f
  'check-for-break  #f
  'checkable-menu-item%  #f
  'choice%  #f
  'clipboard-client%  #f
  'clipboard<%>  #f
  'color%  #f
  'color-database<%>  #f
  'column-control-event%  #f
  'combo-field%  #f
  'control-event%  #f
  'control<%>  #f
  'current-eventspace  #f
  'current-eventspace-has-menu-root?  #f
  'current-eventspace-has-standard-menus?  #f
  'current-font-list  #f
  'current-ps-setup  #f
  'current-text-keymap-initializer  #f
  'cursor%  #f
  'dc-path%  #f
  'dc<%>  #f
  'dialog%  #f
  'dimension-integer?  #f
  'editor-admin%  #f
  'editor-canvas%  #f
  'editor-data%  #f
  'editor-data-class%  #f
  'editor-data-class-list<%>  #f
  'editor-set-x-selection-mode  #f
  'editor-snip%  #f
  'editor-snip-editor-admin<%>  #f
  'editor-stream-in%  #f
  'editor-stream-in-base%  #f
  'editor-stream-in-bytes-base%  #f
  'editor-stream-out%  #f
  'editor-stream-out-base%  #f
  'editor-stream-out-bytes-base%  #f
  'editor-wordbreak-map%  #f
  'editor<%>  #f
  'end-busy-cursor  #f
  'event%  #f
  'event-dispatch-handler  #f
  'eventspace-event-evt  #f
  'eventspace-handler-thread  #f
  'eventspace-shutdown?  #f
  'eventspace?  #f
  'file-creator-and-type  #f
  'find-graphical-system-path  #f
  'flush-display  #f
  'font%  #f
  'font-family/c  #f
  'font-feature-settings/c  #f
  'font-hinting/c  #f
  'font-list%  #f
  'font-name-directory<%>  #f
  'font-smoothing/c  #f
  'font-style/c  #f
  'font-weight/c  #f
  'frame%  #f
  'gauge%  #f
  'get-choices-from-user  #f
  'get-color-from-user  #f
  'get-current-gl-context  #f
  'get-current-mouse-state  #f
  'get-default-shortcut-prefix  #f
  'get-display-count  #f
  'get-display-depth  #f
  'get-family-builtin-face  #f
  'get-font-from-user  #f
  'get-highlight-background-color  #f
  'get-highlight-text-color  #f
  'get-label-background-color  #f
  'get-label-foreground-color  #f
  'get-page-setup-from-user  #f
  'get-panel-background  #f
  'get-ps-setup-from-user  #f
  'get-snip-class  #f
  'get-the-editor-data-class-list  #f
  'get-the-snip-class-list  #f
  'get-top-level-edit-target-window  #f
  'get-top-level-focus-window  #f
  'get-top-level-windows  #f
  'get-window-text-extent  #f
  'gl-config%  #f
  'gl-context<%>  #f
  'graphical-read-eval-print-loop  #f
  'graphical-system-type  #f
  'group-box-panel%  #f
  'grow-box-spacer-pane%  #f
  'hide-cursor-until-moved  #f
  'horizontal-pane%  #f
  'horizontal-panel%  #f
  'image-snip%  #f
  'image-type?  #f
  'int->img-type  #f
  'is-busy?  #f
  'is-color-display?  #f
  'key-code-symbol?  #f
  'key-event%  #f
  'keymap%  #f
  'label->plain-label  #f
  'label-string?  #f
  'labelled-menu-item<%>  #f
  'linear-gradient%  #f
  'list-box%  #f
  'list-control<%>  #f
  'make-color  #f
  'make-gl-bitmap  #f
  'make-gui-empty-namespace  #f
  'make-gui-namespace  #f
  'make-monochrome-bitmap  #f
  'make-screen-bitmap  #f
  'make-snip-class-link  #f
  'make-the-snip-class-list  #f
  'map-command-as-meta-key  #f
  'menu%  #f
  'menu-bar%  #f
  'menu-control-font  #f
  'menu-item%  #f
  'menu-item-container<%>  #f
  'menu-item<%>  #f
  'message%  #f
  'mouse-event%  #f
  'mult-color<%>  #f
  'normal-control-font  #f
  'open-input-graphical-file  #f
  'pane%  #f
  'panel%  #f
  'pasteboard%  #f
  'pdf-dc%  #f
  'pen%  #f
  'pen-cap-style/c  #f
  'pen-join-style/c  #f
  'pen-list%  #f
  'pen-style/c  #f
  'play-sound  #f
  'point%  #f
  'popup-menu%  #f
  'position-integer?  #f
  'positive-dimension-integer?  #f
  'post-script-dc%  #f
  'printer-dc%  #f
  'ps-setup%  #f
  'queue-callback  #f
  'radial-gradient%  #f
  'radio-box%  #f
  'read-editor-global-footer  #f
  'read-editor-global-header  #f
  'read-editor-version  #f
  'readable-snip<%>  #f
  'record-dc%  #f
  'recorded-datum->procedure  #f
  'region%  #f
  'register-collecting-blit  #f
  'scroll-event%  #f
  'selectable-menu-item<%>  #f
  'send-message-to-window  #f
  'separator-menu-item%  #f
  'set-snip-admin!  #f
  'set-snip-class-link-c!  #f
  'set-snip-class-link-header-flag!  #f
  'set-snip-class-link-name!  #f
  'set-snip-count!  #f
  'set-snip-flags!  #f
  'set-snip-grapheme-count!  #f
  'set-snip-line!  #f
  'set-snip-loc!  #f
  'set-snip-next!  #f
  'set-snip-prev!  #f
  'set-snip-style!  #f
  'sleep/yield  #f
  'slider%  #f
  'small-control-font  #f
  'snip%  #f
  'snip%-get-text  #f
  'snip->admin  #f
  'snip->count  #f
  'snip->flags  #f
  'snip->grapheme-count  #f
  'snip->line  #f
  'snip->loc  #f
  'snip->next  #f
  'snip->prev  #f
  'snip->snipclass  #f
  'snip->style  #f
  'snip-admin%  #f
  'snip-class%  #f
  'snip-class-link  #f
  'snip-class-link-c  #f
  'snip-class-link-header-flag  #f
  'snip-class-link-map-position  #f
  'snip-class-link-name  #f
  'snip-class-link-reading-version  #f
  'snip-class-link?  #f
  'snip-class-list<%>  #f
  'spacing-integer?  #f
  'special-control-key  #f
  'special-option-key  #f
  'string-snip%  #f
  'string-snip-buffer  #f
  'string-snip-dtext  #f
  'struct:snip-class-link  #f
  'style-delta%  #f
  'style-list%  #f
  'style<%>  #f
  'subarea<%>  #f
  'subwindow<%>  #f
  'svg-dc%  #f
  'system-position-ok-before-cancel?  #f
  'tab-panel%  #f
  'tab-snip%  #f
  'text%  #f
  'text-editor-load-handler  #f
  'text-field%  #f
  'textual-read-eval-print-loop  #f
  'the-brush-list  #f
  'the-clipboard  #f
  'the-color-database  #f
  'the-editor-wordbreak-map  #f
  'the-font-list  #f
  'the-font-name-directory  #f
  'the-pen-list  #f
  'the-snip-class-list  #f
  'the-style-list  #f
  'the-x-selection-clipboard  #f
  'timer%  #f
  'tiny-control-font  #f
  'top-level-window<%>  #f
  'unregister-collecting-blit  #f
  'vertical-pane%  #f
  'vertical-panel%  #f
  'view-control-font  #f
  'window<%>  #f
  'write-editor-global-footer  #f
  'write-editor-global-header  #f
  'write-editor-version  #f
  'yield  "产出"
))

;; with-kw (25)
(define kw-map (hash
  'append-editor-operation-menu-items  (cons "追加-编辑器-操作-菜单-项" (hash '#:popup-position "弹出-位置"))
  'get-directory  (cons "获取-目录" (hash '#:dialog-mixin "对话框-混入"))
  'get-display-backing-scale  (cons "获取-显示-背景-缩放" (hash '#:monitor "监视器"))
  'get-display-left-top-inset  (cons "获取-显示-左-上-内边距" (hash '#:monitor "监视器"))
  'get-display-size  (cons "获取-显示-大小" (hash '#:monitor "监视器"))
  'get-face-list  (cons "获取-字体名-列表" (hash '#:all-variants? "所有-变体?"))
  'get-file  (cons "获取-文件" (hash '#:dialog-mixin "对话框-混入"))
  'get-file-list  (cons "获取-文件-列表" (hash '#:dialog-mixin "对话框-混入"))
  'get-resource  (cons "获取-资源" (hash '#:type "类型"))
  'get-text-from-user  (cons "获取-文本-从-用户" (hash '#:dialog-mixin "对话框-混入" '#:validate "验证"))
  'make-bitmap  (cons "创建-位图" (hash '#:backing-scale "背景-缩放"))
  'make-brush  (cons "创建-brush" (hash '#:color "颜色" '#:gradient "渐变" '#:immutable? "不可变?" '#:stipple "点画" '#:style "样式" '#:transformation "变换"))
  'make-eventspace  (cons "创建-eventspace" (hash '#:suspend-to-kill? "挂起-以-终止?"))
  'make-font  (cons "创建-字体" (hash '#:face "字体名" '#:family "字体族" '#:feature-settings "功能-设置" '#:font-list "字体-列表" '#:hinting "提示" '#:size "大小" '#:size-in-pixels? "像素-大小?" '#:smoothing "平滑" '#:style "样式" '#:underlined? "下划线?" '#:weight "字重"))
  'make-pen  (cons "创建-pen" (hash '#:cap "线帽" '#:color "颜色" '#:immutable? "不可变?" '#:join "连接" '#:stipple "点画" '#:style "样式" '#:width "宽度"))
  'make-platform-bitmap  (cons "创建-platform-位图" (hash '#:backing-scale "背景-缩放"))
  'message+check-box  (cons "消息+复选框" (hash '#:dialog-mixin "对话框-混入"))
  'message+check-box/custom  (cons "消息+复选框/自定义" (hash '#:dialog-mixin "对话框-混入" '#:return-the-dialog? "返回-对话框?"))
  'message-box  (cons "消息-box" (hash '#:dialog-mixin "对话框-混入"))
  'message-box/custom  (cons "消息-box/custom" (hash '#:dialog-mixin "对话框-混入" '#:return-the-dialog? "返回-对话框?"))
  'open-input-text-editor  (cons "打开-输入-文本-编辑器" (hash '#:lock-while-reading? "读取时-锁定?"))
  'open-output-text-editor  (cons "打开-输出-文本-编辑器" (hash '#:eventspace "事件空间"))
  'put-file  (cons "放置-文件" (hash '#:dialog-mixin "对话框-混入"))
  'read-bitmap  (cons "读取-位图" (hash '#:backing-scale "背景-缩放" '#:save-data-from-file? "从文件-保存-数据?" '#:try-@2x? "尝试-@2x?"))
  'write-resource  (cons "写入-资源" (hash '#:create-key? "创建-键?" '#:type "类型"))
))
