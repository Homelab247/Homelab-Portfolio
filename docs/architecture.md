# Architektur

## Ziel

Die Umgebung ist nach Aufgaben getrennt. Storage, Monitoring, Docker-Dienste, Smart Home und Automation laufen nicht in einem gemeinsamen System.

Der Vorteil ist einfach: Wenn ein Dienst Probleme macht oder aktualisiert wird, betrifft das nicht sofort alle anderen Bereiche.

## Rollenmodell

```text
Proxmox VE
├── Storage-LXC
├── Monitoring-LXC
├── Docker-Services-LXC
├── Smart-Home-VM
├── Automation-VM
└── isolierte Lern- und Laborumgebungen
```

## Grundentscheidungen

### Proxmox als Basis

Proxmox VE stellt die Virtualisierung bereit. VMs und LXC-Container lassen sich damit getrennt betreiben, sichern und dokumentieren.

### LXC für schlanke Linux-Dienste

Monitoring, Storage und Docker-Services laufen in LXC-Containern. Für diese Aufgaben reicht ein Container aus und verbraucht weniger Ressourcen als eine vollständige VM.

### VMs für speziellere Systeme

Home Assistant und Automation laufen als eigene VMs. Das trennt sie vom restlichen Lab und vermeidet Abhängigkeiten zu einzelnen Containern.

## Aktueller Aufbau

| Bereich | System | Aufgabe |
|---|---|---|
| Storage | LXC 101 | Datenablage, SMB/CIFS und interne Exporte |
| Monitoring | LXC 102 | Uptime Kuma, Grafana und Prometheus |
| Docker Services | LXC 110 | Docker Engine, Compose und Werkzeugdienste |
| Smart Home | VM 103 | Home Assistant |
| Automation | VM 104 | Hermes Agent und Automationsworkflows |
| Lab-Umgebung | separate VMs | isolierte Lern- und Testsysteme |

## Warum nicht alles in einem Container?

Ein einzelner Container für alles wäre am Anfang einfacher. Für Betrieb und Fehlersuche ist die Trennung aber besser.

Sie hilft bei:

- Updates
- Fehlersuche
- Rechte- und Risikoabschätzung
- Dokumentation
- späteren Erweiterungen

Monitoring und allgemeine Docker-Dienste laufen deshalb getrennt.
