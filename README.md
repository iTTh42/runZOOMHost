# Zoom Meeting Automatisierungsskript

Dieses PowerShell-Skript ermöglicht die automatisierte Teilnahme an einem Zoom-Meeting, einschließlich der Einstellung von Benutzername und Passcode aus einer Konfigurationsdatei sowie der Anpassung der Fensterposition und -größe des Zoom-Meetings.

## Voraussetzungen

- PowerShell 5.1 oder höher
- Zoom Desktop-Client installiert
- Windows-Betriebssystem

# Zoom Meeting Automatisierungssetup

Diese Anleitung führt Sie durch die Einrichtung eines Automatisierungsskripts für Zoom Meetings, einschließlich der Vorbereitung Ihres Systems und der Erstellung einer Desktop-Verknüpfung zum einfachen Starten von Meetings.

## Vorbereitung

### Schritt 1: Überprüfen des `C:\data\` Ordners

Stellen Sie sicher, dass der Ordner `C:\data\` auf Ihrem Laufwerk C: existiert. Falls dieser Ordner nicht existiert, erstellen Sie ihn manuell über den Datei-Explorer oder die Kommandozeile.

### Schritt 2: Einrichten des `runZOOM-Hosts` Ordners

1. Klonen oder laden Sie den `runZOOM-Hosts` Ordner von GitHub herunter.
2. Kopieren Sie den heruntergeladenen Ordner in `C:\data\`.

## Einrichten der Automatisierung

### Schritt 1: Erstellen eines VBScript

Erstellen Sie ein VBScript, das Ihr PowerShell-Skript (`StartZoomMeeting.ps1`) verdeckt ausführt. Speichern Sie dieses Skript an einem bevorzugten Ort, z.B. auf Ihrem Desktop.

### Schritt 2: Erstellen einer Desktop-Verknüpfung

1. Rechtsklicken Sie auf den Desktop und wählen Sie `Neu` > `Verknüpfung`.
2. Geben Sie den Pfad zum zuvor erstellten VBScript ein.
3. Benennen Sie die Verknüpfung nach Ihrem Wunsch, z.B. `Zoom Meeting Starten`.
4. Schließen Sie den Vorgang ab, indem Sie auf `Fertig stellen` klicken.

Sie haben nun eine Verknüpfung auf Ihrem Desktop, die das Zoom Meeting mit dem von Ihnen spezifizierten Benutzernamen und Passcode startet, ohne eine sichtbare Konsole zu öffnen.

## Wichtige Hinweise

- Stellen Sie sicher, dass der Zoom Desktop-Client auf Ihrem System installiert ist.
- Überprüfen Sie, ob die Ausführungsrichtlinien auf Ihrem System das Ausführen von Skripten zulassen.
- Speichern Sie alle Skripte und Konfigurationsdateien sicher, um unbefugten Zugriff zu verhindern.

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
