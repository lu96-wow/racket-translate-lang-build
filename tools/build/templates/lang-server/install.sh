#!/bin/bash
# install.sh — 将 lang-server 适配层安装到 racket-langserver
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 自动获取 racket-langserver 包目录，或手动指定
if [ -n "$1" ]; then
  LANGSERVER="$1"
else
  LANGSERVER=$(racket -e '(require pkg/lib) (define d (pkg-directory "racket-langserver")) (when d (display (path->string d)))' 2>/dev/null)
fi

if [ -z "$LANGSERVER" ] || [ ! -d "$LANGSERVER/doclib" ]; then
  echo "Error: racket-langserver not found"
  echo "  auto-detect failed, specify manually:"
  echo "  $0 /path/to/racket-langserver"
  exit 1
fi

echo "=== Installing lang-server adapter (~LANG-NAME~) ==="
echo "Target: $LANGSERVER"

cp "$SCRIPT_DIR/translate.rkt"  "$LANGSERVER/doclib/translate.rkt"
echo "  -> doclib/translate.rkt"

cp "$SCRIPT_DIR/doc.rkt"        "$LANGSERVER/doclib/doc.rkt"
echo "  -> doclib/doc.rkt"

cp "$SCRIPT_DIR/doc-lang.rkt"   "$LANGSERVER/doclib/doc-lang.rkt"
echo "  -> doclib/doc-lang.rkt"

cp "$SCRIPT_DIR/interfaces.rkt" "$LANGSERVER/common/interfaces.rkt"
echo "  -> common/interfaces.rkt"

echo ""
echo "Recompiling racket-langserver..."
raco setup --no-docs racket-langserver

echo ""
echo "Done! Restart your editor."
