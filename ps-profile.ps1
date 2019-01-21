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

function GitCheckoutTrack {git checkout -t $args}
Set-Alias -Name gct -Value GitCheckoutTrack

function GitDiscard {git reset --hard; git clean -fd}
Set-Alias -Name gdc -Value GitDiscard

function RemoveRecurseForce {rm -Recurse -Force $args}
Set-Alias -Name rmrf -Value RemoveRecurseForce

function FlushDns { ipconfig /flushdns }
Set-Alias -Name fldns -Value FlushDns
