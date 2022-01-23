Write-Host 'Hello, World!'
Write-Host "Powershell version (PSVersionTable): "$PSVersionTable.PSVersion.Major"."$PSVersionTable.PSVersion.Minor
Write-Host "Powershell version (get-host): "$(get-host).Version
Write-Host "PSVersionTable: " ($PSVersionTable | Out-String)
Write-Host "get-host: " (get-host | Out-String)