;; setup/pack
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/3 translated)
(define plain-map (hash
  'pack  #f
  'pack-collections  #f
  'std-filter  #f
))

;; with-kw (3)
(define kw-map (hash
  'mztar  (cons "mz打包" (hash '#:as-path "作为-路径"))
  'pack-collections-plt  (cons "打包-集合包-plt" (hash '#:at-plt-home? "在-plt-主目录?" '#:extra-setup-collections "额外-设置-集合包" '#:file-filter "文件-过滤" '#:replace? "替换?" '#:test-plt-collects? "测试-plt-集合包?"))
  'pack-plt  (cons "打包-plt" (hash '#:as-paths "作为-路径列表" '#:at-plt-home? "在-plt-主目录?" '#:collections "集合包" '#:conflicts "冲突" '#:encode? "编码?" '#:file-filter "文件-过滤" '#:file-mode "文件-模式" '#:plt-relative? "plt-相对?" '#:requires "依赖" '#:test-plt-dirs "测试-plt-目录" '#:unpack-unit "解包-单元"))
))
