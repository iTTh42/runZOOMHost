Write-Host "Lese die Konfiguration aus der Datei: $configPath"
$configPath = ".\config.json"

$configJson = Get-Content $configPath | ConvertFrom-Json

$MEETING_ID = $configJson.userData.MEETING_ID
$USER_NAME = $configJson.userData.USER_NAME
$PASSCODE = $configJson.userData.PASSCODE
$zoomProcessFoundFromConfig = $configJson.zoomProcessFound -as [bool]

$x = $configJson.windowPosition.x
$y = $configJson.windowPosition.y
$width = $configJson.windowPosition.width
$height = $configJson.windowPosition.height

$ENCODED_USER_NAME = $USER_NAME -replace ' ', '%20'

Write-Host "Starte Zoom-Meeting mit Meeting-ID: $MEETING_ID und Benutzername: $USER_NAME"
Start-Process "zoommtg://zoom.us/join?confno=$MEETING_ID&uname=$ENCODED_USER_NAME&pwd=$PASSCODE"
Write-Host "Zoom wird gestartet"

Start-Sleep -Seconds 2

Write-Host "Warte auf Verbindung"
do {
    Start-Sleep -Seconds 1
    $zoomProcesses = Get-Process | Where-Object { $_.MainWindowTitle -like "*Zoom Meeting*" }
} while (-not $zoomProcesses)

Write-Host "Verbindung wird hergestellt"
Add-Type @"
  using System;
  using System.Runtime.InteropServices;
  public static class NativeMethods {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
  }
"@

Write-Host "Suche nach dem Zoom-Meeting-Fenster..."
$zoomProcessFound = $false
if ($zoomProcessFoundFromConfig) {
    do {
        Start-Sleep -Seconds 1
        $zoomProcesses = Get-Process | Where-Object { $_.MainWindowTitle -like "*Zoom Meeting*" }
        foreach ($proc in $zoomProcesses) {
            if ($proc.MainWindowHandle -ne 0 -and $proc.TotalProcessorTime.TotalSeconds -gt 4.0) {
                Write-Host "Zoom-Meeting-Fenster gefunden. Bereite vor für die Anpassung."
                $zoomProcessFound = $true
                break
            }
        }
    } while (-not $zoomProcessFound)
}

# Sicherstellen, dass die erforderlichen Typen für die SendKeys Methode hinzugefügt werden
Add-Type -AssemblyName System.Windows.Forms

# Eine kurze Verzögerung, um sicherzustellen, dass das Zoom-Fenster den Fokus hat
Start-Sleep -Seconds 1

if ($zoomProcessFound) {
    Write-Host "Sende Alt+U Tastenkombination, um die Teilnehmerliste zu öffnen."
    [System.Windows.Forms.SendKeys]::SendWait("%u")

    # Warten Sie einen Moment, bevor Sie die Größe und Position anpassen, um sicherzustellen, dass die Tastenkombination wirkt
    Start-Sleep -Seconds 2

    Write-Host "Passe Größe und Position des Zoom-Meeting-Fensters an..."
    if ($proc.MainWindowHandle -ne 0) {
        [NativeMethods]::MoveWindow($proc.MainWindowHandle, $x, $y, $width, $height, $true)
        Write-Host "Größe und Position des Zoom-Meeting-Fensters angepasst. X: $x, Y: $y, Breite: $width, Höhe: $height"
    } else {
        Write-Host "Konnte das Zoom-Meeting-Fenster für die Anpassung nicht finden."
    }
}

Write-Host "Skript abgeschlossen."
