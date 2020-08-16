@echo off
cls
color FC
cd %~dp0
mkdir sources
::Internet
chocolatestore sources http://chocolatey.org/api/v2/package/anydesk.install
chocolatestore sources http://chocolatey.org/api/v2/package/dropbox
chocolatestore sources http://chocolatey.org/api/v2/package/firefox
chocolatestore sources http://chocolatey.org/api/v2/package/google-backup-and-sync
chocolatestore sources http://chocolatey.org/api/v2/package/googlechrome
chocolatestore sources http://chocolatey.org/api/v2/package/microsoft-edge
chocolatestore sources http://chocolatey.org/api/v2/package/microsoft-teams.install
chocolatestore sources http://chocolatey.org/api/v2/package/pidgin
chocolatestore sources http://chocolatey.org/api/v2/package/telegram
chocolatestore sources http://chocolatey.org/api/v2/package/tightvnc
chocolatestore sources http://chocolatey.org/api/v2/package/vivaldi
chocolatestore sources http://chocolatey.org/api/v2/package/vmware-horizon-client
::Office
chocolatestore sources http://chocolatey.org/api/v2/package/7zip.install
chocolatestore sources http://chocolatey.org/api/v2/package/adobereader
chocolatestore sources http://chocolatey.org/api/v2/package/calibre
chocolatestore sources http://chocolatey.org/api/v2/package/doublecmd
chocolatestore sources http://chocolatey.org/api/v2/package/far
chocolatestore sources http://chocolatey.org/api/v2/package/greenshot
chocolatestore sources http://chocolatey.org/api/v2/package/libreoffice-fresh
chocolatestore sources http://chocolatey.org/api/v2/package/notepadplusplus
chocolatestore sources http://chocolatey.org/api/v2/package/office365business
chocolatestore sources http://chocolatey.org/api/v2/package/phonerlite
chocolatestore sources http://chocolatey.org/api/v2/package/powerbi
chocolatestore sources http://chocolatey.org/api/v2/package/xmind
::Multimedia
chocolatestore sources http://chocolatey.org/api/v2/package/acestream
chocolatestore sources http://chocolatey.org/api/v2/package/fsviewer
chocolatestore sources http://chocolatey.org/api/v2/package/gimp
chocolatestore sources http://chocolatey.org/api/v2/package/musicbee
chocolatestore sources http://chocolatey.org/api/v2/package/paint.net
chocolatestore sources http://chocolatey.org/api/v2/package/smplayer
chocolatestore sources http://chocolatey.org/api/v2/package/spotify
chocolatestore sources http://chocolatey.org/api/v2/package/vlc
::Drivers
chocolatestore sources http://chocolatey.org/api/v2/package/amd-ryzen-chipset
::Tools
chocolatestore sources http://chocolatey.org/api/v2/package/ccleaner
chocolatestore sources http://chocolatey.org/api/v2/package/cheatengine
chocolatestore sources http://chocolatey.org/api/v2/package/innosetup
chocolatestore sources http://chocolatey.org/api/v2/package/nagstamon
chocolatestore sources http://chocolatey.org/api/v2/package/powertoys
chocolatestore sources http://chocolatey.org/api/v2/package/rufus
chocolatestore sources http://chocolatey.org/api/v2/package/smartgit
chocolatestore sources http://chocolatey.org/api/v2/package/steam
chocolatestore sources http://chocolatey.org/api/v2/package/stellarium
chocolatestore sources http://chocolatey.org/api/v2/package/sysinternals
chocolatestore sources http://chocolatey.org/api/v2/package/victoria
chocolatestore sources http://chocolatey.org/api/v2/package/virtualbox
chocolatestore sources http://chocolatey.org/api/v2/package/linux-reader

::firefox, doublecmd, smartgit та amd-ryzen-chipset не скачуються.
