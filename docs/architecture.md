# Architektur

## Ziel

Die Homelab-Architektur soll übersichtlich, wartbar und bewerbungstauglich sein. Dienste werden nach Rolle getrennt, damit Fehler, Updates und Experimente nicht unnötig andere Bereiche beeinflussen.

## Rollenmodell

```text
Proxmox VE
├── Storage-LXC
├── Monitoring-LXC
├── Docker-Services-LXC
├── Smart-Home-VM
├── Automation-VM
└── isolierte isolierte Lern- und Laborumgebungen
```

## Grundentscheidungen

### Proxmox als Basis

Proxmox VE stellt die Virtualisierungsschicht bereit. VMs und LXC-Container werden rollenbasiert genutzt.

### LXC für schlanke Linux-Dienste

Monitoring, Storage und Docker-Services laufen in Containern, weil sie leichtgewichtig, schnell zu sichern und gut isolierbar sind.

### VMs für spezielle Systeme

Home Assistant und Automation laufen als eigene VMs, wenn das für Stabilität, Kompatibilität oder klare Trennung sinnvoll ist.

## Aktueller Zielzustand

| Bereich | System | Aufgabe |
|---|---|---|
| Storage | LXC 101 | Datenablage, SMB/CIFS, Backup-Ziel |
| Monitoring | LXC 102 | Uptime Kuma, Grafana |
| Docker Services | LXC 110 | Docker Engine, Compose, Werkzeug- und Admin-Dienste |
| Smart Home | VM 103 | Home Assistant |
| Automation | VM 104 | Hermes Agent und Automationsworkflows |
| Lab-Umgebung | separate VMs | isolierte Lern- und Lab-Systeme |

## Warum nicht alles in einem Container?

Eine klare Trennung hilft bei:

- Fehlersuche
- Updates
- Backups
- Sicherheitsbewertung
- nachvollziehbarer Dokumentation
- professioneller Darstellung im Portfolio

Monitoring und allgemeine Docker-Dienste laufen daher getrennt.
