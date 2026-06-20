;; compiler/compilation-path
#lang racket/base
(provide kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; with-kw (3)
(define kw-map (hash
  'get-compilation-bytecode-file  (cons "获取-compilation-bytecode-文件" (hash '#:default-root "默认-根" '#:modes "模式列表" '#:roots "根目录"))
  'get-compilation-dir  (cons "获取-compilation-dir" (hash '#:default-root "默认-根" '#:modes "模式列表" '#:roots "根目录"))
  'get-compilation-dir+name  (cons "获取-compilation-dir+name" (hash '#:default-root "默认-根" '#:modes "模式列表" '#:roots "根目录"))
))
