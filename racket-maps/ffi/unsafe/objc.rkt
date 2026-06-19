;; ffi/unsafe/objc
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (41/53 translated)
(define plain-map (hash
  'NO  "NO"
  'YES  "YES"
  '_BOOL  "_BOOL"
  '_Class  "_Class"
  '_Ivar  "_Ivar"
  '_NSConcreteGlobalBlock  "_NSConcreteGlobalBlock"
  '_Protocol  "_Protocol"
  '_SEL  "_SEL"
  '_id  "_id"
  '_objc_super  "_objc_super"
  'class_addIvar  "class_addIvar"
  'class_addMethod/raw  "class_addMethod/raw"
  'class_addMethods  "class_addMethods"
  'class_addProtocol  "class_addProtocol"
  'class_getInstanceMethod  "class_getInstanceMethod"
  'class_getSuperclass  "class_getSuperclass"
  'define-objc-class  #f
  'define-objc-mixin  #f
  'get-ivar  #f
  'import-class  #f
  'import-protocol  #f
  'make-objc_super  "创建-objc_super"
  'method_setImplementation  "method_setImplementation"
  'objc-block-function-pointer  "objc-块-函数-指针"
  'objc-class-has-instance-method?  "objc-类-有-实例-方法?"
  'objc-dispose-class  "objc-释放-类"
  'objc-get-class  "objc-获取-类"
  'objc-get-superclass  "objc-获取-父类"
  'objc-is-a?  #f
  'objc-set-class!  "objc-设置-类!"
  'objc-subclass?  "objc-子类?"
  'objc_addClass  "objc_addClass"
  'objc_allocateClassPair  "objc_allocateClassPair"
  'objc_disposeClassPair  "objc_disposeClassPair"
  'objc_getProtocol  "objc_getProtocol"
  'objc_lookUpClass  "objc_lookUpClass"
  'objc_msgSend/typed  #f
  'objc_msgSend/typed/blocking  "objc_msgSend/typed/blocking"
  'objc_msgSendSuper/typed  #f
  'objc_msgSendSuper/typed/blocking  "objc_msgSendSuper/typed/blocking"
  'objc_registerClassPair  "objc_registerClassPair"
  'object_getClass  "object_getClass"
  'object_getInstanceVariable  "object_getInstanceVariable"
  'object_setClass  "object_setClass"
  'object_setInstanceVariable  "object_setInstanceVariable"
  'sel_registerName  "sel_registerName"
  'selector  #f
  'self  "self"
  'set-ivar!  #f
  'super-tell  "父类-发送"
  'tell  #f
  'tellv  #f
  'with-blocking-tell  "带-阻塞-发送"
))

;; with-kw (1)
(define kw-map (hash
  'objc-block  (cons "objc-块" (hash '#:keep "保持"))
))
