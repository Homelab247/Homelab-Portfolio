#!/usr/bin/env bash
set -euo pipefail

# Beispiel: Compose-Konfigurationen zentral exportieren.
# Dieses Script ist bewusst konservativ: Es kopiert nur compose.yml-Dateien
# und keine .env-Dateien oder Secrets.

EXPORT_DIR="${1:-./homelab-compose-export}"
mkdir -p "$EXPORT_DIR"

SOURCES=(
  "/opt/homelab-monitoring/grafana/compose.yml:grafana-compose.yml"
  "/opt/docker-services/it-tools/compose.yml:it-tools-compose.yml"
)

for item in "${SOURCES[@]}"; do
  IFS=':' read -r src name <<<"$item"
  if [ -f "$src" ]; then
    cp "$src" "$EXPORT_DIR/$name"
    echo "exportiert: $src -> $EXPORT_DIR/$name"
  else
    echo "übersprungen, nicht gefunden: $src"
  fi
done

echo "Export abgeschlossen: $EXPORT_DIR"
