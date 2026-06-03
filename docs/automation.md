# Automation

## Ziel

Ich nutze Automation im Homelab für kleine wiederkehrende Aufgaben. Es geht nicht um ein großes Automationssystem, sondern um praktische Admin-Hilfen.

Beispiele sind Statusprüfungen, Portchecks, Konfigurations-Exporte und Notizen für die Dokumentation.

## Bereiche

| Bereich | Referenz |
|---|---|
| Statusberichte | Markdown-Report über Host, Container und Dienste |
| Service-Checks | einfache Port- und HTTP-Prüfungen |
| Konfigurations-Export | Compose-Dateien ohne Secrets sichern |
| Dokumentation | Export in das GitHub-Portfolio |

## Admin-Skripte

Im Ordner [`automation/scripts`](../automation/scripts) liegen kleine Admin-Skripte:

- `check-service-ports.sh`
- `export-docker-compose-configs.sh`
- `generate-homelab-status.sh`

## Hermes Agent

Auf einer eigenen VM laufen Automatisierungs- und Dokumentationsaufgaben. Dazu nutze ich unter anderem Hermes Agent.

Typische Aufgaben:

- Infrastruktur inventarisieren
- Dokumentation aktualisieren
- Logs und Fehlermeldungen sortieren
- wiederkehrende Checks vorbereiten
- Änderungen mit Rollback-Hinweisen dokumentieren

## Sicherheitsregeln

- keine Tokens oder Passwörter in Skripten
- keine automatischen Löschaktionen ohne klare Bestätigung
- Änderungen dokumentieren und nach Möglichkeit rollbackfähig halten
