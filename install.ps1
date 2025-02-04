#Winget
Write-Host "Installing Winget"
Start-BitsTransfer -Source "https://aka.ms/getwinget" -Destination "winget.msixbundle"
Add-AppxPackage -Path .\winget.msixbundle
Remove-Item -Path .\winget.msixbundle

#Windows Terminal
Write-Host "Installing Windows Terminal"
winget install Microsoft.WindowsTerminal