New-Item -Path "C:\Scripts\Daily-Report.ps1" -ItemType File -Force
@'
$report = "C:\Scripts\DailyReport-$(Get-Date -Format yyyy-MM-dd).txt"

"=== Sistem ===" | Out-File $report
Get-ComputerInfo | Select-Object CsName,WindowsProductName,OsBuildNumber | Out-File $report -Append

"=== Disk ===" | Out-File $report -Append
Get-PSDrive -PSProvider FileSystem | Out-File $report -Append

"=== Servicii critice ===" | Out-File $report -Append
Get-Service Netlogon,DNS,DhcpServer,W3SVC |
  Format-Table Name,Status,StartType | Out-File $report -Append

"=== Ultimele erori ===" | Out-File $report -Append
Get-WinEvent -FilterHashtable @{LogName='System';Level=1,2} -MaxEvents 20 |
  Select-Object TimeCreated,Id,Message | Out-File $report -Append
'@ | Set-Content -Path "C:\Scripts\Daily-Report.ps1"
& "C:\Scripts\Daily-Report.ps1"