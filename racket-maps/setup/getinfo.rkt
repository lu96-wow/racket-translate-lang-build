;; setup/getinfo
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/12 translated)
(define plain-map (hash
  'directory-record  #f
  'directory-record-maj  #f
  'directory-record-min  #f
  'directory-record-path  #f
  'directory-record-spec  #f
  'directory-record-syms  #f
  'directory-record?  #f
  'find-relevant-directories  #f
  'find-relevant-directory-records  #f
  'make-directory-record  #f
  'reset-relevant-directories-state!  #f
  'struct:directory-record  #f
))

;; with-kw (2)
(define kw-map (hash
  'get-info  (cons "获取-信息" (hash '#:bootstrap? "引导?" '#:namespace "命名空间"))
  'get-info/full  (cons "获取-info/full" (hash '#:bootstrap? "引导?" '#:namespace "命名空间"))
))
