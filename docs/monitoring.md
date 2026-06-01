# Monitoring

## Ziel

Das Monitoring soll zeigen, ob Dienste erreichbar sind, und später technische Metriken visualisieren.

## Aktueller Stand

| Komponente | Zweck | Status |
|---|---|---|
| Uptime Kuma | Verfügbarkeitschecks | aktiv |
| Grafana | Dashboards | aktiv |
| Prometheus | Metriksammlung | geplant / aktuell nicht aktiv |
| Node Exporter | Systemmetriken | geplant |
| Docker/cAdvisor | Container-Metriken | optional geplant |

## Rollen

### Uptime Kuma

Uptime Kuma beantwortet die Frage:

> Ist der Dienst erreichbar?

Beispiele:

- Proxmox Webinterface
- Grafana
- IT-Tools
- Home Assistant
- weitere interne Dienste

### Grafana

Grafana beantwortet die Frage:

> Wie verhält sich das System über Zeit?

Beispiele:

- CPU/RAM-Auslastung
- Speicherverbrauch
- Containerstatus
- Service-Dashboards

### Prometheus

Prometheus ist als nächster Ausbauschritt geplant. Es soll Metriken sammeln und Grafana als Datenquelle dienen.

## Nächste Schritte

- Prometheus ergänzen
- Node Exporter auf wichtigen Linux-Systemen ausrollen
- Proxmox-Metriken anbinden
- Grafana-Dashboard exportieren und im Repository dokumentieren
