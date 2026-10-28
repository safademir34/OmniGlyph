#!/bin/bash
# Cloud sessions only: install deps and build dist/ so typecheck, lint,
# tests and the dev server work as soon as the session opens.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}"

# Not --frozen-lockfile: a plain install reuses the cached container state.
pnpm install --prefer-offline
pnpm run build
