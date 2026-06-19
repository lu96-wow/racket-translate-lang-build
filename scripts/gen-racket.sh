#!/bin/bash
# gen-racket.sh — 生成 Racket 标准库翻译 maps
#
# 用法：
#   ./scripts/gen-racket.sh
#   ./scripts/gen-racket.sh custom-output/

set -e
cd "$(dirname "$0")/.."

MAPS_DIR="${1:-racket-maps}"
COLLECTS_DIR=$(racket -e '(require setup/dirs) (display (find-collects-dir))')

echo "Racket collects: $COLLECTS_DIR"

racket tools/collect/main.rkt \
  --input-dir "$COLLECTS_DIR" \
  --maps-dir "$MAPS_DIR" \
  --skip private \
  --skip compiled \
  --skip scribblings \
  --skip tests \
  --skip info \
  --skip raco.rkt \
  --skip racket/help.rkt \
  --skip racket/init.rkt \
  --skip raco/main.rkt \
  --skip setup/main.rkt \
  --skip setup/unixstyle-install.rkt \
  --skip setup/winstrip.rkt \
  --skip setup/winvers.rkt
