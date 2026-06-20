;; syntax/srcloc
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/17 translated)
(define plain-map (hash
  'build-source-location  #f
  'build-source-location-list  #f
  'build-source-location-syntax  #f
  'build-source-location-vector  #f
  'check-source-location!  #f
  'source-location->prefix  #f
  'source-location->string  #f
  'source-location-column  #f
  'source-location-end  #f
  'source-location-known?  #f
  'source-location-line  #f
  'source-location-list?  #f
  'source-location-position  #f
  'source-location-source  #f
  'source-location-span  #f
  'source-location-vector?  #f
  'source-location?  #f
))

;; with-kw (1)
(define kw-map (hash
  'update-source-location  (cons "更新-来源-location" (hash '#:column "列" '#:line "行" '#:position "位置" '#:source "来源" '#:span "跨度"))
))
