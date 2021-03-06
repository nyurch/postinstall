@echo off
cls
color FC
net session >nul 2>&1
if %errorLevel% == 0 (powershell -executionpolicy RemoteSigned -file %~dp0\choco.ps1) else (echo "Run as Administrator please...")
pause
