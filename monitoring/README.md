# Monitoring

LXC 102 ist der dedizierte Ort für Monitoring-Dienste.

## Aktive Komponenten

| Dienst | Rolle | Port | Betriebsort |
|---|---|---:|---|
| Uptime Kuma | Availability Checks | 3001 | LXC 102 `monitoring` |
| Grafana | Dashboards | 3000 | LXC 102 `monitoring` |
| Prometheus | Metriksammlung | 9090 | LXC 102 `monitoring` |
| Node Exporter | Systemmetriken | 9100 | LXC 102 und LXC 110 |
| IT-Tools | Demo-/Admin-Webtool | 8081 | LXC 110 `docker-services` |

## Live-Pfade

Die produktiven Compose-Dateien liegen bewusst auf den jeweiligen LXCs und nicht mit privaten Details im öffentlichen Repository.

- Prometheus: `/opt/homelab-monitoring/prometheus/`
- Node Exporter Monitoring-LXC: `/opt/homelab-monitoring/node-exporter/`
- Grafana: `/opt/homelab-monitoring/grafana/`
- Node Exporter Docker-Services-LXC: `/opt/docker-services/node-exporter/`

## Repository-Inhalt

- `compose.example.yml`: bereinigtes Beispiel ohne private IP-Adressen oder Secrets
- `prometheus/prometheus.example.yml`: Beispiel-Scrape-Konfiguration
- `grafana-dashboards/homelab-overview.json`: einfaches Start-Dashboard für Prometheus/Node Exporter

## Hinweise

- Uptime Kuma bleibt separat und wird nicht durch Prometheus ersetzt.
- Prometheus sammelt Metriken; Grafana visualisiert sie.
- Node Exporter läuft innerhalb der LXC-Container als Docker-Container.
- Auf dem Proxmox-Host wurden keine Monitoring-Pakete installiert.
