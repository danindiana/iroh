#!/usr/bin/env bash
set -euo pipefail

# Check that every docs/*.md (except README.md) is referenced in docs/README.md
ROOT_DIR=$(git rev-parse --show-toplevel)
DOCS_DIR="$ROOT_DIR/docs"
INDEX_FILE="$DOCS_DIR/README.md"

if [[ ! -f "$INDEX_FILE" ]]; then
  echo "Missing docs/README.md index file" >&2
  exit 1
fi

missing=()
shopt -s nullglob
for f in "$DOCS_DIR"/*.md; do
  base=$(basename "$f")
  [[ "$base" == "README.md" ]] && continue
  if ! grep -Fq "$base" "$INDEX_FILE"; then
    missing+=("$base")
  fi
done

if (( ${#missing[@]} > 0 )); then
  echo "Docs index is missing references to:" >&2
  for m in "${missing[@]}"; do
    echo " - $m" >&2
  done
  exit 1
fi

echo "Docs index check passed."