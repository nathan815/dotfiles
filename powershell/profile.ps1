oh-my-posh init pwsh --config ~/dotfiles/oh-my-posh/amro.omp.json | Invoke-Expression

# try { Import-Module PowerBash -DisableNameChecking } catch {}
Import-Module posh-git

Set-PSReadlineKeyHandler -Key Tab -Function Complete

$repos = @{
    "dotfiles" = "~/dotfiles"
}

if (Test-Path ~/PowerShellProfile.private.ps1) {
    . ~/PowerShellProfile.private.ps1
}

function goto ($name) {
    foreach ($key in $repos.Keys) {
        if ($name -match $key) {
            Set-Location $repos[$key]
            return
        }
    }
    Set-Location C:\projects\$name
}

function sourceenv ($file) {
    # source a .sh file with export statements as powershell env vars
    foreach ($line in Get-Content $file) {
        if ($line -like "export*") {
            $keyval = $line.split(" ")[1] -split '=',2
            $key = $keyval[0]
            $val = $keyval[1].Trim("'")
            Write-Host "Setting `$env:$key = $val"
            Set-Item "env:$key" $val
        }
    }
}
