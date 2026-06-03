# Netzwerk

Das Homelab läuft in einem privaten Heimnetz. In dieser öffentlichen Dokumentation werden keine vollständigen IP-Pläne, MAC-Adressen oder Zugangsdaten veröffentlicht.

## Grundsätze

- interne Dienste bleiben intern erreichbar
- keine öffentlichen Portfreigaben als Teil dieses Repositories
- keine Router- oder DNS-Zugangsdaten in Git
- Monitoring prüft interne Dienste und Systemzustände
- private Adressen werden nur anonymisiert oder rollenbasiert beschrieben

## Vereinfachtes Modell

```text
Internet
└── Router / Heimnetz
    └── Proxmox VE Host
        ├── Storage-LXC
        ├── Monitoring-LXC
        ├── Docker-Services-LXC
        ├── Smart-Home-VM
        └── Automation-VM
```

## Zugriffskonzept

Administrative Zugriffe erfolgen über bestehende lokale Wege. Für die Portfolio-Dokumentation werden nur Rollen und Kommunikationsbeziehungen beschrieben.

Beispiele:

- Admin-Zugriff auf Proxmox nur intern
- Weboberflächen wie Grafana oder Uptime Kuma nur im privaten Netz
- keine Veröffentlichung von Tokens, API-Keys oder privaten Hostdetails

## Monitoring im Netzwerk

Das Monitoring prüft interne Dienste wie Grafana, Prometheus, IT-Tools und weitere Systeme. Uptime Kuma beantwortet dabei die Frage, ob ein Dienst erreichbar ist. Prometheus und Grafana zeigen zusätzlich Systemmetriken.

## Geplante Verbesserung

Ein anonymisiertes Netzwerkdiagramm soll ergänzt werden. Es soll die Rollen und Verbindungen zeigen, aber keine sensiblen Details aus dem Heimnetz veröffentlichen.
