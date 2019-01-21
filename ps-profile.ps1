Import-Module oh-my-posh
Import-Module posh-docker
Import-Module posh-git
Import-Module z
Import-Module $PSScriptRoot\aliases.ps1
Set-Theme Avit

$env:PYTHONIOENCODING="utf-8"
Invoke-Expression "$(powershell -c thefuck --alias)"

