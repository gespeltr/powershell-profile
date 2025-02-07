function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }

function sysinfo { Get-ComputerInfo }

function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function dev { 
    $location = $HOME + "\Documents\dev"
    Set-Location -Path $location
}

#Github
function gs { git status }
function ga { git add "$args" }
function gc { param($m) git commit -m "$m" }
function gp { git push }
function gl { git pull }
Remove-Alias -Force -Name gc
Remove-Alias -Force -Name gp
Remove-Alias -Force -Name gl

#Brave
function b {& 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Brave.lnk' $pwd}

& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\pure.omp.json" --print) -join "`n"))
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
