# Backup-Strategie

## Ziel

Dieses Dokument beschreibt, wie ich aktuell mit Sicherungen umgehe und was beim Thema Backup noch fehlt.

Wichtig: Ich habe aktuell noch kein unabhängiges zweites Backup-Medium. Deshalb beschreibe ich Snapshots und lokale Sicherungen nicht als vollständiges Backup-Konzept.

## Aktueller Stand

Aktuell sichere ich vor allem Konfigurationen und Dokumentation.

| Bereich | Aktueller Umgang |
|---|---|
| Proxmox-Struktur | Rollen, VMs und LXC-Container sind dokumentiert |
| Docker Compose | Compose-Dateien liegen als Referenz im Repository |
| Monitoring | Grafana-Dashboards und Prometheus-Konfigurationen werden abgelegt |
| Dokumentation | Markdown-Dateien werden über Git versioniert |
| Storage | wichtige Exporte liegen lokal im Homelab |

## Was noch fehlt

Für ein echtes Backup fehlt ein getrenntes Ziel.

Offen sind aktuell:

- separate Backup-Platte oder anderer Backup-Speicher
- regelmäßiger Proxmox-Backup-Job auf ein unabhängiges Ziel
- Restore-Test aus einem echten Backup
- Aufbewahrungsregel, zum Beispiel mehrere tägliche und wöchentliche Sicherungen

## Snapshots sind kein Backup

Snapshots können bei Änderungen helfen, schnell zurückzugehen. Sie ersetzen aber kein Backup.

Ein Snapshot schützt nicht ausreichend vor:

- Defekt der einzigen Platte
- versehentlichem Löschen auf demselben Storage
- größeren Dateisystemproblemen
- Verlust des Proxmox-Hosts

Deshalb beschreibe ich Snapshots nur als kurzfristige Rollback-Möglichkeit.

## Kurzfristige Maßnahmen ohne neue Platte

Auch ohne zweite Platte kann ich ein paar Dinge vorbereiten:

1. wichtige Konfigurationen notieren
2. Docker-Compose-Dateien als Referenz ablegen
3. keine Secrets in Git speichern
4. Restore-Schritte an einem ungefährlichen Testcontainer üben
5. offene Risiken offen benennen

Das hilft bei der Wiederherstellung einzelner Dienste. Es ersetzt aber kein echtes Backup-Ziel.

## Geplanter Ausbau

Als nächster Schritt ist ein separates Backup-Ziel sinnvoll.

| Variante | Einschätzung |
|---|---|
| externe USB-HDD oder SSD | günstiger Einstieg, deutlich besser als nur lokale Snapshots |
| zweite interne Platte | nützlich, schützt aber nicht gegen kompletten Hostverlust |
| separater Backup-Host oder NAS | bessere Trennung und langfristig die sauberere Lösung |
| Proxmox Backup Server | gute Lösung für regelmäßige Backups und Restore-Tests |

## Geplanter Restore-Test

Sobald ein echtes Backup-Ziel vorhanden ist, möchte ich einen Restore-Test dokumentieren.

Geplanter Ablauf:

1. Testcontainer sichern
2. Testcontainer löschen oder unter neuem Namen wiederherstellen
3. Dienststart prüfen
4. Ergebnis notieren
5. Probleme und offene Punkte festhalten

## Bewertung

Der aktuelle Stand ist noch kein vollständiges Backup-Konzept. Wichtig ist für mich, das ehrlich zu benennen und die nächsten Schritte vorzubereiten.
