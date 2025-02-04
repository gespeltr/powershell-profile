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

#Set PATH
Write-Host "Set Oh My Posh PATH"
$env:Path += ";C:\Users\user\AppData\Local\Programs\oh-my-posh\bin"

#Oh My Posh Fonts
Write-Host "Installing CascadiaCode font"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") #Reload path
oh-my-posh font install CascadiaCode