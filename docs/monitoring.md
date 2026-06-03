# Monitoring

## Ziel

Das Monitoring hat zwei Aufgaben:

- Uptime Kuma prüft, ob ein Dienst erreichbar ist.
- Prometheus, Node Exporter und Grafana zeigen, wie sich Systeme über Zeit verhalten.

## Aktueller Stand

| Komponente | Zweck | Status |
|---|---|---|
| Uptime Kuma | Verfügbarkeitschecks | aktiv in LXC 102 `monitoring` |
| Grafana | Dashboards und Visualisierung | aktiv in LXC 102 `monitoring` |
| Prometheus | Metriksammlung | aktiv in LXC 102 `monitoring` |
| Node Exporter | Linux- und Container-Metriken | aktiv in LXC 102 und LXC 110 |
| Docker/cAdvisor | Container-Metriken | als späterer Ausbau vorgesehen |

## Rollen

### Uptime Kuma

Uptime Kuma beantwortet eine einfache Frage:

> Ist der Dienst erreichbar?

Typische Checks:

- Proxmox-Webinterface
- Grafana
- Prometheus
- IT-Tools
- weitere interne Dienste

### Prometheus

Prometheus sammelt Metriken und stellt sie Grafana als Datenquelle bereit.

In Phase 1 werden diese Ziele abgefragt:

- Prometheus selbst
- Node Exporter im Monitoring-LXC
- Node Exporter im Docker-Services-LXC

Die private IP-Adressierung steht nicht im öffentlichen Repository.

### Node Exporter

Node Exporter läuft als Docker-Container innerhalb der jeweiligen LXC-Container. Dadurch werden keine zusätzlichen Pakete direkt auf dem Proxmox-Host installiert.

### Grafana

Grafana nutzt Prometheus als Datenquelle. Zusätzlich liegt ein einfaches Dashboard als JSON im Repository, damit der Aufbau auch ohne Zugriff auf mein Heimnetz verständlich bleibt.

## Betriebsstand nach Phase 1

| Dienst | Port intern/LAN | Ergebnis |
|---|---:|---|
| Grafana | 3000 | HTTP erreichbar |
| Uptime Kuma | 3001 | HTTP erreichbar |
| Prometheus | 9090 | HTTP erreichbar |
| Node Exporter LXC 102 | 9100 | Metrics erreichbar |
| Node Exporter LXC 110 | 9100 | Metrics erreichbar |
| IT-Tools | 8081 | HTTP erreichbar |

## Rollback

Prometheus und Node Exporter sind getrennt von Uptime Kuma und Grafana angelegt.

Rollback in LXC 102:

```bash
cd /opt/homelab-monitoring/prometheus
docker compose down

cd /opt/homelab-monitoring/node-exporter
docker compose down
```

Rollback in LXC 110:

```bash
cd /opt/docker-services/node-exporter
docker compose down
```

Grafana-Provisioning kann über die gesicherten Compose-Backups im Pfad `/opt/homelab-monitoring/grafana/` zurückgenommen werden.

## Nächste Schritte

- Uptime-Kuma-Checks für Prometheus und Exporter ergänzen
- cAdvisor für Container-Metriken prüfen
- Proxmox-Metriken über einen sicheren Exporter oder API-Weg anbinden
- anonymisierte Screenshots für das Portfolio erstellen
