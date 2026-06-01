# Storage

Der Proxmox-Node nutzt separaten lokalen Systemstorage und einen größeren Datenspeicher für VMs, Container und Daten.

## Storage-Rolle

LXC 101 bündelt Daten-/Storage-Aufgaben. Dadurch bleiben Monitoring, Automation und Testdienste frei von Storage-Spezifika.

## Dokumentationsregeln

- keine echten Share-Credentials im Repo
- keine sensiblen Pfade mit privaten Namen veröffentlichen
- Beispielkonfigurationen nur als `.example`
- Backup-/Rollback-Hinweise getrennt dokumentieren
