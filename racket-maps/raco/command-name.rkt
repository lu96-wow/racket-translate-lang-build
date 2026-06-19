;; raco/command-name
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (3/3 translated)
(define plain-map (hash
  'current-command-name  "当前-命令-名称"
  'program+command-name  "程序+命令-名称"
  'short-program+command-name  "短-程序+命令-名称"
))

