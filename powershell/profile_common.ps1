oh-my-posh init pwsh --config ~/dotfiles/oh-my-posh/amro.omp.json | Invoke-Expression

Set-PSReadlineKeyHandler -Key Tab -Function Complete

$gotoFolders = @{
    "dotfiles" = "~/dotfiles"
}

if (Test-Path $PSScriptRoot/profile_common.private.ps1) {
    . $PSScriptRoot/profile_common.private.ps1
}

function goto ($name) {
    foreach ($key in $gotoFolders.Keys) {
        if ($name -match $key) {
            Set-Location $gotoFolders[$key]
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

function Lint-Changed ($branch = 'origin/master', [switch]$check){
    $repoRoot = git rev-parse --show-toplevel
    $branchDiff = "${branch}..HEAD"
    $files =
        git diff --name-status $branchDiff | Where-Object { ($_.StartsWith("A") -or $_.StartsWith("M")) ` -and $_.EndsWith(".fs") } | ForEach-Object { $repoRoot + "/" + $_.substring(2) }
    Write-Host "Files changed between $branchDiff :"
    Write-Host ($files -join "`n")
    if ($check) {
        Write-Host "Checking $branchDiff (will not write)..."
        dotnet fantomas --check $files
    } else {
        Write-Host "Formatting $branchDiff..."
        dotnet fantomas $files
    }
    Write-Host $branchDiff
}
