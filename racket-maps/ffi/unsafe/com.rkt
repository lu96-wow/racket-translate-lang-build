;; ffi/unsafe/com
#lang racket/base
(provide plain-map kw-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (49/73 translated)
(define plain-map (hash
  'AddRef  #f
  'HRESULT-retry?  #f
  'IID_IUnknown  #f
  'IID_NULL  #f
  'LOCALE_SYSTEM_DEFAULT  #f
  'QueryInterface  #f
  'Release  #f
  'SysAllocStringLen  #f
  'SysFreeString  #f
  '_GUID  #f
  '_GUID-pointer  #f
  '_HRESULT  #f
  '_IUnknown  #f
  '_IUnknown-pointer  #f
  '_IUnknown_vt  #f
  '_LCID  #f
  '_hfun  #f
  '_hmfun  #f
  '_mfun  #f
  '_wfun  #f
  'clsid->progid  "CLSID->ProgID"
  'clsid?  "CLSID?"
  'com-create-instance  "COM-创建-实例"
  'com-enumerate-to-list  "COM-枚举-到-列表"
  'com-enumeration-to-list  "COM-枚举对象-到-列表"
  'com-event-executor?  "COM-事件-执行器?"
  'com-event-type  "COM-事件-类型"
  'com-events  "COM-事件"
  'com-get-active-object  "COM-获取-活动-对象"
  'com-get-properties  "COM-获取-属性集"
  'com-get-property  "COM-获取-属性"
  'com-get-property*  "COM-获取-属性*"
  'com-get-property-type  "COM-获取-属性-类型"
  'com-idispatch?  "COM-IDispatch?"
  'com-invoke  "COM-调用"
  'com-iunknown?  "COM-IUnknown?"
  'com-make-event-executor  "COM-创建-事件-执行器"
  'com-method-type  "COM-方法-类型"
  'com-methods  "COM-方法"
  'com-object-clsid  "COM-对象-CLSID"
  'com-object-eq?  "COM-对象-相等?"
  'com-object-get-idispatch  "COM-对象-获取-IDispatch"
  'com-object-get-iunknown  "COM-对象-获取-IUnknown"
  'com-object-set-clsid!  "COM-对象-设置-CLSID!"
  'com-object-type  "COM-对象-类型"
  'com-object?  "COM-对象?"
  'com-omit  "COM-省略"
  'com-omit?  "COM-省略?"
  'com-register-event-callback  "COM-注册-事件-回调"
  'com-release  "COM-释放"
  'com-set-properties  "COM-设置-属性"
  'com-set-property!  "COM-设置-属性!"
  'com-set-property-type  "COM-设置-属性-类型"
  'com-type=?  "COM-类型-相等?"
  'com-type?  "COM-类型?"
  'com-unregister-event-callback  "COM-取消注册-事件-回调"
  'current-hfun-retry-count  #f
  'current-hfun-retry-delay  #f
  'define-com-interface  #f
  'guid->string  "GUID->字符串"
  'guid=?  "GUID-相等?"
  'guid?  "GUID?"
  'iid?  "IID?"
  'progid->clsid  "ProgID->CLSID"
  'string->clsid  "字符串->CLSID"
  'string->guid  "字符串->GUID"
  'string->iid  "字符串->IID"
  'type-describe  "类型-描述"
  'type-described-description  "类型-已描述-描述"
  'type-described-value  "类型-已描述-值"
  'type-described?  "类型-已描述?"
  'type-description?  "类型-描述?"
  'windows-error  #f
))

;; with-kw (1)
(define kw-map (hash
  'make-com-object  (cons "创建-com-object" (hash '#:manage? "管理?"))
))
