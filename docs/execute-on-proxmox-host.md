# Proxmox-Ausführung: Monitoring + Docker-Services

Diese Anleitung ist für die **Proxmox-Shell als root/Admin** gedacht.

Zielbild:

- **LXC 102 `monitoring`** bleibt Monitoring:
  - Uptime Kuma ist bereits vorhanden
  - Prometheus ist bereits erreichbar
  - Grafana wird ergänzt
- **LXC 110 `docker-services`** wird neu erstellt:
  - Docker Engine
  - Docker Compose
  - Beispielservice `it-tools`

Nicht anfassen:

- keine vSRO-/Windows-Test-VMs
- keine VM100/105/106-Änderungen
- kein Docker direkt auf dem Proxmox-Host
- keine Router-/Portfreigaben

---

## 0. Kurzcheck

Diesen Block zuerst auf dem Proxmox-Host ausführen:

```bash
pct list
pct exec 102 -- bash -lc 'id; hostname; docker --version || true; docker compose version || true; ss -tulpen | grep -E ":(3001|3000|9090)" || true'
```

Erwartung:

- `102 monitoring` läuft
- Docker ist vorhanden
- Port `3001` = Uptime Kuma
- Port `9090` = Prometheus
- Port `3000` fehlt noch = Grafana noch nicht aktiv

---

## 1. Grafana in LXC 102 installieren

Damit die Befehle nicht durch verschachtelte Anführungszeichen kaputtgehen, erstellen wir zuerst ein Script auf dem Proxmox-Host und schieben es dann in den Container.

### 1.1 Installationsscript auf Proxmox-Host erstellen

```bash
cat >/tmp/install-grafana-lxc102.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

mkdir -p /opt/homelab-monitoring/grafana/data
cd /opt/homelab-monitoring/grafana

if [ -f compose.yml ]; then
  cp compose.yml "compose.yml.bak.$(date +%Y%m%d_%H%M%S)"
fi

cat > compose.yml <<'EOF'
services:
  grafana:
    image: grafana/grafana-oss:latest
    container_name: grafana
    restart: unless-stopped
    ports:
      - "3000:3000"
    volumes:
      - ./data:/var/lib/grafana
    environment:
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=changeme
      - GF_USERS_ALLOW_SIGN_UP=false
EOF

docker compose up -d

echo
echo "Docker-Container:"
docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'

echo
echo "Offene Monitoring-Ports:"
ss -tulpen | grep -E ':(3001|3000|9090)' || true
SCRIPT

chmod +x /tmp/install-grafana-lxc102.sh
```

### 1.2 Script in LXC 102 kopieren und ausführen

```bash
pct push 102 /tmp/install-grafana-lxc102.sh /root/install-grafana-lxc102.sh --perms 755
pct exec 102 -- bash /root/install-grafana-lxc102.sh
```

### 1.3 Grafana prüfen

```bash
pct exec 102 -- bash -lc 'docker ps | grep -i grafana; ss -tulpen | grep ":3000"'
```

Browser:

```text
http://<IP-von-LXC-102>:3000
```

Login:

```text
Benutzer: admin
Passwort: changeme
```

Danach direkt Passwort ändern.

---

## 2. Docker-Services-LXC 110 erstellen

### 2.1 Prüfen, ob VMID 110 frei ist

```bash
pct status 110 || true
```

Wenn `does not exist` erscheint, ist die ID frei.

### 2.2 LXC 110 erstellen

```bash
VMID=110
TEMPLATE='local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst'

pct create "$VMID" "$TEMPLATE" \
  --hostname docker-services \
  --storage daten \
  --rootfs daten:32 \
  --cores 2 \
  --memory 2048 \
  --swap 512 \
  --unprivileged 1 \
  --features nesting=1,keyctl=1 \
  --onboot 1 \
  --net0 name=eth0,bridge=vmbr0,ip=dhcp,type=veth \
  --description 'Portfolio Docker Services LXC - separated from monitoring/storage'
```

### 2.3 LXC 110 starten und prüfen

```bash
pct start 110
pct exec 110 -- bash -lc 'id; hostname; cat /etc/os-release; ip -4 addr; df -h /; free -h'
```

---

## 3. Docker in LXC 110 installieren

### 3.1 Installationsscript auf Proxmox-Host erstellen

```bash
cat >/tmp/install-docker-lxc110.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

. /etc/os-release
cat >/etc/apt/sources.list.d/docker.list <<EOF
deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu ${VERSION_CODENAME} stable
EOF

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable --now docker

docker --version
docker compose version
SCRIPT

chmod +x /tmp/install-docker-lxc110.sh
```

### 3.2 Script in LXC 110 kopieren und ausführen

```bash
pct push 110 /tmp/install-docker-lxc110.sh /root/install-docker-lxc110.sh --perms 755
pct exec 110 -- bash /root/install-docker-lxc110.sh
```

---

## 4. Beispielservice in LXC 110 starten

Als erster sauberer Demo-Service für das Portfolio: **IT-Tools** auf Port `8081`.

### 4.1 Compose-Script erstellen

```bash
cat >/tmp/start-it-tools-lxc110.sh <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

mkdir -p /opt/docker-services/it-tools
cd /opt/docker-services/it-tools

cat > compose.yml <<'EOF'
services:
  it-tools:
    image: corentinth/it-tools:latest
    container_name: it-tools
    restart: unless-stopped
    ports:
      - "8081:80"
EOF

docker compose up -d

docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'
SCRIPT

chmod +x /tmp/start-it-tools-lxc110.sh
```

### 4.2 Script in LXC 110 kopieren und ausführen

```bash
pct push 110 /tmp/start-it-tools-lxc110.sh /root/start-it-tools-lxc110.sh --perms 755
pct exec 110 -- bash /root/start-it-tools-lxc110.sh
```

Browser:

```text
http://<IP-von-LXC-110>:8081
```

---

## 5. Abschlussprüfung

```bash
pct list

echo "--- LXC 102 Monitoring ---"
pct exec 102 -- bash -lc 'docker ps; ss -tulpen | grep -E ":(3001|3000|9090)" || true'

echo "--- LXC 110 Docker Services ---"
pct exec 110 -- bash -lc 'docker ps; ss -tulpen | grep -E ":(8081)" || true'
```

Erwartung:

- LXC 102:
  - Uptime Kuma auf `3001`
  - Grafana auf `3000`
  - Prometheus auf `9090`
- LXC 110:
  - IT-Tools auf `8081`

---

## 6. Rollback

### Grafana aus LXC 102 entfernen

```bash
pct exec 102 -- bash -lc 'cd /opt/homelab-monitoring/grafana && docker compose down'
```

### LXC 110 komplett entfernen

Nur ausführen, wenn der neue Docker-Services-Container weg soll:

```bash
pct stop 110
pct destroy 110
```

---

## 7. Danach im Repo dokumentieren

Nach erfolgreicher Ausführung diese Punkte in der README bzw. den Docs aktualisieren:

- Grafana läuft in LXC 102
- Prometheus läuft in LXC 102
- Uptime Kuma war bereits vorhanden
- Docker Services laufen getrennt in LXC 110
- IT-Tools läuft als erster Beispielservice
