;; conflict-cn (29)

("列表"
  (#:list pkg/main)
  (list racket/base)
  (list racket/kernel/init)
  (list racket/kernel)
  (list syntax/module-reader)
)

("列表?"
  (#:list? pkg/lib)
  (list? racket/base)
  (list? racket/kernel/init)
  (list? racket/kernel)
  (list? syntax/module-reader)
)

("创建-异常"
  (#:make-exn pkg/lib)
  (make-exn racket/base)
  (make-exn syntax/module-reader)
)

("初始-位置"
  (#:init-pos racket/sequence)
  (#:init-position racket/port)
)

("包"
  (#:pkgs pkg/main)
  (pkg pkg/db)
)

("包-名称"
  (#:pkg-name pkg/lib)
  (pkg-name pkg/db)
)

("包含"
  (#:include pkg/lib)
  (#:include pkg/main)
  (include racket/include)
)

("命令行"
  (#:cmdline compiler/embed)
  (command-line racket/cmdline)
)

("引用"
  (#:ref net/git-checkout)
  (quote racket/base)
  (quote racket/kernel/init)
  (quote racket/kernel)
  (quote syntax/module-reader)
)

("强制"
  (#:force pkg/main)
  (force racket/promise)
)

("排除"
  (#:exclude pkg/lib)
  (#:exclude pkg/main)
  (except racket/unit)
)

("标签"
  (#:tag racket/control)
  (tag racket/unit)
)

("格式"
  (#:format file/tar)
  (#:format pkg/main)
  (format racket/base)
  (format racket/kernel/init)
  (format racket/kernel)
  (format syntax/module-reader)
)

("模块"
  (#:modules compiler/embed)
  (#:modules pkg/main)
  (module racket/base)
  (module racket/kernel/init)
  (module racket/kernel)
  (module syntax/module-reader)
)

("模块?"
  (#:module? compiler/compiler)
  (#:modules? pkg/lib)
)

("正则"
  (#:rx pkg/main)
  (regexp racket/base)
  (regexp racket/kernel/init)
  (regexp racket/kernel)
  (regexp syntax/module-reader)
)

("正则?"
  (#:rx? pkg/lib)
  (regexp? racket/base)
  (regexp? racket/kernel/init)
  (regexp? racket/kernel)
  (regexp? syntax/module-reader)
)

("版本"
  (#:version net/http-client)
  (#:version pkg/main)
  (version racket/base)
  (version racket/kernel/init)
  (version racket/kernel)
  (version syntax/module-reader)
)

("目录"
  (#:catalog pkg/db)
  (#:catalog pkg/main)
  (#:dir pkg/main)
)

("空"
  (#:null json/main)
  (empty racket/list)
)

("管理-编译-ZO"
  (#:managed-compile-zo compiler/compiler)
  (managed-compile-zo compiler/cm)
)

("系统-库-子路径"
  (#:system-library-subpath pkg/lib)
  (system-library-subpath racket/base)
  (system-library-subpath racket/kernel/init)
  (system-library-subpath racket/kernel)
  (system-library-subpath syntax/module-reader)
)

("系统-类型"
  (#:system-type file/zip)
  (#:system-type pkg/lib)
  (system-type racket/base)
  (system-type racket/kernel/init)
  (system-type racket/kernel)
  (system-type syntax/module-reader)
)

("组合"
  (#:combine racket/hash)
  (compose racket/base)
  (compose syntax/module-reader)
)

("覆盖"
  (#:override pkg/main)
  (override racket/class)
)

("详细"
  (#:long pkg/main)
  (#:verbose compiler/compiler)
  (verbose compiler/option)
  (verbose setup/option)
)

("详细?"
  (#:long? pkg/lib)
  (#:verbose? compiler/compiler)
  (#:verbose? compiler/embed)
)

("过滤"
  (#:filter file/untar)
  (filter racket/base)
  (filter syntax/module-reader)
)

("链接"
  (#:link pkg/main)
  (link racket/unit)
)

