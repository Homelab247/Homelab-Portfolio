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
| IT-Tools | LXC 110 `docker-services` | interner Werkzeugdienst | aktiv |
| Home Assistant | VM 103 | Smart Home | aktiv |
| Hermes Agent | VM 104 | Automation und Dokumentation | aktiv |

## Monitoring-Dienste

### Uptime Kuma

Uptime Kuma prüft, ob Dienste erreichbar sind. Typische Checks sind HTTP, Ping oder TCP-Port-Prüfungen.

### Prometheus

Prometheus sammelt Metriken im Monitoring-LXC. In der ersten Ausbaustufe werden Prometheus selbst sowie Node Exporter in LXC 102 und LXC 110 abgefragt.

### Grafana

Grafana nutzt Prometheus als Datenquelle und stellt die Werte als Dashboard dar. Ein einfaches Dashboard liegt als JSON im Repository.

### Node Exporter

Node Exporter läuft als Docker-Container innerhalb der jeweiligen LXC-Container. Auf dem Proxmox-Host wurden dafür keine zusätzlichen Pakete installiert.

## Docker Services

Der LXC `docker-services` ist vom Monitoring getrennt. Dort laufen allgemeine Tools wie IT-Tools und weitere interne Werkzeugdienste.

## Smart Home

Home Assistant läuft als eigene VM und bildet die Smart-Home-Schicht ab.

## Automation

Auf einer eigenen VM laufen Automatisierungs- und Dokumentationsaufgaben. Dazu nutze ich unter anderem Hermes Agent.
