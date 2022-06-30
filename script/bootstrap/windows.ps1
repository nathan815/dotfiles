$dotfilesRepo = (Get-Item $PSScriptRoot).Parent.Parent.FullName

# Install Chocolately package manager
Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Set-ExecutionPolicy RemoteSigned -Scope Process -Force;

# Install Chocolately packages
choco install -y git gh sudo cygwin make sudo docker docker-desktop azure-cli -y

# PS Modules
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module PowerBash
Install-Module posh-git
Install-Module -Name PSReadLine -AllowPrerelease


# Profile
if (! (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

if (!(Get-Content $PROFILE -Raw).contains("oh-my-posh init")) {
    $ompTheme = Join-Path -Path $dotfilesRepo -ChildPath "oh-my-posh/amro.omp.json"
    Add-Content -Path $PROFILE -Value "oh-my-posh init pwsh --config $ompTheme | Invoke-Expression"
}
