# Docker Compose Referenzen

Dieser Bereich enthält bereinigte Compose-Dateien für den separaten LXC `docker-services`.

## Ziel

Der Docker-Services-LXC ist für interne Admin- und Werkzeugdienste vorgesehen. Monitoring bleibt im separaten Monitoring-LXC, Storage bleibt im Storage-LXC.

## Enthaltene Konfigurationen

| Datei | Zweck |
|---|---|
| `it-tools.compose.yml` | produktiv eingesetzter interner Werkzeugdienst für IT-/Admin-Aufgaben |
| `dozzle.compose.yml` | vorbereitete Referenz für Docker-Logübersicht im Services-LXC |
| `tools.compose.example.yml` | Referenzsammlung weiterer möglicher Werkzeugdienste |

## Deployment-Struktur

```bash
mkdir -p /opt/docker-services/it-tools
cd /opt/docker-services/it-tools
cp /pfad/zum/repo/docker/compose/it-tools.compose.yml compose.yml
docker compose up -d
```

## Regeln

- keine Secrets in Compose-Dateien speichern
- produktive Werte in `.env` auslagern, `.env` aber nicht committen
- pro Dienst ein eigener Ordner unter `/opt/docker-services/<dienst>`
- nur interne Ports veröffentlichen, keine Router-Portfreigabe ohne Konzept
