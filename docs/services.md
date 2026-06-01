# Services

## Übersicht

| Dienst | System | Zweck | Status |
|---|---|---|---|
| Uptime Kuma | LXC 102 `monitoring` | Erreichbarkeitsmonitoring | aktiv |
| Grafana | LXC 102 `monitoring` | Dashboards | aktiv |
| Docker Engine | LXC 110 `docker-services` | Containerplattform | aktiv |
| IT-Tools | LXC 110 `docker-services` | Demo-/Admin-Webtool | aktiv |
| Home Assistant | VM 103 | Smart Home | aktiv |
| Hermes Agent | VM 104 | Automation / Assistenz | aktiv |

## Monitoring-Dienste

### Uptime Kuma

Uptime Kuma wird für Verfügbarkeitschecks genutzt. Typische Checks sind HTTP, Ping oder TCP-Port-Prüfungen.

### Grafana

Grafana dient als Dashboard-Oberfläche. Aktuell ist es als Basisdienst installiert. Der nächste Ausbau besteht aus Prometheus, Exportern und eigenen Dashboards.

## Docker Services

Der LXC `docker-services` ist bewusst getrennt vom Monitoring. Dort laufen allgemeine Tools und Demo-Dienste, z. B. IT-Tools.

## Smart Home

Home Assistant läuft als eigene VM und bildet die Smart-Home-Schicht ab.

## Automation

Hermes Agent läuft getrennt und übernimmt Assistenz-, Dokumentations- und Automationsaufgaben.
