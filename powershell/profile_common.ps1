oh-my-posh init pwsh --config ~/dotfiles/oh-my-posh/amro.omp.json | Invoke-Expression

Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -BellStyle None

$gotoFolders = @{
    "dotfiles" = "~/dotfiles"
    "onedrive|od" = "C:\Users\johnsonn\OneDrive - Microsoft\"
}

function vpnroute($action, $ip, $vpn = 'msft') {
    $vpnPatterns = @{
        msft = 'MSFT-AzVPN*'
    }
    $vpnPattern = $vpnPatterns[$vpn]

    $vpnConn = Get-VpnConnection | Where-Object { $_.Name -like $vpnPattern } | Select-Object -First 1
    if ($vpnConn) {
        # Connect to the VPN
        rasdial $vpnConn.Name
    } else {
        Write-Host "Warning: Could not find a VPN connection matching pattern '$vpnPattern'"
    }

    $interface = Get-NetIPAddress | Where-Object { $_.InterfaceAlias -like $vpnPattern -and $_.AddressFamily -eq 'IPv4' }
    $vpnIP = $interface.IPAddress
    Write-Host "VPN $vpn [$($interface.InterfaceAlias)] IP = $vpnIP"
    if (!$vpnIP) {
        throw "Could not find an IP address for VPN matching pattern '$vpnPattern'. Is the VPN connected?"
    }

    switch ($action) {
        'add' {
            route add $ip $vpnIP
        }
        'delete' {
            route delete $ip
        }
        default {
            Write-Host 'Invalid action'
        }
    }
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

function lintfs2 ($branch = 'origin/master', [switch]$check){
    # # Lint F# with Fantomas
    # $repoRoot = git rev-parse --show-toplevel
    # pushd $repoRoot
    # $files = git diff --diff-filter=d --name-only --relative HEAD~1 HEAD 2>&1
    # # $files = $files -split " "

    # $repoRoot = git rev-parse --show-toplevel
    # # $branchDiff = "${branch}..HEAD"
    # # $files =
    # #     git diff --name-status $branchDiff | Where-Object { ($_.StartsWith("A") -or $_.StartsWith("M")) ` -and $_.EndsWith(".fs") } | ForEach-Object { $repoRoot + "/" + $_.substring(2) }
    # Write-Host "Linting files:"
    # Write-Host ($files -join "`n")
    # if ($check) {
    #     Write-Host "Checking $branchDiff (will not write)..."
    #     dotnet fantomas --check $files
    # } else {
    #     Write-Host "Formatting $branchDiff..."
    #     dotnet fantomas $files
    # }
    # Write-Host $branchDiff
    # popd

    # Save current working directory
    $dir = Get-Location

    # Find location of this script
    $ScriptPath = $MyInvocation.MyCommand.Path
    $ScriptDirectory = Split-Path -Parent $ScriptPath

    # Go one level up; this is the .build directory.
    Set-Location (Join-Path $ScriptDirectory "..")

    Write-Host "Working directory is: $(Get-Location)"

    Write-Host "Getting files changed for this PR"
    $files = git diff --diff-filter=d --name-only --relative HEAD~1 HEAD 2>&1
    $my_array = $files -split " "
    $files_to_format = @()
    Write-Host "*** The following files will be checked for formatting:"
    foreach ($file in $my_array) {
        if ($file -like "*.fs" -and (Test-Path $file -PathType Leaf)) {
            Write-Host $file
            $files_to_format += $file
        }
    }
    Write-Host "*** Formatting the above files"
    if ($files_to_format) {
        dotnet fantomas --check $files_to_format
    }

    # Restore working directory
    Set-Location $dir | Out-Null

}

function lintfs ($branch = 'origin/master', [switch]$check){
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
