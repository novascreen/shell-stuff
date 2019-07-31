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

#region Node
function NpmRun { npm run $args }
CreateAlias "npmr" NpmRun

function NpmCheck { npx npm-check $args }
CreateAlias "npmc" NpmCheck

function NpmCheckUpdate { npx npm-check -u $args }
CreateAlias "npmcup" NpmCheckUpdate
#endregion


#region git
CreateAlias "g" git "Alias for git, type 'g alias' for a list of git aliases"


function GitPush { git push $args }
CreateAlias "gpsh" GitPush


function GitPushForce { git push --force $args }
CreateAlias "gpshf" GitPushForce


function GitPublish { git push -u (git remote) (git rev-parse --abbrev-ref HEAD) }
CreateAlias "gpub" GitPublish


function GitPull { git pull $args }
CreateAlias "gpl" GitPull


function GitPullRebase { git pull --rebase $args }
CreateAlias "gplr" GitPullRebase


function GitCheckout { git checkout $args }
CreateAlias "gco" GitCheckout


function GitCheckoutTrack { git checkout -t $args }
CreateAlias "gcot" GitCheckoutTrack "Git: Checkout and track remote branch`n
Example: gcot origin/feature/abc"


function GitCheckoutBranch { git checkout -b $args }
CreateAlias "gcob" GitCheckoutBranch "Git: Create branch and checkout`n
Example: gcob feature/abc"


function GitBranchDelete { git branch -D $args[0]; git push (git remote) --delete $args[0] }
CreateAlias "gbd" GitBranchDelete "Git: Delete local and remote branch`n
Example: gbd test-branch"


function GitFlowFeatureStart {
    git flow feature start -F $args
}
CreateAlias "gffs" GitFlowFeatureStart


function GitFlowFeaturePublish {
    git flow feature publish $args
}
CreateAlias "gffp" GitFlowFeaturePublish


function GitFlowBugfixStart {
    git flow bugfix start -F $args
}
CreateAlias "gfbs" GitFlowBugfixStart


function GitFlowBugfixPublish {
    git flow bugfix publish $args
}
CreateAlias "gfbp" GitFlowBugfixPublish


function GitFlowHotfixStart {
    git flow hotfix start -F $args
}
CreateAlias "gfhs" GitFlowHotfixStart


function GitFlowHotfixPublish {
    git flow hotfix publish $args
}
CreateAlias "gfhp" GitFlowHotfixPublish


function GitFlowHotfixFinish {
    git flow hotfix finish -F -p -m "Release" $args
}
CreateAlias "gfhf" GitFlowHotfixFinish


function GitFlowReleaseStart {
    git flow release start -F $args
}
CreateAlias "gfrs" GitFlowReleaseStart


function GitFlowReleasePublish {
    git flow release publish $args
}
CreateAlias "gfrp" GitFlowReleasePublish


function GitFlowReleaseFinish {
    git flow release finish -F -p -m "Release" $args
}
CreateAlias "gfrf" GitFlowReleaseFinish


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
function DockerDesktop { Start-Process -FilePath "C:\Program Files\Docker\Docker\Docker for Windows.exe" }
CreateAlias "dd" DockerDesktop

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

CreateAlias "time" Measure-Command "Example: time { npm ci }"

function UpdateTime { W32tm /resync /force }
CreateAlias "uptm" UpdateTime
#endregion

