#!/bin/bash
# install-racket-cn.sh — 一键安装 racket-cn 语言包 + 语言服务器适配层
#
# 用法：
#   ./install-racket-cn.sh

set -e
cd "$(dirname "$0")"

# 1. 安装语言包（先卸载再安装最稳妥）
raco pkg remove racket-cn 2>/dev/null || true
raco pkg install --link dist/racket-cn

# 2. 安装语言服务器适配层（调用现成脚本）
bash dist/lang-server/install.sh
