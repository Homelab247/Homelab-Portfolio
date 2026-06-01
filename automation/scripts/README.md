# Automation Scripts

Dieser Ordner enthält kleine, bewusst einfache Admin-Skripte für typische Homelab-Aufgaben. Die Skripte sind so geschrieben, dass sie ohne private Zugangsdaten funktionieren und als Bewerbungsnachweis zeigen, wie Checks, Exporte und Dokumentation automatisiert werden können.

## Enthaltene Skripte

| Script | Zweck |
|---|---|
| `check-service-ports.sh` | prüft, ob zentrale interne Dienste auf ihren Ports erreichbar sind |
| `export-docker-compose-configs.sh` | sammelt Compose-Dateien aus den Service-LXCs in einen Backup-/Exportordner |
| `generate-homelab-status.sh` | erzeugt einen kurzen Markdown-Statusbericht für die Dokumentation |

## Nutzung

Die Skripte sind als Beispiele gedacht. Vor produktiver Nutzung müssen Hostnamen/IPs an die eigene Umgebung angepasst werden.

```bash
chmod +x automation/scripts/*.sh
./automation/scripts/check-service-ports.sh
```

## Sicherheitsregeln

- keine Passwörter oder Tokens in Skripten speichern
- sensible `.env` Dateien nicht ins Repository übernehmen
- produktive Pfade vor Ausführung prüfen
- vor Lösch-/Änderungsaktionen immer ein Backup erstellen
