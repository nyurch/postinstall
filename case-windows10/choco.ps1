$Title = "Welcome"
$Info = "Install choco and other software"

function Show-Menu {
    param (
        [string]$Title = 'Main Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"

    Write-Host "1: Install choco."
    Write-Host "2: Install software."
    Write-Host "3: Check software update."
    Write-Host "4: Update software."
    Write-Host "5: Uninstall software."
    Write-Host "6: Disable hibernation."
    Write-Host "7: Interface tweaks."
    Write-Host "Q: Quit."

    Write-Host "==========================================="
}

do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    pause
    exit
    } '2' {
    choco install $(.\zenity.exe --height=800 --width=800 --list --text="<b>Select the software to install:</b>" \ --checklist --multiple --hide-column=2 --column "Check" --column "Software" --separator=";" --column "Name" --column "Discription" `
    "7zip" "7-Zip" "7-Zip is a file archiver with a high compression ratio" \ `
    "Firefox" "Mozilla Firefox" "Mozilla Firefox" \ `
    "microsoft-edge" "Microsoft Edge" "Microsoft Edge" \ `
    "adobereader" "Adobe Reader" "View, print, sign, and annotate PDF files" \ `
    "googlechrome" "Google Chrome" "Google Chrome" \ `
    "vlc" "VLC media player" "VLC Media Player" \ `
    "ccleaner" "CCleaner" "The number-one tool for cleaning your Windows PC" \ `
    "libreoffice-fresh" "Libre Office" "Free power-packed Open Source personal productivity suite" \ `
    "far" "FAR Manager" "File and ARchive Manager" \ `
    "notepadplusplus" "Notepad++" "Notepad++ is a free source code editor" \ `
    "gimp" "GIMP" "GNU Image Manipulation Program" \ `
	"vivaldi" "Vivaldi" "Vivaldi" \ `
	"paint.net" "Paint.net" "Image and photo manipulation software" \ `
	"greenshot" "GreenShot" "Light-weight screenshot software tool" \ `
	"anydesk.install" "Anydesk" "Remote desktop software" \ `
	"office365business" "Office 365" "Office 365 Business" \ `
	"powertoys" "PowerToys" "Windows system utilities to maximize productivity" \ `
	"sysinternals" "Sysinternals Suite" "Troubleshooting Utilities have been rolled up into a single suite of tools." \ `
	"pidgin" "Pidgin" "Chat program which lets you log into accounts on multiple chat networks simultaneously" \ `
	"telegram" "Telegram" "Cloud-based synchronized messaging app with a focus on speed and security" \ `
	"spotify" "Spotify" "Spotify is a new way to listen to music" \ `
	"musicbee" "MusicBee" "MusicBee makes it easy to organize, find and play music files" \ `
	"dropbox" "Dropbox" "Free service that lets you bring all your photos, docs, and videos anywhere" \ `
	"google-backup-and-sync" "Google Backup and Sync" "Access files on your computer from anywhere" \ `
	"virtualbox" "Virtualbox" "General-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use" \ `
	"smplayer" "SMPlayer" "Free media player" \ `
	"acestream" "Ace Stream" "Innovative media platform of a new generation" \ `
	"cheatengine" "Cheat Engine" "Open source tool designed to help you modify single player games" \ `
	"fsviewer" "FastStone Image Viewer" "Fast, stable, user-friendly image browser, converter and editor" \ `
	"steam" "Steam" "Steam Client by Valve Corporation" \ `
	"microsoft-teams.install" "Microsoft Teams" "Helps your team work better together" \ `
	"doublecmd" "Double Commander" "Cross platform open source file manager with two panels side by side") -y
    } '3' {
    choco outdated
    } '4' {
    choco update all
    } '5' {
    choco uninstall $(.\zenity.exe --height=800 --width=800 --list --text="<b>Select the software to install:</b>" \ --checklist --multiple --hide-column=2 --column "Check" --column "Software" --separator=";" --column "Name" --column "Discription" `
    "7zip" "7-Zip" "7-Zip is a file archiver with a high compression ratio" \ `
    "Firefox" "Mozilla Firefox" "Mozilla Firefox" \ `
    "microsoft-edge" "Microsoft Edge" "Microsoft Edge" \ `
    "adobereader" "Adobe Reader" "View, print, sign, and annotate PDF files" \ `
    "googlechrome" "Google Chrome" "Google Chrome" \ `
    "vlc" "VLC media player" "VLC Media Player" \ `
    "ccleaner" "CCleaner" "The number-one tool for cleaning your Windows PC" \ `
    "libreoffice-fresh" "Libre Office" "Free power-packed Open Source personal productivity suite" \ `
    "far" "FAR Manager" "File and ARchive Manager" \ `
    "notepadplusplus" "Notepad++" "Notepad++ is a free source code editor" \ `
    "gimp" "GIMP" "GNU Image Manipulation Program" \ `
	"vivaldi" "Vivaldi" "Vivaldi" \ `
	"paint.net" "Paint.net" "Image and photo manipulation software" \ `
	"greenshot" "GreenShot" "Light-weight screenshot software tool" \ `
	"anydesk.install" "Anydesk" "Remote desktop software" \ `
	"office365business" "Office 365" "Office 365 Business" \ `
	"powertoys" "PowerToys" "Windows system utilities to maximize productivity" \ `
	"sysinternals" "Sysinternals Suite" "Troubleshooting Utilities have been rolled up into a single suite of tools." \ `
	"pidgin" "Pidgin" "Chat program which lets you log into accounts on multiple chat networks simultaneously" \ `
	"telegram" "Telegram" "Cloud-based synchronized messaging app with a focus on speed and security" \ `
	"spotify" "Spotify" "Spotify is a new way to listen to music" \ `
	"musicbee" "MusicBee" "MusicBee makes it easy to organize, find and play music files" \ `
	"dropbox" "Dropbox" "Free service that lets you bring all your photos, docs, and videos anywhere" \ `
	"google-backup-and-sync" "Google Backup and Sync" "Access files on your computer from anywhere" \ `
	"virtualbox" "Virtualbox" "General-purpose full virtualizer for x86 hardware, targeted at server, desktop and embedded use" \ `
	"smplayer" "SMPlayer" "Free media player" \ `
	"acestream" "Ace Stream" "Innovative media platform of a new generation" \ `
	"cheatengine" "Cheat Engine" "Open source tool designed to help you modify single player games" \ `
	"fsviewer" "FastStone Image Viewer" "Fast, stable, user-friendly image browser, converter and editor" \ `
	"steam" "Steam" "Steam Client by Valve Corporation" \ `
	"microsoft-teams.install" "Microsoft Teams" "Helps your team work better together" \ `
	"doublecmd" "Double Commander" "Cross platform open source file manager with two panels side by side") -y
    } '6' {
    powercfg -h off
    } '7' {
    reg import first_run.reg
	cmd /c del /f /q %systemdrive%\users\%username%\desktop\"Microsoft Edge.lnk"
    }
    }
    pause
 }
 until ($selection -eq 'q')
