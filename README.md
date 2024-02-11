# Zoom Meeting Automatisierungsskript

Dieses PowerShell-Skript ermöglicht die automatisierte Teilnahme an einem Zoom-Meeting, einschließlich der Einstellung von Benutzername und Passcode aus einer Konfigurationsdatei sowie der Anpassung der Fensterposition und -größe des Zoom-Meetings.

## Voraussetzungen

- PowerShell 5.1 oder höher
- Zoom Desktop-Client installiert
- Windows-Betriebssystem

## Konfiguration

Bevor Sie das Skript ausführen, müssen Sie eine Konfigurationsdatei namens `config.json` im selben Verzeichnis wie das Skript erstellen. Die Datei sollte folgende Struktur haben:

```json
{
  "userData": {
    "MEETING_ID": "123456789",
    "USER_NAME": "Ihr Name",
    "PASSCODE": "Meeting-Passwort"
  },
  "zoomProcessFound": true,
  "windowPosition": {
    "x": 0,
    "y": 0,
    "width": 800,
    "height": 600
  }
}
```
## Lizenz

Dieses Projekt ist unter der MIT Lizenz lizenziert - siehe die LICENSE Datei für Details.
