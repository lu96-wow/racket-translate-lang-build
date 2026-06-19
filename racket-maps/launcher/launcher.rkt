;; launcher/launcher
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (37/37 translated)
(define plain-map (hash
  'available-gracket-variants  "可用-图形-Racket-变体"
  'available-mred-variants  "可用-MrEd-变体"
  'available-mzscheme-variants  "可用-MzScheme-变体"
  'available-racket-variants  "可用-Racket-变体"
  'build-aux-from-path  "从-路径-构建-辅助"
  'current-launcher-variant  "当前-启动器-变体"
  'extract-aux-from-path  "从-路径-提取-辅助"
  'gracket-launcher-add-suffix  "图形-Racket-启动器-添加-后缀"
  'gracket-launcher-is-actually-directory?  "图形-Racket-启动器-实际是-目录?"
  'gracket-launcher-is-directory?  "图形-Racket-启动器-是-目录?"
  'gracket-launcher-put-file-extension+style+filters  "图形-Racket-启动器-放置-文件-扩展名+样式+过滤"
  'gracket-launcher-up-to-date?  "图形-Racket-启动器-最新?"
  'install-gracket-program-launcher  "安装-图形-Racket-程序-启动器"
  'install-mred-program-launcher  "安装-MrEd-程序-启动器"
  'install-mzscheme-program-launcher  "安装-MzScheme-程序-启动器"
  'install-racket-program-launcher  "安装-Racket-程序-启动器"
  'installed-desktop-path->icon-path  "已安装-桌面-路径->图标-路径"
  'installed-executable-path->desktop-path  "已安装-可执行-路径->桌面-路径"
  'make-gracket-program-launcher  "创建-图形-Racket-程序-启动器"
  'make-mred-program-launcher  "创建-MrEd-程序-启动器"
  'make-mzscheme-program-launcher  "创建-MzScheme-程序-启动器"
  'make-racket-program-launcher  "创建-Racket-程序-启动器"
  'mred-launcher-add-suffix  "MrEd-启动器-添加-后缀"
  'mred-launcher-is-actually-directory?  "MrEd-启动器-实际是-目录?"
  'mred-launcher-is-directory?  "MrEd-启动器-是-目录?"
  'mred-launcher-put-file-extension+style+filters  "MrEd-启动器-放置-文件-扩展名+样式+过滤"
  'mred-launcher-up-to-date?  "MrEd-启动器-最新?"
  'mzscheme-launcher-add-suffix  "MzScheme-启动器-添加-后缀"
  'mzscheme-launcher-is-actually-directory?  "MzScheme-启动器-实际是-目录?"
  'mzscheme-launcher-is-directory?  "MzScheme-启动器-是-目录?"
  'mzscheme-launcher-put-file-extension+style+filters  "MzScheme-启动器-放置-文件-扩展名+样式+过滤"
  'mzscheme-launcher-up-to-date?  "MzScheme-启动器-最新?"
  'racket-launcher-add-suffix  "Racket-启动器-添加-后缀"
  'racket-launcher-is-actually-directory?  "Racket-启动器-实际是-目录?"
  'racket-launcher-is-directory?  "Racket-启动器-是-目录?"
  'racket-launcher-put-file-extension+style+filters  "Racket-启动器-放置-文件-扩展名+样式+过滤"
  'racket-launcher-up-to-date?  "Racket-启动器-最新?"
))

;; with-kw (8)
(define kw-map (hash
  'gracket-program-launcher-path  (cons "图形-Racket-程序-启动器-路径" (hash '#:console? "控制台?" '#:tethered? "绑定?" '#:user? "用户?"))
  'make-gracket-launcher  (cons "创建-图形-Racket-启动器" (hash '#:tether-mode "绑定-模式"))
  'make-mred-launcher  (cons "创建-MrEd-启动器" (hash '#:tether-mode "绑定-模式"))
  'make-mzscheme-launcher  (cons "创建-MzScheme-启动器" (hash '#:tether-mode "绑定-模式"))
  'make-racket-launcher  (cons "创建-Racket-启动器" (hash '#:tether-mode "绑定-模式"))
  'mred-program-launcher-path  (cons "MrEd-程序-启动器-路径" (hash '#:console? "控制台?" '#:tethered? "绑定?" '#:user? "用户?"))
  'mzscheme-program-launcher-path  (cons "MzScheme-程序-启动器-路径" (hash '#:tethered? "绑定?" '#:user? "用户?"))
  'racket-program-launcher-path  (cons "Racket-程序-启动器-路径" (hash '#:tethered? "绑定?" '#:user? "用户?"))
))
