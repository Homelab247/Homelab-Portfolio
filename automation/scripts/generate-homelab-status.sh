#!/usr/bin/env bash
set -euo pipefail

# Erzeugt einen einfachen Markdown-Statusbericht.
# Auf einem Proxmox-Host können zusätzlich pct/qm Daten eingebunden werden.

OUT="${1:-homelab-status.md}"

{
  echo '# Homelab Statusbericht'
  echo
  echo "Erstellt am: $(date -Is)"
  echo
  echo '## Host'
  echo
  echo '```text'
  hostname || true
  uname -a || true
  echo '```'
  echo
  if command -v pct >/dev/null 2>&1; then
    echo '## LXC Container'
    echo
    echo '```text'
    pct list || true
    echo '```'
    echo
  fi
  if command -v docker >/dev/null 2>&1; then
    echo '## Docker Container'
    echo
    echo '```text'
    docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}' || true
    echo '```'
  fi
} > "$OUT"

echo "Statusbericht geschrieben: $OUT"
