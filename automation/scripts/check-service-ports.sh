#!/usr/bin/env bash
set -euo pipefail

# Einfacher Portcheck für interne Homelab-Dienste.
# Für ein öffentliches Repository werden hier anonymisierte interne Zieladressen genutzt.
# In der echten Umgebung können diese Werte lokal angepasst werden.

SERVICES=(
  "Grafana:192.168.x.x:3000"
  "UptimeKuma:192.168.x.x:3001"
  "ITTools:192.168.x.x:8081"
  "Proxmox:192.168.x.x:8006"
)

printf '# Homelab Portcheck\n\n'
printf '| Dienst | Ziel | Status |\n'
printf '|---|---|---|\n'

for entry in "${SERVICES[@]}"; do
  IFS=':' read -r name host port <<<"$entry"
  if timeout 3 bash -c "</dev/tcp/$host/$port" 2>/dev/null; then
    status='OK'
  else
    status='NICHT ERREICHBAR'
  fi
  printf '| %s | `%s:%s` | %s |\n' "$name" "$host" "$port" "$status"
done
