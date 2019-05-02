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

function NpmCheck { npx npm-check }
CreateAlias "npmc" NpmCheckUpdate
function NpmCheckUpdate { npx npm-check --update --skip-unused }
CreateAlias "npmcup" NpmCheckUpdate
#endregion


#region git
CreateAlias "g" git "Alias for git, type 'g alias' for a list of git aliases"
git config --global alias.alias "config --get-regexp ^alias\."



git config --global alias.psh 'push'
function GitPush { git push $args }
CreateAlias "gpsh" GitPush


git config --global alias.pshf 'push --force'
function GitPushForce { git push --force $args }
CreateAlias "gpshf" GitPushForce


git config --global alias.pub 'push -u (git remote) (git rev-parse --abbrev-ref HEAD)'
function GitPublish { git push -u (git remote) (git rev-parse --abbrev-ref HEAD) }
CreateAlias "gpub" GitPublish


git config --global alias.pl 'pull'
function GitPull { git pull $args }
CreateAlias "gpl" GitPull


git config --global alias.plr 'pull --rebase'
function GitPullRebase { git pull --rebase $args }
CreateAlias "gplr" GitPullRebase


git config --global alias.co 'checkout'
function GitCheckout { git checkout $args }
CreateAlias "gco" GitCheckout


git config --global alias.cot 'checkout -t'
function GitCheckoutTrack { git checkout -t $args }
CreateAlias "gcot" GitCheckoutTrack "Git: Checkout and track remote branch`n
Example: gcot origin/feature/abc"


git config --global alias.cob 'checkout -b'
function GitCheckoutBranch { git checkout -b $args }
CreateAlias "gcob" GitCheckoutBranch "Git: Create branch and checkout`n
Example: gcob feature/abc"


git config --global alias.gbd '!f() { git branch -D $1; git push (git remote) --delete $1; }; f'
function GitBranchDelete { git branch -D $args[0]; git push (git remote) --delete $args[0] }
CreateAlias "gbd" GitBranchDelete "Git: Delete local and remote branch`n
Example: gbd test-branch"


git config --global alias.ffs 'flow feature start -F'
function GitFlowFeatureStart {
    git flow feature start -F $args
}
CreateAlias "gffs" GitFlowFeatureStart


git config --global alias.ffp 'flow feature publish'
function GitFlowFeaturePublish {
    git flow feature publish $args
}
CreateAlias "gffp" GitFlowFeaturePublish


git config --global alias.fbs 'flow bugfix start -F'
function GitFlowBugfixStart {
    git flow bugfix start -F $args
}
CreateAlias "gfbs" GitFlowBugfixStart


git config --global alias.fbp 'flow bugfix publish'
function GitFlowBugfixPublish {
    git flow bugfix publish $args
}
CreateAlias "gfbp" GitFlowBugfixPublish


git config --global alias.fhs 'flow hotfix start -F'
function GitFlowHotfixStart {
    git flow hotfix start -F $args
}
CreateAlias "gfhs" GitFlowHotfixStart


git config --global alias.fhp 'flow hotfix publish'
function GitFlowHotfixPublish {
    git flow hotfix publish $args
}
CreateAlias "gfhp" GitFlowHotfixPublish


git config --global alias.fhf 'flow hotfix finish -F -p -m "Release"'
function GitFlowHotfixFinish {
    git flow hotfix finish -F -p -m "Release" $args
}
CreateAlias "gfhf" GitFlowHotfixFinish


git config --global alias.frs 'flow release start -F'
function GitFlowReleaseStart {
    git flow release start -F $args
}
CreateAlias "gfrs" GitFlowReleaseStart


git config --global alias.frp 'flow release publish'
function GitFlowReleasePublish {
    git flow release publish $args
}
CreateAlias "gfrp" GitFlowReleasePublish


git config --global alias.frf 'flow release finish -F -p -m "Release"'
function GitFlowReleaseFinish {
    git flow release finish -F -p -m "Release" $args
}
CreateAlias "gfrf" GitFlowReleaseFinish


git config --global alias.dc '!git reset --hard; git clean -fd'
function GitDiscard { git reset --hard; git clean -fd }
CreateAlias "gdc" GitDiscard


git config --global alias.cl 'clean -xfd'
function GitClean { git clean -xfd }
CreateAlias "gcl" GitClean "Git: Remove untracked files, including ignored ones"


git config --global alias.cl 'check-ignore -v'
function GitCheckIgnoreVerbose { git check-ignore -v $args }
CreateAlias "gciv" GitCheckIgnoredVerbose "Git: Show ignore reason, including matching pattern"


git config --global alias.hsh 'rev-parse --short HEAD'
function GitHash { git rev-parse --short HEAD }
CreateAlias "ghsh" GitHash


git config --global alias.ss 'stash save --keep-index --include-untracked "remove-unstaged"'
function GitStashStaged { git stash save --keep-index --include-untracked "remove-unstaged" }
CreateAlias "gss" GitStashStaged


git config --global alias.st 'fetch --prune --pruneTags'
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

