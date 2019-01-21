#region Files
function RemoveRecurseForce { Remove-Item -Recurse -Force $args }
Set-Alias -Name rmrf -Value RemoveRecurseForce
#endregion


#region git
function GitCheckoutTrack { git checkout -t $args }
Set-Alias -Name gct -Value GitCheckoutTrack

function GitDiscard { git reset --hard; git clean -fd }
Set-Alias -Name gdc -Value GitDiscard

function GitClean { git clean -xfd }

function GitHash { git rev-parse --short HEAD }

function GitStashStaged { git stash save --keep-index --include-untracked "remove-unstaged" }
#endregion


#region Docker
function DockerCompose { docker-compose $args }
Set-Alias -Name dc -Value DockerCompose

function DockerComposeLinux { $env:COMPOSE_CONVERT_WINDOWS_PATHS=1; docker-compose $args }
Set-Alias -Name dcl -Value DockerCompose

function DockerComposeWindows { $env:COMPOSE_CONVERT_WINDOWS_PATHS=0; docker-compose $args }
Set-Alias -Name dcw -Value DockerCompose
#endregion

#region Network
function FlushDns { ipconfig /flushdns }
Set-Alias -Name fldns -Value FlushDns
#endregion


#region Display
function FixStuckWindow { Start-Process "tskill dwm" }
#endregion


#region Util
# Replacement for &&
# Usage:
# command1; aa command2
function aa() {
    if($?) {
        $command = [string]::join(' ', $args[1..99])
        & $args[0] $command
    }
}

function ReloadPath { $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") }
Set-Alias -Name relpath -Value ReloadPath

function TimeCommand { Measure-Command { $args } }
Set-Alias -Name time -Value TimeCommand

function UpdateTime { W32tm /resync /force }
Set-Alias -Name uptm -Value UpdateTime
#endregion

