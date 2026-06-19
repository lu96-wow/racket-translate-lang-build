;; net/uri-codec
#lang racket/base
(provide plain-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (15/15 translated)
(define plain-map (hash
  'alist->form-urlencoded  "关联列表->表单-URL编码"
  'current-alist-separator-mode  "当前-关联列表-分隔符-模式"
  'form-urlencoded->alist  "表单-URL编码->关联列表"
  'form-urlencoded-decode  "表单-URL编码-解码"
  'form-urlencoded-encode  "表单-URL编码-编码"
  'uri-decode  "URI-解码"
  'uri-encode  "URI-编码"
  'uri-path-segment-decode  "URI-路径-段-解码"
  'uri-path-segment-encode  "URI-路径-段-编码"
  'uri-path-segment-unreserved-decode  "URI-路径-段-未保留-解码"
  'uri-path-segment-unreserved-encode  "URI-路径-段-未保留-编码"
  'uri-unreserved-decode  "URI-未保留-解码"
  'uri-unreserved-encode  "URI-未保留-编码"
  'uri-userinfo-decode  "URI-用户信息-解码"
  'uri-userinfo-encode  "URI-用户信息-编码"
))

