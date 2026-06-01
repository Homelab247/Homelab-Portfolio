# Monitoring

LXC 102 ist der dedizierte Ort für Monitoring-Dienste.

- Uptime Kuma ist bereits vorhanden und bleibt für Availability Checks zuständig.
- Grafana läuft im Monitoring-LXC als Dashboard-/Visualisierungsschicht.
- Prometheus ist als nächster Baustein geplant, aktuell aber noch nicht aktiv.
- Diese Beispiele überschreiben keine bestehende Uptime-Kuma-Konfiguration.
