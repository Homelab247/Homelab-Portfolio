# Troubleshooting

## Ziel

Dieses Dokument sammelt typische Fehlerbilder und Lösungswege aus dem Homelab. Es zeigt, wie Probleme strukturiert eingegrenzt werden.

## Fall 1: Grafana startet nicht

### Symptom

Grafana-Container wurde erstellt, Port 3000 ist aber nicht erreichbar.

### Diagnose

```bash
docker ps -a
docker compose logs --tail=100 grafana
ss -tulpen | grep ':3000'
```

### Häufige Ursache

Bei gemountetem Datenverzeichnis kann Grafana wegen fehlender Rechte in einen Restart-Loop geraten.

### Lösung

```bash
chown -R 472:472 /opt/homelab-monitoring/grafana/data
cd /opt/homelab-monitoring/grafana
docker compose up -d
```

## Fall 2: Dienst läuft, ist aber nicht erreichbar

### Prüfen

```bash
ss -tulpen
curl -I http://127.0.0.1:<port>
docker ps
```

### Mögliche Ursachen

- Container nicht gestartet
- Port nicht gebunden
- falsche IP/Port-Kombination
- Firewall oder Routing

## Fall 3: Docker-Service sauber trennen

Wenn ein allgemeiner Dienst nicht zum Monitoring gehört, wird er nicht in den Monitoring-LXC gelegt, sondern in den separaten Docker-Services-LXC.
