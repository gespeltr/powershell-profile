#Winget
Write-Host "Installing Winget"
Invoke-WebRequest -Uri "https://aka.ms/getwingetpreview" -OutFile "winget.msixbundle"
Add-AppxPackage -Path .\winget.msixbundle
Remove-Item -Path .\winget.msixbundle

#Windows Terminal
Write-Host "Installing Windows Terminal"
winget install Microsoft.WindowsTerminal