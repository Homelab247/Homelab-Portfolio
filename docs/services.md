# Services

## Übersicht

| Dienst | System | Zweck | Status |
|---|---|---|---|
| Uptime Kuma | LXC 102 `monitoring` | Erreichbarkeitsmonitoring | aktiv |
| Grafana | LXC 102 `monitoring` | Dashboards | aktiv |
| Prometheus | LXC 102 `monitoring` | Metriksammlung | aktiv |
| Node Exporter | LXC 102 `monitoring` | Systemmetriken Monitoring-LXC | aktiv |
| Node Exporter | LXC 110 `docker-services` | Systemmetriken Docker-Services-LXC | aktiv |
| Docker Engine | LXC 110 `docker-services` | Containerplattform | aktiv |
| IT-Tools | LXC 110 `docker-services` | Admin-/Werkzeugdienst | aktiv |
| Home Assistant | VM 103 | Smart Home | aktiv |
| Hermes Agent | VM 104 | Automation / Assistenz | aktiv |

## Monitoring-Dienste

### Uptime Kuma

Uptime Kuma wird für Verfügbarkeitschecks genutzt. Typische Checks sind HTTP, Ping oder TCP-Port-Prüfungen.

### Prometheus

Prometheus sammelt Metriken im Monitoring-LXC. In der ersten Ausbaustufe werden Prometheus selbst sowie Node Exporter in LXC 102 und LXC 110 abgefragt.

### Grafana

Grafana dient als Dashboard-Oberfläche und nutzt Prometheus als Datenquelle. Ein einfaches Dashboard ist als JSON im Repository dokumentiert.

### Node Exporter

Node Exporter läuft als Docker-Container innerhalb der LXCs. Auf dem Proxmox-Host wurden keine zusätzlichen Pakete installiert.

## Docker Services

Der LXC `docker-services` ist bewusst getrennt vom Monitoring. Dort laufen allgemeine Tools und Werkzeugdienste, z. B. IT-Tools.

## Smart Home

Home Assistant läuft als eigene VM und bildet die Smart-Home-Schicht ab.

## Automation

Hermes Agent läuft getrennt und übernimmt Assistenz-, Dokumentations- und Automationsaufgaben.
