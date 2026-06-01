# Security

## Grundsätze

Dieses Repository ist für eine öffentliche bzw. bewerbungstaugliche Darstellung gedacht. Deshalb werden sensible Informationen bewusst nicht veröffentlicht.

## Nicht im Repository

- Passwörter
- API-Keys und Tokens
- Zertifikate und private Schlüssel
- MAC-Adressen
- vollständige private Netzpläne mit sensiblen Details
- proprietäre oder private Lab-Daten

## Dokumentationsprinzip

Öffentlich dokumentiert werden Rollen, Konzepte und Lernziele. Konkrete Zugangsdaten und interne Details bleiben lokal.

## Diensttrennung

Dienste werden nach Funktion getrennt:

- Storage getrennt von Monitoring
- Monitoring getrennt von allgemeinen Docker-Diensten
- Automation getrennt von Lab-Systemen
- Lab-Umgebungen isoliert

Diese Trennung reduziert Risiko und vereinfacht Updates, Backups und Fehlersuche.

## Zugriff

Administrative Zugriffe erfolgen gezielt und nicht dauerhaft offen. Für externe Dokumentation werden keine Zugangsdaten oder privaten Schlüssel abgelegt.
