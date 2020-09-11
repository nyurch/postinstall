$Title = "Killall"
$Info = "Kill process"
Clear-Host
#$process = Get-Process -Name 7zFM
$process = Read-Host "Please make a selection"
Write-Host ""
Write-Host "Try to kill $process ....." -BackgroundColor Green
try {
    Stop-Process -Name $process -ErrorAction Stop
    Write-Host "$process killed" -BackgroundColor Green
    Write-Host ""
} catch {
    Write-Host ""
	Write-Host "The $process process was not started." -BackgroundColor DarkRed
	Write-Host ""
}

pause