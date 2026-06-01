# Manuelle nächste Schritte

Stand: Die Abschlussumsetzung ist erfolgt. Grafana läuft im Monitoring-LXC, der separate Docker-Services-LXC ist aktiv und IT-Tools ist als Beispielservice erreichbar.

## 1. Grafana absichern

- Initiales Admin-Passwort ändern, falls noch Standard-/Installationspasswort genutzt wird.
- Admin-Zugang nicht öffentlich exponieren.
- Später Datenquellen und Dashboards gezielt ergänzen.

## 2. Prometheus ergänzen

Prometheus ist im Zielbild vorgesehen, aber aktuell noch nicht aktiv. Sinnvolle Reihenfolge:

1. Prometheus als eigenen Compose-Service im Monitoring-LXC ergänzen.
2. Node Exporter / cAdvisor / Docker-Metriken bewusst auswählen.
3. Grafana-Datenquelle einrichten.
4. Erstes Dashboard dokumentieren.

## 3. Uptime Kuma weiter als Availability-Layer nutzen

Uptime Kuma ist bereits vorhanden und sollte weiter für Erreichbarkeitschecks genutzt werden:

- HTTP-Checks für Webdienste
- TCP-Checks für wichtige Ports
- klare Namen und Tags für Services

Grafana/Prometheus ersetzen Uptime Kuma nicht, sondern ergänzen es um Metriken und Dashboards.

## 4. Docker-Services-LXC pflegen

LXC 110 ist der richtige Ort für allgemeine Tools und Demo-Services.

Empfehlung:

- pro Dienst eigener Unterordner unter `/opt/docker-services/<dienstname>`
- Compose-Dateien versionieren oder als bereinigte `.example`-Dateien ins Portfolio übernehmen
- keine Secrets in Compose-Dateien committen
- Volumes bewusst benennen und Backup-Bedarf notieren

## 5. Portfolio weiter ausbauen

- Screenshot-freie Architekturdiagramme ergänzen
- erstes Grafana-Dashboard anonymisiert dokumentieren
- Prometheus-Setup als nächsten Meilenstein ergänzen
- Changelog pro Infrastrukturänderung pflegen
