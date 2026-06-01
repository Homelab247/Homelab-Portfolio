# Backup-Strategie

## Ziel

Backups sollen wichtige Konfigurationen, Dokumentation und Dienste wiederherstellbar machen. Der Fokus liegt auf nachvollziehbaren Wiederherstellungsschritten.

## Zu sichernde Bereiche

| Bereich | Referenzen |
|---|---|
| Proxmox-Konfiguration | VM-/LXC-Konfigurationen, Rollenübersicht |
| Docker Compose | Compose-Dateien und `.env.example`-Vorlagen |
| Monitoring | Grafana-Dashboards, Uptime-Kuma-Konfigurationen |
| Dokumentation | GitHub-Repository, Markdown-Dokumente |
| Storage | wichtige Daten und Exporte |

## Prinzipien

- Konfigurationen versionieren
- keine Secrets in Git speichern
- Wiederherstellung dokumentieren
- Backups regelmäßig validieren
- kritische Dienste vor Änderungen sichern

## Geplante Erweiterung

- automatisierte Config-Exports
- Restore-Labor dokumentieren
- Backup-Check in Uptime Kuma überwachen
