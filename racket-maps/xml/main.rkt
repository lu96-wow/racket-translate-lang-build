;; xml/main
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (0/121 translated)
(define plain-map (hash
  'attribute  #f
  'attribute-name  #f
  'attribute-value  #f
  'attribute?  #f
  'cdata  #f
  'cdata-string  #f
  'cdata?  #f
  'collapse-whitespace  #f
  'comment  #f
  'comment-text  #f
  'comment?  #f
  'content/c  #f
  'correct-xexpr?  #f
  'current-unescaped-tags  #f
  'document  #f
  'document-element  #f
  'document-misc  #f
  'document-prolog  #f
  'document-type  #f
  'document-type-external  #f
  'document-type-inlined  #f
  'document-type-name  #f
  'document-type?  #f
  'document?  #f
  'element  #f
  'element-attributes  #f
  'element-content  #f
  'element-name  #f
  'element?  #f
  'eliminate-whitespace  #f
  'empty-tag-shorthand  #f
  'entity  #f
  'entity-text  #f
  'entity?  #f
  'exn:invalid-xexpr-code  #f
  'exn:invalid-xexpr?  #f
  'exn:xml?  #f
  'external-dtd  #f
  'external-dtd-system  #f
  'external-dtd/public  #f
  'external-dtd/public-public  #f
  'external-dtd/public?  #f
  'external-dtd/system  #f
  'external-dtd/system?  #f
  'external-dtd?  #f
  'html-empty-tags  #f
  'html-unescaped-tags  #f
  'location  #f
  'location-char  #f
  'location-line  #f
  'location-offset  #f
  'location/c  #f
  'location?  #f
  'make-attribute  #f
  'make-cdata  #f
  'make-comment  #f
  'make-document  #f
  'make-document-type  #f
  'make-element  #f
  'make-entity  #f
  'make-external-dtd  #f
  'make-external-dtd/public  #f
  'make-external-dtd/system  #f
  'make-location  #f
  'make-p-i  #f
  'make-pcdata  #f
  'make-prolog  #f
  'make-source  #f
  'misc/c  #f
  'no-external-dtd  #f
  'p-i  #f
  'p-i-instruction  #f
  'p-i-target-name  #f
  'p-i?  #f
  'pcdata  #f
  'pcdata-string  #f
  'pcdata?  #f
  'permissive-xexprs  #f
  'permissive/c  #f
  'prolog  #f
  'prolog-dtd  #f
  'prolog-misc  #f
  'prolog-misc2  #f
  'prolog?  #f
  'read-comments  #f
  'read-xml  #f
  'read-xml/document  #f
  'read-xml/element  #f
  'source  #f
  'source-start  #f
  'source-stop  #f
  'source?  #f
  'string->xexpr  #f
  'struct:attribute  #f
  'struct:cdata  #f
  'struct:comment  #f
  'struct:document  #f
  'struct:document-type  #f
  'struct:element  #f
  'struct:entity  #f
  'struct:external-dtd  #f
  'struct:external-dtd/public  #f
  'struct:external-dtd/system  #f
  'struct:location  #f
  'struct:p-i  #f
  'struct:pcdata  #f
  'struct:prolog  #f
  'struct:source  #f
  'valid-char?  #f
  'validate-xexpr  #f
  'write-string/escape  #f
  'write-xml  #f
  'write-xml/content  #f
  'xexpr->string  #f
  'xexpr->xml  #f
  'xexpr-drop-empty-attributes  #f
  'xexpr/c  #f
  'xexpr?  #f
  'xml->xexpr  #f
  'xml-attribute-encode  #f
  'xml-count-bytes  #f
))

;; with-kw (5)
(define kw-map (hash
  'display-xml  (cons "显示-xml" (hash '#:indentation "缩进"))
  'display-xml/content  (cons "显示-xml/content" (hash '#:indentation "缩进"))
  'syntax:read-xml  (cons "语法:读取-xml" (hash '#:src "源"))
  'syntax:read-xml/element  (cons "语法:读取-xml/元素" (hash '#:src "源"))
  'write-xexpr  (cons "写入-xexpr" (hash '#:insert-newlines? "插入-换行?"))
))
