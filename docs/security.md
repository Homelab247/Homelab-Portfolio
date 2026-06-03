# Security

## Grundsätze

Dieses Repository ist öffentlich nutzbar und soll für Bewerbungen geeignet sein. Deshalb stehen hier keine Zugangsdaten und keine sensiblen Details aus dem Heimnetz.

## Nicht im Repository

- Passwörter
- API-Keys und Tokens
- Zertifikate und private Schlüssel
- MAC-Adressen
- vollständige private Netzpläne
- interne Zugangsdaten
- private Lab-Daten

## Dokumentationsprinzip

Öffentlich dokumentiert werden Rollen, Konzepte und technische Entscheidungen. Zugangsdaten und konkrete interne Details bleiben lokal.

## Diensttrennung

Dienste sind nach Funktion getrennt:

- Storage getrennt von Monitoring
- Monitoring getrennt von allgemeinen Docker-Diensten
- Automation getrennt von Lab-Systemen
- Lab-Umgebungen isoliert vom Rest

Diese Trennung hilft bei Updates, Fehlersuche und Risikoabschätzung.

## Zugriff

Administrative Zugriffe bleiben intern. Für die öffentliche Dokumentation werden keine privaten Schlüssel, Tokens oder Login-Daten abgelegt.

## Umgang mit Beispieldateien

Konfigurationsbeispiele werden bereinigt und als Referenzdateien abgelegt. Werte wie Domains, Tokens, Passwörter oder konkrete interne Adressen werden entfernt oder anonymisiert.
