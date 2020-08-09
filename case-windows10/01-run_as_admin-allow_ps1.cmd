@echo off
cls
color FC
net session >nul 2>&1
if %errorLevel% == 0 (powershell Set-ExecutionPolicy RemoteSigned) else (echo "Run as Administrator please...")
pause
