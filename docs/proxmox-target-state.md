# Proxmox Zielzustand

## Übersicht

| ID | Name | Typ | Rolle |
|---|---|---|---|
| 101 | Storage / Daten | LXC | Datenablage, SMB/CIFS, Backup-Ziel |
| 102 | monitoring | LXC | Uptime Kuma, Grafana, später Prometheus |
| 110 | docker-services | LXC | Docker Engine, Compose, Demo-Services |
| 103 | homeassistant | VM | Smart Home |
| 104 | Hermes | VM | Automation, Agent, Telegram Gateway |
| weitere | Testlabs | VM | isolierte Lern- und Testsysteme |

## Designentscheidung

Docker läuft nicht direkt auf dem Proxmox-Host. Stattdessen gibt es einen eigenen LXC für allgemeine Docker-Services. Monitoring bleibt davon getrennt.

## Aktueller Betriebsstand

- Monitoring-LXC: Uptime Kuma und Grafana aktiv
- Docker-Services-LXC: Docker Engine, Compose und IT-Tools aktiv
- Storage-LXC: separate Daten-/Backup-Rolle
- Automation-VM: Hermes Agent getrennt betrieben

## Geplante Erweiterungen

- Prometheus im Monitoring-LXC
- Exporter für Host-/Container-Metriken
- Grafana-Dashboard als JSON exportieren
- Backup- und Restore-Prozess dokumentieren
