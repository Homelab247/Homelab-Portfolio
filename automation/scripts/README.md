# Automation Scripts

Dieser Ordner enthält kleine Admin-Skripte für typische Homelab-Aufgaben. Die Skripte sind bewusst einfach gehalten und zeigen nachvollziehbare Automatisierung für Checks, Exporte und Statusberichte.

## Enthaltene Skripte

| Script | Zweck |
|---|---|
| `check-service-ports.sh` | prüft zentrale interne Dienste auf erreichbare Ports |
| `export-docker-compose-configs.sh` | sammelt Compose-Dateien aus den Service-LXCs in einen Exportordner |
| `generate-homelab-status.sh` | erzeugt einen Markdown-Statusbericht für die Dokumentation |

## Nutzung

```bash
chmod +x automation/scripts/*.sh
./automation/scripts/check-service-ports.sh
```

## Sicherheitsregeln

- keine Passwörter oder Tokens in Skripten speichern
- sensible `.env` Dateien nicht ins Repository übernehmen
- produktive Pfade vor Ausführung prüfen
- vor Lösch-/Änderungsaktionen immer ein Backup erstellen
