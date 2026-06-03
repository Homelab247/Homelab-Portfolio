# Admin-Skripte

Dieser Ordner enthält kleine Admin-Skripte für typische Homelab-Aufgaben. Die Skripte sind einfach gehalten, damit ich sie später schnell lesen, ändern und wiederverwenden kann.

## Skripte

- `check-service-ports.sh`: prüft wichtige interne Ports
- `export-docker-compose-configs.sh`: exportiert Compose-Dateien ohne Secrets
- `generate-homelab-status.sh`: erstellt einen kurzen Statusbericht

## Regeln

- keine Passwörter oder Tokens im Skript speichern
- destructive Befehle vermeiden
- Ausgaben so schreiben, dass sie auch für Dokumentation nutzbar sind
