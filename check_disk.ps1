New-Item -Path "C:\Scripts" -ItemType Directory -Force
New-Item -Path "C:\Scripts\Check-Disk.ps1" -ItemType File -Force
@'
# Check-Disk.ps1
Write-Output "Incep verificarea"
Get-Date
Get-PSDrive -PSProvider FileSystem
Write-Output "Verificare terminata"
'@ | Set-Content -Path "C:\Scripts\Check-Disk.ps1"
& "C:\Scripts\Check-Disk.ps1"