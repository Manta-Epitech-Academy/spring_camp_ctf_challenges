#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

if [[ -z "${GPG_PASSPHRASE:-}" ]]; then
  read -s -p "GPG passphrase: " GPG_PASSPHRASE
  echo
fi

find "$REPO_ROOT" \( -path "$REPO_ROOT/.git" -o -path "$REPO_ROOT/.git/*" \) -prune -o -type f -name "writeup.md" -print0 |
  while IFS= read -r -d '' f; do
    gpg --batch --yes --symmetric --cipher-algo AES256 \
      --pinentry-mode loopback --passphrase "$GPG_PASSPHRASE" \
      -o "$f.gpg" "$f"
    rm -f "$f"
  done
