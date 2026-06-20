#!/bin/bash
# build-racket-gui.sh — 扫描 racket/gui 库并加入 racket-maps
#
# gui-lib 是单独的 pkg，不在 collects 里，需要额外扫描。
# 扫描后重新 build 即可使用。
#
# 用法：
#   ./scripts/build-racket-gui.sh

set -e
cd "$(dirname "$0")/.."

MAPS_DIR="${1:-racket-maps}"
GUI_LIB_DIR=$(racket -e '(require setup/dirs) (display (build-path (car (get-pkgs-search-dirs)) "gui-lib"))')

if [ ! -d "$GUI_LIB_DIR" ]; then
  echo "gui-lib not found at: $GUI_LIB_DIR"
  echo "Trying alternative path..."
  GUI_LIB_DIR=$(find /usr/racket -type d -name gui-lib -path '*/pkgs/*' 2>/dev/null | head -1)
fi

if [ ! -d "$GUI_LIB_DIR" ]; then
  echo "Error: gui-lib package not found"
  exit 1
fi

echo "gui-lib: $GUI_LIB_DIR"

racket tools/collect/main.rkt \
  --input-dir "$GUI_LIB_DIR" \
  --maps-dir "$MAPS_DIR" \
  --skip private \
  --skip compiled \
  --skip scribblings \
  --skip tests \
  --skip info

echo ""
echo "Done. Re-run ./scripts/build-racket-cn.sh to rebuild with GUI translations."
