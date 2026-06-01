# Automation

## Ziel

Automation im Homelab soll wiederkehrende Aufgaben nachvollziehbar, reproduzierbar und weniger fehleranfällig machen. Der Fokus liegt nicht auf komplexer Enterprise-Automation, sondern auf praktischen Admin-Hilfen.

## Bereiche

| Bereich | Beispiel |
|---|---|
| Statusberichte | Markdown-Report über Host, Container und Dienste |
| Service-Checks | einfache Port-/HTTP-Prüfungen |
| Konfigurations-Export | Compose-Dateien ohne Secrets sichern |
| Dokumentation | Export in das GitHub-Portfolio |

## Beispielskripte

Im Ordner [`automation/scripts`](../automation/scripts) liegen kleine Beispielskripte:

- `check-service-ports.sh`
- `export-docker-compose-configs.sh`
- `generate-homelab-status.sh`

## Hermes Agent

Hermes Agent wird als Automations- und Assistenzsystem genutzt. Typische Aufgaben:

- Infrastruktur inventarisieren
- Dokumentation aktualisieren
- Logs und Fehlermeldungen strukturieren
- wiederkehrende Checks vorbereiten
- Änderungen mit Rollback-Hinweisen dokumentieren

## Sicherheitsregeln

- keine Tokens oder Passwörter in Skripten
- keine automatischen Löschaktionen ohne klare Bestätigung
- Änderungen dokumentieren und nach Möglichkeit rollbackfähig halten
