# Proxmox Zielzustand

## Übersicht

| ID | Name | Typ | Rolle |
|---|---|---|---|
| 101 | Storage / Daten | LXC | Datenablage, SMB/CIFS und interne Exporte |
| 102 | monitoring | LXC | Uptime Kuma, Grafana, Prometheus, Node Exporter |
| 110 | docker-services | LXC | Docker Engine, Compose, Werkzeugdienste, Node Exporter |
| 103 | homeassistant | VM | Smart Home |
| 104 | Hermes | VM | Automation, Agent, Telegram Gateway |
| weitere | Lab-Umgebungen | VM | isolierte Lern- und Lab-Systeme |

## Designentscheidung

Docker läuft nicht direkt auf dem Proxmox-Host. Stattdessen gibt es einen eigenen LXC für allgemeine Docker-Services. Monitoring bleibt davon getrennt.

## Aktueller Betriebsstand

- Monitoring-LXC: Uptime Kuma, Grafana, Prometheus und Node Exporter aktiv
- Docker-Services-LXC: Docker Engine, Compose, IT-Tools und Node Exporter aktiv
- Storage-LXC: separate Daten- und Exportrolle
- Automation-VM: Hermes Agent getrennt betrieben

## Monitoring-Status Phase 1

| Bereich | Stand |
|---|---|
| Availability | Uptime Kuma aktiv |
| Metriksammlung | Prometheus aktiv |
| Visualisierung | Grafana aktiv, Prometheus als Datenquelle vorbereitet |
| Linux-Metriken | Node Exporter in LXC 102 und LXC 110 aktiv |
| Proxmox-Host | keine Paketinstallation, keine Docker-Installation auf dem Host |

## Geplante Erweiterungen

- Uptime-Kuma-Checks für neue Monitoring-Komponenten ergänzen
- cAdvisor für Container-Metriken prüfen
- Proxmox-Metriken sicher anbinden
- Backup- und Restore-Prozess dokumentieren
