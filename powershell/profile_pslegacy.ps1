. $PSScriptRoot/profile_common.ps1

if (Test-Path $PSScriptRoot/profile_pslegacy.private.ps1) {
    . $PSScriptRoot/profile_pslegacy.private.ps1
}
