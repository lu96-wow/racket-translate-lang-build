;; compiler/compiler
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (2/2 translated)
(define plain-map (hash
  'compile-notify-handler  "编译-通知-处理器"
  'current-compiler-dynamic-require-wrapper  "当前-编译器-动态-需求-包装器"
))

;; with-kw (4)
(define kw-map (hash
  'compile-collection-zos  (cons "编译-集合-ZO" (hash '#:has-module-suffix? "有-模块-后缀?" '#:managed-compile-zo "管理-编译-ZO" '#:omit-root "省略-根" '#:skip-doc-sources? "跳过-文档-源?" '#:skip-path "跳过-路径" '#:skip-paths "跳过-路径集"))
  'compile-directory-srcs  (cons "编译-目录-源" (hash '#:has-module-suffix? "有-模块-后缀?" '#:omit-root "省略-根" '#:skip-doc-sources? "跳过-文档-源?" '#:skip-path "跳过-路径" '#:skip-paths "跳过-路径集" '#:verbose "详细"))
  'compile-directory-zos  (cons "编译-目录-ZO" (hash '#:has-module-suffix? "有-模块-后缀?" '#:managed-compile-zo "管理-编译-ZO" '#:omit-root "省略-根" '#:skip-doc-sources? "跳过-文档-源?" '#:skip-path "跳过-路径" '#:skip-paths "跳过-路径集" '#:verbose "详细"))
  'compile-zos  (cons "编译-ZO" (hash '#:module? "模块?" '#:verbose? "详细?"))
))
