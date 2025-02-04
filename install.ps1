#Winget
Write-Host "Installing Winget"
Start-BitsTransfer -Source "https://aka.ms/getwinget" -Destination "winget.msixbundle"
Add-AppxPackage -Path .\winget.msixbundle
Remove-Item -Path .\winget.msixbundle

#Windows Terminal
Write-Host "Installing Windows Terminal"
winget install Microsoft.WindowsTerminal

#Powershell
Write-Host "Installing Powershell latestversion"
winget install --id Microsoft.PowerShell --source winget

#Oh My Posh
Write-Host "Installing Oh My Posh"
winget install JanDeDobbeleer.OhMyPosh -s winget