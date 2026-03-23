#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

if [[ -z "${GPG_PASSPHRASE:-}" ]]; then
  read -s -p "GPG passphrase: " GPG_PASSPHRASE
  echo
fi

find "$REPO_ROOT" \( -path "$REPO_ROOT/.git" -o -path "$REPO_ROOT/.git/*" \) -prune -o -type f -name "writeup.md.gpg" -print0 |
  while IFS= read -r -d '' f; do
    out="${f%.gpg}"
    gpg --batch --yes --decrypt \
      --pinentry-mode loopback --passphrase "$GPG_PASSPHRASE" \
      -o "$out" "$f"
  done
