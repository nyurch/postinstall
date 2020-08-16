@echo off
cls
color FC
cd %~dp0
net session >nul 2>&1
if %errorLevel% == 0 (powershell -executionpolicy RemoteSigned -file choco.ps1) else (echo "Run as Administrator please...")
pause
