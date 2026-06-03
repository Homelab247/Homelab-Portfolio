# Troubleshooting

## Ziel

Dieses Dokument ist als persönliche Fehlerliste gedacht. Wenn ein Problem wieder auftaucht, möchte ich nicht jedes Mal von vorne suchen.

Ich notiere deshalb nicht nur die Lösung, sondern auch die Prüfung davor.

## Vorgehen

Bei Problemen prüfe ich zuerst:

1. läuft der Dienst überhaupt?
2. ist der richtige Port gebunden?
3. gibt es Fehler in den Logs?
4. ist der Dienst intern erreichbar?
5. betrifft das Problem nur einen Container oder mehrere Systeme?

## Fall 1: Grafana startet nicht

### Symptom

Der Grafana-Container wurde erstellt, aber die Weboberfläche ist nicht erreichbar.

### Prüfung

```bash
docker ps -a
docker compose logs --tail=100 grafana
ss -tulpen | grep ':3000'
```

### Mögliche Ursache

Bei gemountetem Datenverzeichnis kann Grafana wegen fehlender Rechte in einen Restart-Loop geraten.

### Lösung

```bash
chown -R 472:472 /opt/homelab-monitoring/grafana/data
cd /opt/homelab-monitoring/grafana
docker compose up -d
```

### Ergebnis

Grafana startet wieder und Port 3000 ist intern erreichbar.

## Fall 2: Dienst läuft, ist aber nicht erreichbar

### Symptom

Ein Container läuft laut `docker ps`, die Weboberfläche antwortet aber nicht.

### Prüfung

```bash
docker ps
ss -tulpen
curl -I http://127.0.0.1:<port>
```

### Mögliche Ursachen

- falscher Port in der Compose-Datei
- Dienst lauscht nur intern im Container
- Container ist gestartet, Anwendung darin aber fehlerhaft
- Firewall oder Routing blockiert den Zugriff

### Nächster Schritt

Zuerst lokal im Container oder LXC testen. Wenn der Dienst lokal antwortet, liegt das Problem eher bei Portbindung, Firewall oder Netzwerkweg.

## Fall 3: Docker-Dienst gehört nicht ins Monitoring-System

### Situation

Ein neuer Werkzeugdienst soll per Docker laufen.

### Entscheidung

Wenn der Dienst nicht direkt zum Monitoring gehört, lege ich ihn nicht in den Monitoring-LXC. Dafür gibt es den separaten Docker-Services-LXC.

### Grund

So bleiben Monitoring und allgemeine Tools getrennt. Das macht Updates und Fehlersuche einfacher.

## Fall 4: Backup-Frage ohne zweite Platte

### Situation

Es gibt aktuell kein unabhängiges zweites Backup-Medium.

### Bewertung

Snapshots und lokale Kopien helfen bei einzelnen Änderungen, ersetzen aber kein echtes Backup.

### Nächster Schritt

Das Risiko wird offen benannt. Als Ausbau ist ein separates Backup-Ziel geplant, zum Beispiel eine externe Platte oder ein eigener Backup-Speicher.
