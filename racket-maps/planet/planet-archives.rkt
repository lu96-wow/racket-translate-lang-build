;; planet/planet-archives
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (4/4 translated)
(define plain-map (hash
  'get-all-planet-packages  "获取-所有-行星-包"
  'get-hard-linked-packages  "获取-硬-链接-包"
  'get-installed-planet-archives  "获取-已安装-行星-归档"
  'get-planet-cache-path  "获取-行星-缓存-路径"
))

