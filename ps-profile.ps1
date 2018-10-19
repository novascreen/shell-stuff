Import-Module oh-my-posh
Import-Module posh-docker
Import-Module posh-git
Import-Module z
Set-Theme Avit

# Replacement for &&
# Usage:
# command1; aa command2
function aa() {
    if($?) {
        $command = [string]::join(' ', $args[1..99])
        & $args[0] $command
    }
}

$env:PYTHONIOENCODING="utf-8"
Invoke-Expression "$(powershell -c thefuck --alias)"
