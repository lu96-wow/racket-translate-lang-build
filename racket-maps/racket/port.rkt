;; racket/port
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (38/38 translated)
(define plain-map (hash
  'call-with-input-bytes  "调用-带-输入-字节"
  'call-with-input-string  "调用-带-输入-字符串"
  'call-with-output-bytes  "调用-带-输出-字节"
  'call-with-output-string  "调用-带-输出-字符串"
  'combine-output  "合并-输出"
  'convert-stream  "转换-流"
  'copy-port  "复制-端口"
  'dup-input-port  "复制-输入-端口"
  'dup-output-port  "复制-输出-端口"
  'eof-evt  "文件尾-事件"
  'filter-read-input-port  "过滤-读-输入-端口"
  'make-input-port/read-to-peek  "创建-输入-端口/读-到-窥视"
  'make-limited-input-port  "创建-受限-输入-端口"
  'make-pipe-with-specials  "创建-管道-带-特殊"
  'merge-input  "合并-输入"
  'open-input-nowhere  "打开-输入-虚无"
  'open-output-nowhere  "打开-输出-虚无"
  'peek-bytes!-evt  "窥视-字节!-事件"
  'peek-bytes-avail!-evt  "窥视-字节-可用!-事件"
  'peek-bytes-evt  "窥视-字节-事件"
  'peek-string!-evt  "窥视-字符串!-事件"
  'peek-string-evt  "窥视-字符串-事件"
  'port->list  "端口->列表"
  'read-bytes!-evt  "读-字节!-事件"
  'read-bytes-avail!-evt  "读-字节-可用!-事件"
  'read-bytes-evt  "读-字节-事件"
  'read-bytes-line-evt  "读-字节-行-事件"
  'read-line-evt  "读-行-事件"
  'read-string!-evt  "读-字符串!-事件"
  'read-string-evt  "读-字符串-事件"
  'reencode-input-port  "重新编码-输入-端口"
  'reencode-output-port  "重新编码-输出-端口"
  'regexp-match-evt  "正则-匹配-事件"
  'special-filter-input-port  "特殊-过滤-输入-端口"
  'with-input-from-bytes  "用-输入-从-字节"
  'with-input-from-string  "用-输入-从-字符串"
  'with-output-to-bytes  "用-输出-到-字节"
  'with-output-to-string  "用-输出-到-字符串"
))

;; with-kw (11)
(define kw-map (hash
  'display-lines  (cons "显示-多行" (hash '#:separator "分隔符"))
  'input-port-append  (cons "输入-端口-追加" (hash '#:name "名称"))
  'peeking-input-port  (cons "窥视中-输入-端口" (hash '#:init-position "初始-位置"))
  'port->bytes  (cons "端口->字节" (hash '#:close? "关闭?"))
  'port->bytes-lines  (cons "端口->字节-行" (hash '#:close? "关闭?" '#:line-mode "行-模式"))
  'port->lines  (cons "端口->行" (hash '#:close? "关闭?" '#:line-mode "行-模式"))
  'port->string  (cons "端口->字符串" (hash '#:close? "关闭?"))
  'relocate-input-port  (cons "重定位-输入-端口" (hash '#:name "名称"))
  'relocate-output-port  (cons "重定位-输出-端口" (hash '#:name "名称"))
  'transplant-input-port  (cons "移植-输入-端口" (hash '#:name "名称"))
  'transplant-output-port  (cons "移植-输出-端口" (hash '#:name "名称"))
))

;; kw-value-map (1 keywords)
(define kw-value-map (hash
  '#:line-mode #hash((any . "任意") (any-one . "任意一个") (linefeed . "换行符") (return . "回车") (return-linefeed . "回车-换行"))
))
