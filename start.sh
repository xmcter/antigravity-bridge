#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
set -a
# shellcheck disable=SC1091
source ./.env
set +a
# Google APIs need Clash on this machine; keep proxy on.
export http_proxy="${http_proxy:-http://127.0.0.1:7897}"
export https_proxy="${https_proxy:-http://127.0.0.1:7897}"
export HTTP_PROXY="$http_proxy"
export HTTPS_PROXY="$https_proxy"
export NO_PROXY="127.0.0.1,localhost"
export no_proxy="$NO_PROXY"
exec ./.venv/bin/python3 ./server.py --host "${HOST:-127.0.0.1}" --port "${PORT:-52847}"
