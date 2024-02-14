# Zoom Meeting Automatisierungsskript

Dieses PowerShell-Skript ermöglicht die automatisierte Teilnahme an einem Zoom-Meeting, einschließlich der Einstellung von Benutzername und Passcode aus einer Konfigurationsdatei sowie der Anpassung der Fensterposition und -größe des Zoom-Meetings.

## Voraussetzungen

- PowerShell 5.1 oder höher
- Zoom Desktop-Client installiert
- Windows-Betriebssystem

# Zoom Meeting Automatisierungssetup

Diese Anleitung führt Sie durch die Einrichtung eines Automatisierungsskripts für Zoom Meetings, einschließlich der Vorbereitung Ihres Systems und der Erstellung einer Desktop-Verknüpfung zum einfachen Starten von Meetings.

## Vorbereitung

### Schritt 1: Überprüfen des `C:\opt\` Ordners

Stellen Sie sicher, dass der Ordner `C:\opt\` auf Ihrem Laufwerk C: existiert. Falls dieser Ordner nicht existiert, erstellen Sie ihn manuell über den Datei-Explorer oder die Kommandozeile.

### Schritt 2: Einrichten des `runZOOM-Hosts` Ordners

1. Klonen oder laden Sie den `runZOOMHost` Ordner von GitHub herunter.
2. Entpacken und Kopieren Sie den heruntergeladenen Ordner in `C:\opt\`.

### Schritt 3: Erstellen einer Desktop-Verknüpfung

1. Rechtsklicken Sie auf den Desktop und wählen Sie `Neu` > `Verknüpfung`.
2. Geben Sie den Pfad zum zuvor erstellten VBScript ein.
3. Benennen Sie die Verknüpfung nach Ihrem Wunsch, z.B. `Zoom Meeting Starten`.
4. Schließen Sie den Vorgang ab, indem Sie auf `Fertig stellen` klicken.

Sie haben nun eine Verknüpfung auf Ihrem Desktop, die das Zoom Meeting mit dem von Ihnen spezifizierten Benutzernamen und Passcode startet, ohne eine sichtbare Konsole zu öffnen.

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
## Wichtige Hinweise

- Stellen Sie sicher, dass der Zoom Desktop-Client auf Ihrem System installiert ist.
- Überprüfen Sie, ob die Ausführungsrichtlinien auf Ihrem System das Ausführen von Skripten zulassen.
- Speichern Sie alle Skripte und Konfigurationsdateien sicher, um unbefugten Zugriff zu verhindern.

## Lizenz

Dieses Projekt ist unter der MIT Lizenz lizenziert - siehe die LICENSE Datei für Details.
