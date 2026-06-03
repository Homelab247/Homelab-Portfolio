# Hardware

## Proxmox-Server

| Komponente | Details |
|---|---|
| Plattform | Eigenbau-/Desktop-System auf MSI MAG B550 TOMAHAWK |
| Hersteller / Board | Micro-Star International MAG B550 TOMAHAWK (MS-7C91) |
| CPU | AMD Ryzen 7 5800X, 8 Kerne / 16 Threads |
| RAM | 32 GB |
| Systemdisk | 447 GB SSD, Patriot Burst |
| Datenspeicher | 1,8 TB SSD, WDC WDS200T2B0A |
| Virtualisierung | Proxmox VE 9.1.9, Bare-Metal |
| Storage-Pools | `local`, `local-lvm`, `daten` |

## Storage-Aufteilung

| Datenträger | Größe | Nutzung |
|---|---:|---|
| System-SSD | ca. 447 GB | Proxmox-System, lokaler Speicher, LVM-Thin |
| Datenspeicher | ca. 1,8 TB | VM-/LXC-Daten, Exporte und Storage-Rolle |

## Warum diese Hardware?

Der Server bietet genug Leistung für mehrere parallele VMs und LXC-Container. Die CPU mit 8 Kernen / 16 Threads eignet sich gut für Virtualisierung, Laborumgebungen, Monitoring, Smart-Home-Dienste und Automatisierung.

Durch die getrennte Storage-Struktur liegen Systemdaten und Nutzdaten nicht auf derselben logischen Ebene.

## Geplante Ergänzungen

- Stromverbrauch mit Messsteckdose dokumentieren
- Auslastung über Grafana sichtbar machen
- Backup- und Restore-Labor auf Storage-Ebene dokumentieren
