Write-Host "Setup vLAN"
Write-Host "Enter IP-address:"
$ip = Read-Host
Write-Host "Enter default gateway:"
$gateway = Read-Host
Write-Host "Enter subnet mask(in bit format):"
$subnet = Read-Host
#Write-Host "Enter DNS-servers(in ip1,ip2,...,ipN format):"
#$dns = Read-Host



$ipParams = @{
IPAddress = "$ip"
DefaultGateway = "$gateway"
PrefixLength = $subnet
}
Set-NetIPAddress @ipParams
pause
