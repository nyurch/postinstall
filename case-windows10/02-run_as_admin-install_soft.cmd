@echo on
cls
color FC
::copy zenity.exe %windir%\system32
cd %~dp0%
powershell -executionpolicy RemoteSigned -file choco.ps1