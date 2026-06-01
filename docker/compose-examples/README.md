# Docker Compose Beispiele

Dieser Bereich enthält realistische, aber bereinigte Compose-Beispiele für den separaten LXC `docker-services`.

## Ziel

Der Docker-Services-LXC ist für allgemeine Tools und Demo-Dienste gedacht. Monitoring bleibt im separaten Monitoring-LXC, Storage bleibt im Storage-LXC.

## Enthaltene Beispiele

| Datei | Zweck |
|---|---|
| `it-tools.compose.example.yml` | Beispielservice für interne Admin-/IT-Tools |
| `dozzle.compose.example.yml` | optionaler Container-Logviewer für Docker-Services |

## Deployment-Beispiel

```bash
mkdir -p /opt/docker-services/it-tools
cd /opt/docker-services/it-tools
cp /pfad/zum/repo/docker/compose-examples/it-tools.compose.example.yml compose.yml
docker compose up -d
```

## Regeln

- keine Secrets in Compose-Dateien speichern
- produktive Werte in `.env` auslagern, aber `.env` nicht committen
- pro Dienst ein eigener Ordner unter `/opt/docker-services/<dienst>`
- nur interne Ports veröffentlichen, keine Router-Portfreigabe ohne Konzept
