#!/bin/bash
# build-racket-cn.sh — 构建 racket-cn 语言包
#
# 用法：
#   ./scripts/build-racket-cn.sh
#   ./scripts/build-racket-cn.sh custom-output/

set -e
cd "$(dirname "$0")/.."

OUTPUT_DIR="${1:-dist/racket-cn}"

racket tools/build/main.rkt \
  --lang racket-cn \
  --base-lang racket \
  --maps-dir racket-maps \
  --output-dir "$OUTPUT_DIR" \
  --preload racket/main \
  --lang-server-dir dist/lang-server \
  --lang-server-tables "../racket-cn/tables"
