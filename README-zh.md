# racket-lang-build

Racket 语言本地化构建工具。通用翻译框架，可翻译任意 Racket 库。

## 快速开始

```bash
# 1. 生成翻译模板（扫描模块 + 文档枚举值）
./scripts/gen-racket.sh

# 2. 翻译 racket-maps/*.rkt（将 #f 替换为中文）

# 3. 校验
racket tools/check/main.rkt --maps-dir racket-maps

# 4. 构建语言包 + 语言服务器适配
./scripts/build-racket-cn.sh

# 5. 安装
raco pkg install --link dist/racket-cn
bash dist/lang-server/install.sh ~/racket-langserver

# 6. 使用
echo '#lang racket-cn
(定义 (阶乘 n)
  (如果 (< n 2) 1 (* n (阶乘 (- n 1)))))
(显示-行 (阶乘 10))' > test.rkt
racket test.rkt  # → 3628800
```

## 项目结构

```
tools/                              ← 纯工具，零硬编码
├── collect/                          模块扫描 → 翻译模板
│   ├── main.rkt                        CLI + 递归遍历 + --skip
│   ├── scan.rkt                        module->exports 来源追踪 + 去重
│   └── writer.rkt                      map 文件生成
├── collect-kw-vals/                  从 Scribble 文档提取关键字枚举值
│   └── main.rkt                        blueboxes 查询 + 追加到 map
├── check/                            翻译校验
│   └── main.rkt                        缺失 / CN冲突 / EN冲突
└── build/                            构建语言包
    ├── main.rkt                        maps → tables + 模板填充
    └── templates/
        ├── reader.rkt                  #lang reader 模板
        ├── search-map.rkt              翻译查询 API
        ├── file-map.rkt                文件转换（保留格式）
        └── lang-server/                语言服务器适配层
            ├── translate.rkt             翻译表加载（无后缀匹配）
            ├── doc.rkt                   双语补全 + 前缀匹配 insertText
            ├── doc-lang.rkt              #lang 检测（~LANG-NAME~ 精确匹配）
            ├── interfaces.rkt            CompletionItem 扩展
            └── install.sh               一键安装到 racket-langserver

scripts/                            ← Racket 特定配置
├── gen-racket.sh                     collect + kw-vals
├── build-racket-cn.sh                build 语言包 + lang-server
├── build-racket-gui.sh               扫描 gui-lib 包
└── migrate-translations.rkt          从旧 maps 迁移翻译
```

## 架构

### 数据流

```
Racket 模块                          Scribble 文档
     │                                    │
     ▼                                    ▼
  collect                           collect-kw-vals
 (module->exports                  (fetch-blueboxes-strs
  来源追踪去重)                      解析枚举值)
     │                                    │
     ▼                                    ▼
  maps/*.rkt ──── 手工翻译 ──── maps/*.rkt (含 kw-value-map)
                                          │
                                    ▼           ▼
                                 check        build
                               (校验)    (maps → .rktd tables
                                          + reader + utilities)
                                               │
                                               ▼
                                         dist/racket-cn/
                                         ├── main.rkt
                                         ├── search-map.rkt
                                         ├── file-map.rkt
                                         └── tables/*.rktd
```

### Map 文件格式

```racket
;; racket/list
#lang racket/base
(provide plain-map kw-map kw-value-map re-exports)

;; re-exports (0)
(define re-exports '())

;; plain (64)
(define plain-map (hash
  'first   "第一"
  'rest    "剩余"
  'append  #f       ;; ← #f = 未翻译
  ...))

;; with-kw (3)
(define kw-map (hash
  'add-between (cons "添加-之间" (hash '#:splice? "拼接?"))
  ...))

;; kw-value-map (从文档提取的枚举值)
(define kw-value-map (hash
  '#:exists (hash 'append #f 'truncate #f 'error #f ...)
  '#:mode   (hash 'binary #f 'text #f)
))
```

### 去重机制

每个 map 只包含**本模块定义**的符号。来自其他模块的通过 `re-exports` 转发：

```
racket/main.rkt  → 0 own + re-exports: 31 个子模块（无重复翻译）
racket/base.rkt  → 1641 own（所有符号都在这里翻译）
racket/list.rkt  → 67 own（list 自己的符号）
```

## 工具参考

### collect — 扫描模块

```bash
# 扫描整个目录
racket tools/collect/main.rkt \
  --input-dir /usr/racket/collects \
  --maps-dir racket-maps \
  --skip private --skip compiled \
  --skip racket/help.rkt

# 扫描指定 collection
racket tools/collect/main.rkt \
  --input-dir /usr/racket/collects \
  -c racket -c json \
  --maps-dir racket-maps

# 扫描指定模块
racket tools/collect/main.rkt racket/base racket/list \
  --maps-dir racket-maps
```

`--skip` 规则：不含 `/` 匹配 basename，含 `/` 匹配相对路径。

### collect-kw-vals — 从文档补充枚举值

```bash
racket tools/collect-kw-vals/main.rkt --maps-dir racket-maps
```

在已有 map 文件末尾追加 `kw-value-map`，幂等（重复运行不会重复追加）。

### check — 校验翻译

```bash
racket tools/check/main.rkt --maps-dir racket-maps --report-dir racket-maps
```

生成三个报告：
- `missing.rktd` — 编辑时丢失的符号
- `conflict-cn.rktd` — 不同 EN → 同一 CN（读取器歧义）
- `conflict-en.rktd` — 同一 EN → 不同 CN（不一致）

### build — 构建语言包

```bash
racket tools/build/main.rkt \
  --lang racket-cn \
  --base-lang racket \
  --maps-dir racket-maps \
  --output-dir dist/racket-cn \
  --preload racket/main \
  [--tables-dir path] \
  [--lang-server-dir dist/lang-server] \
  [--lang-server-tables "../racket-cn/tables"]
```

| 参数 | 说明 |
|------|------|
| `--lang` | 语言包名，决定 `#lang` 标识 |
| `--base-lang` | 底层语言，file-map 的 #lang 转换目标 |
| `--maps-dir` | 翻译源目录 |
| `--output-dir` | 输出包目录 |
| `--preload` | reader 启动时预加载的表 |
| `--tables-dir` | 表存放路径（默认 output-dir/tables） |
| `--lang-server-dir` | lang-server 输出目录（可选） |
| `--lang-server-tables` | lang-server 的 tables 路径（可选） |

### 模板变量

| 占位符 | 来源 | 说明 |
|--------|------|------|
| `~LANG-NAME~` | `--lang` | 语言包名 |
| `~BASE-LANG~` | `--base-lang` | 底层语言 |
| `~PRELOAD~` | `--preload` | 预加载表路径 |
| `~TABLES-PATH~` | `--tables-dir` 或默认 `"tables"` | 表查找路径 |

## 生成的语言包

```
dist/
├── racket-cn/                     ← raco pkg install --link
│   ├── main.rkt                     #lang racket-cn reader
│   ├── search-map.rkt               (map-> '定义) → 'define
│   ├── file-map.rkt                 (map-file-> "cn.rkt" "en.rkt")
│   ├── info.rkt
│   └── tables/                      .rktd 翻译表
└── lang-server/                   ← install.sh 安装到 racket-langserver
    ├── translate.rkt                翻译加载（作用域、无后缀）
    ├── doc.rkt                      双语补全 + smart insertText
    ├── doc-lang.rkt                 #lang 精确匹配
    ├── interfaces.rkt               insertText + DocumentSymbol
    └── install.sh                   一键安装
```

### 语言服务器补全

```
补全弹窗:   定义 (define)
输入 "def"  → 选中插入 define     ← EN名前缀匹配 → 插英文
输入 "定"   → 选中插入 定义       ← 不匹配EN → 插翻译名
```

insertText 选择（语言无关，不依赖字符编码）：
```racket
(if (string-prefix? en left-fragment) en cn)
```

安装：`bash dist/lang-server/install.sh ~/racket-langserver`

## 扩展其他语言

```bash
# 日文
cp scripts/gen-racket.sh scripts/gen-racket-jp.sh
# 修改 MAPS_DIR 为 racket-maps-jp

cat > scripts/build-racket-jp.sh << 'EOF'
racket tools/build/main.rkt \
  --lang racket-jp --base-lang racket \
  --maps-dir racket-maps-jp \
  --output-dir dist/racket-jp \
  --preload racket/main
EOF
```

工具不变，只需新脚本 + 新翻译。

## 扩展其他库

```bash
# 收集 pict 库
racket tools/collect/main.rkt \
  --input-dir /usr/racket/collects -c pict \
  --maps-dir racket-maps

# 翻译 racket-maps/pict/*.rkt

# 重新构建（所有库的表一起生成）
./scripts/build-racket-cn.sh
raco pkg install --link dist/racket-cn
```

`(require pict)` 时 reader 自动查 `tables/pict/main.rktd`。
