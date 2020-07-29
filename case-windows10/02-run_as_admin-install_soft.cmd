@echo on
::copy zenity.exe %windir%\system32
powershell -executionpolicy RemoteSigned -file %~dp0%\choco.ps1