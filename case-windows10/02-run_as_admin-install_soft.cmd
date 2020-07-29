@echo on
::copy zenity.exe %windir%\system32
cd %~dp0%
powershell -executionpolicy RemoteSigned -file choco.ps1
