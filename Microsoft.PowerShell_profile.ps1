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

function docs { 
    $docs = if(([Environment]::GetFolderPath("MyDocuments"))) {([Environment]::GetFolderPath("MyDocuments"))} else {$HOME + "\Documents"}
    Set-Location -Path $docs
}

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\pure.omp.json" --print) -join "`n"))
Import-Module Terminal-Icons