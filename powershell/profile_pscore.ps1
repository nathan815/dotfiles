# try { Import-Module PowerBash -DisableNameChecking } catch {}
Import-Module posh-git

. $PSScriptRoot/profile_common.ps1


if (Test-Path $PSScriptRoot/profile_pscore.private.ps1) {
    . $PSScriptRoot/profile_pscore.private.ps1
}
