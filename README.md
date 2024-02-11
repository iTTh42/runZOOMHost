# runZOOM

# Automatische Zoom-Teilnahme

Dieses Skript ermöglicht die automatische Teilnahme an Zoom-Meetings mit Hilfe einer Konfigurationsdatei (`config.json`), in der Meeting-ID, Benutzername und Passcode gespeichert sind.

## Voraussetzungen

- PowerShell muss auf dem System installiert sein.
- Zoom Desktop-Client muss auf dem System installiert sein.

## Konfigurationsdatei

Erstellen Sie eine Datei namens `config.json` im selben Verzeichnis wie das Skript und fügen Sie die Meeting-Informationen wie folgt hinzu:

```json
{
    "MEETING_ID": "1234567890",
    "USER_NAME": "Meeting Teilnehner",
    "PASSCODE": "1234"
}
```
## Lizenz

Dieses Projekt ist unter der MIT-Lizenz lizenziert. Weitere Informationen finden Sie in der LICENSE.md-Datei.