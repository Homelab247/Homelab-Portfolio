# Homelab Portfolio

> Dokumentation meines privaten Homelabs mit Fokus auf Proxmox, Linux-Administration, LXC, Docker, Monitoring, Storage, Automation und sauberer Betriebsdokumentation.

![Proxmox](https://img.shields.io/badge/Proxmox-VE-orange?logo=proxmox)
![Linux](https://img.shields.io/badge/Linux-Server-informational?logo=linux)
![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker)
![Monitoring](https://img.shields.io/badge/Monitoring-Grafana%20%7C%20Uptime%20Kuma-green)
![Status](https://img.shields.io/badge/Status-in%20Aufbau-yellow)

## Überblick

Dieses Repository dokumentiert mein persönliches Homelab als praxisnahes IT-Portfolio. Ziel ist es, typische Aufgaben aus Systemadministration und Fachinformatik Systemintegration nachvollziehbar zu zeigen: Virtualisierung, Dienste trennen, Monitoring aufbauen, Storage strukturieren, Backups planen, Automatisierung einsetzen und Änderungen sauber dokumentieren.

Das Homelab ist bewusst als Lern- und Testumgebung aufgebaut. Die Dokumentation zeigt nicht nur, welche Dienste laufen, sondern auch, warum sie getrennt wurden und welche administrativen Fähigkeiten dabei trainiert werden.

## Schwerpunkte

- Virtualisierung mit Proxmox VE
- Linux-Server und LXC-Container
- Docker Engine und Docker Compose
- Monitoring mit Uptime Kuma und Grafana
- Storage- und Backup-Konzept
- Smart-Home-Integration mit Home Assistant
- Automatisierung mit Hermes Agent
- Dokumentation, Troubleshooting und Betriebsprozesse
- Sicherheitsbewusstsein: keine Secrets im Repository, Rollen- und Diensttrennung

## Hardware

### Proxmox-Server

| Komponente | Details |
|---|---|
| Plattform | Eigenbau-/Desktop-System auf MSI MAG B550 TOMAHAWK |
| Mainboard | Micro-Star International MAG B550 TOMAHAWK (MS-7C91) |
| CPU | AMD Ryzen 7 5800X, 8 Kerne / 16 Threads |
| RAM | 32 GB |
| Systemdisk | 447 GB SSD, Patriot Burst |
| Datenspeicher | 1,8 TB SSD, WDC WDS200T2B0A |
| Virtualisierung | Proxmox VE 9.1.9, Bare-Metal |
| Storage-Pools | `local`, `local-lvm`, separater Datenspeicher `daten` |

Der Host ist bewusst als leistungsfähige lokale Virtualisierungsplattform aufgebaut. Die Trennung zwischen Systemdisk und separatem Datenspeicher erleichtert die Organisation von VMs, LXC-Containern, Backups und Exporten.

## Architektur

```mermaid
flowchart TD
    Internet[Internet / LAN] --> Router[Router / Heimnetz]
    Router --> Proxmox[Proxmox VE Node]

    Proxmox --> Storage[LXC 101: Storage]
    Proxmox --> Monitoring[LXC 102: Monitoring]
    Proxmox --> Docker[LXC 110: Docker Services]
    Proxmox --> HA[VM 103: Home Assistant]
    Proxmox --> Hermes[VM 104: Automation / Hermes Agent]
    Proxmox --> Labs[Test- und Lernumgebungen]

    Monitoring --> Kuma[Uptime Kuma]
    Monitoring --> Grafana[Grafana]
    Docker --> Tools[IT-Tools / Demo-Services]
```

## Systeme und Rollen

| System | Rolle | Beschreibung |
|---|---|---|
| Proxmox VE | Virtualisierung | Basis für VMs und LXC-Container |
| LXC 101 | Storage | Datenablage, SMB/CIFS, Backup-Ziel |
| LXC 102 | Monitoring | Uptime Kuma und Grafana |
| LXC 110 | Docker Services | Separater Container für Docker-/Demo-Dienste |
| VM 103 | Smart Home | Home Assistant |
| VM 104 | Automation | Hermes Agent, Telegram Gateway, Automatisierung |
| Testlabs | Lernumgebung | Isolierte Windows-/Linux-Testumgebungen |

Private IP-Adressen, Tokens, MAC-Adressen und sensible Details werden bewusst nicht öffentlich dokumentiert.

## Aktuelle Dienste

| Dienst | Rolle | System |
|---|---|---|
| Uptime Kuma | Verfügbarkeitsmonitoring | LXC 102 `monitoring` |
| Grafana | Dashboards / Metriken | LXC 102 `monitoring` |
| Docker Engine | Containerplattform | LXC 110 `docker-services` |
| IT-Tools | Beispiel-/Demo-Webtool | LXC 110 `docker-services` |
| Home Assistant | Smart-Home-Verwaltung | VM 103 |
| Hermes Agent | Automatisierung / Assistenzsystem | VM 104 |

## Was dieses Homelab zeigt

### Infrastruktur planen

Die Dienste sind rollenbasiert getrennt. Storage, Monitoring, allgemeine Docker-Dienste und Automation laufen nicht ungeordnet in einem einzigen Container, sondern jeweils in klar definierten Systemen.

### Monitoring betreiben

Uptime Kuma übernimmt Verfügbarkeitschecks. Grafana dient als Dashboard-Schicht und kann später mit Prometheus, Exportern und weiteren Metrikquellen ausgebaut werden.

### Containerisierung nutzen

Allgemeine Tools und Demo-Dienste laufen in einem eigenen Docker-Services-LXC. Dadurch bleiben Monitoring und produktionsnahe Services sauber getrennt.

### Dokumentation pflegen

Jede Rolle wird in eigenen Markdown-Dateien beschrieben. Das Repository soll nachvollziehbar zeigen, wie die Umgebung aufgebaut ist, welche Entscheidungen getroffen wurden und wie sie weiterentwickelt werden kann.

## Dokumentation

- [Hardware](docs/hardware.md)
- [Architektur](docs/architecture.md)
- [Netzwerk](docs/network.md)
- [Services](docs/services.md)
- [Storage](docs/storage.md)
- [Monitoring](docs/monitoring.md)
- [Backup-Strategie](docs/backup-strategy.md)
- [Security](docs/security.md)
- [Automation](docs/automation.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Zielzustand Proxmox](docs/proxmox-target-state.md)
- [Roadmap](docs/roadmap.md)

## Security- und Datenschutzgrundsätze

- keine Passwörter, Tokens oder API-Keys im Repository
- keine MAC-Adressen oder sensiblen Hostdetails
- öffentliche Dokumentation nutzt Rollen statt privater Detaildaten
- Beispielkonfigurationen werden als `.example` dokumentiert
- Dienste werden intern betrieben, keine öffentlichen Portfreigaben im Rahmen dieses Repos

## Roadmap

- [x] Rollenmodell für Storage, Monitoring, Docker Services und Automation festlegen
- [x] Grafana im Monitoring-LXC ergänzen
- [x] Separaten Docker-Services-LXC erstellen
- [x] Beispielservice über Docker Compose bereitstellen
- [ ] Prometheus und Exporter sauber ergänzen
- [ ] Grafana-Dashboard exportieren und dokumentieren
- [ ] Backup-Prozess praktisch testen und dokumentieren
- [ ] Netzwerkdiagramm als Draw.io-Datei ergänzen
- [ ] Beispiel-Screenshots anonymisiert hinzufügen
- [ ] GitHub Actions für Markdown-Prüfung ergänzen

## Hinweis

Dieses Repository beschreibt eine private Lern- und Laborumgebung. Es erhebt keinen Anspruch auf produktionsreife Enterprise-Architektur, sondern zeigt praxisnahes Lernen, saubere Dokumentation und den strukturierten Aufbau administrativer Fähigkeiten.
