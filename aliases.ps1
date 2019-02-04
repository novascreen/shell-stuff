#region Alias
function CreateAlias {
    Set-Alias -Name $args[0] -Value $args[1] -Description "#$($args[2])" -Scope Script
}
CreateAlias "ca" CreateAlias

function Alias {
    Get-Alias | Where-Object {$_.Description -Match "^#"} | Select-Object -Property Name, ReferencedCommand, @{Name = 'Description'; Expression = {$_.Description -replace "#",""}}
}
CreateAlias "ali" Alias

function AliasHelp {
    Get-Alias -Name $args[0] | Select-Object -Property ReferencedCommand, @{Name = 'Description'; Expression = {$_.Description -replace "#",""}} | Format-List
}
CreateAlias "alih" AliasHelp
#endregion

#region Files
function RemoveRecurseForce { Remove-Item -Recurse -Force $args }
CreateAlias "rmrf" RemoveRecurseForce
#endregion


#region git
function GitPush { git push $args }
CreateAlias "gpsh" GitPush
function GitPushForce { git push --force $args }
CreateAlias "gpshf" GitPushForce
function GitPull { git pull $args }
CreateAlias "gpl" GitPull
function GitPullRebase { git pull --rebase $args }
CreateAlias "gplr" GitPullRebase
function GitCheckout { git checkout $args }
CreateAlias "gco" GitCheckout
function GitCheckoutTrack { git checkout -t $args }
CreateAlias "gct" GitCheckoutTrack "Git: Checkout and track remote branch`n
Example: gct origin/feature/abc"
function GitBranchCheckout { git checkout -b $args }
CreateAlias "gbc" GitBranchCheckout "Git: Create branch and checkout`n
Example: gbc feature/abc"

function GitFlowFeatureStart {
    git flow feature start -F $args
}
CreateAlias "gffs" GitFlowFeatureStart

function GitFlowFeaturePublish {
    git flow feature publish -F $args
}
CreateAlias "gffs" GitFlowFeaturePublish

function GitFlowBugfixStart {
    git flow bugfix start -F $args
}
CreateAlias "gfbs" GitFlowBugfixStart

function GitFlowBugfixPublish {
    git flow bugfix publish -F $args
}
CreateAlias "gfbs" GitFlowBugfixPublish

function GitDiscard { git reset --hard; git clean -fd }
CreateAlias "gdc" GitDiscard

function GitClean { git clean -xfd }
CreateAlias "gcl" GitClean "Git: Remove untracked files, including ignored ones"

function GitCheckIgnoreVerbose { git check-ignore -v $args }
CreateAlias "gciv" GitCheckIgnoredVerbose "Git: Show ignore reason, including matching pattern"

function GitHash { git rev-parse --short HEAD }
CreateAlias "ghsh" GitHash

function GitStashStaged { git stash save --keep-index --include-untracked "remove-unstaged" }
CreateAlias "gss" GitStashStaged

function GitSyncTags { git fetch --prune --pruneTags }
CreateAlias "gst" GitSyncTags "Git: Sync tags with remote"
#endregion

#region Docker
function DockerCompose { docker-compose $args }
CreateAlias "dc" DockerCompose

function DockerComposeLinux { $env:COMPOSE_CONVERT_WINDOWS_PATHS=1; docker-compose $args }
CreateAlias "dcl" DockerCompose

function DockerComposeWindows { $env:COMPOSE_CONVERT_WINDOWS_PATHS=0; docker-compose $args }
CreateAlias "dcw" DockerCompose
#endregion

#region Network
function FlushDns { ipconfig /flushdns }
CreateAlias "fldns" FlushDns
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
CreateAlias "relpath" ReloadPath

function TimeCommand { Measure-Command { $args } }
CreateAlias "time" TimeCommand

function UpdateTime { W32tm /resync /force }
CreateAlias "uptm" UpdateTime
#endregion

