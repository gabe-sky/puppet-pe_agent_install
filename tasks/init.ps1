[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile("https://${env:PT_server}:8140/packages/current/install.ps1", 'C:\Windows\Temp\install.ps1')
C:\Windows\Temp\install.ps1
