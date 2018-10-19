
@ECHO off
:top
CLS
ECHO Choose a shell:
ECHO [1] PowerShell Core
ECHO [2] ubuntu
ECHO [3] Node
ECHO [4] PowerShell
ECHO [5] git bash
ECHO.
ECHO [9] exit
ECHO.

CHOICE /N /C:123459 /M "> "
CLS
IF ERRORLEVEL ==9 GOTO end
IF ERRORLEVEL ==5 "C:\Program Files\Git\git-cmd.exe" --command=usr/bin/bash.exe -l -i
IF ERRORLEVEL ==4 powershell
IF ERRORLEVEL ==3 node
IF ERRORLEVEL ==2 ubuntu
IF ERRORLEVEL ==1 pwsh

CLS
ECHO Switch or exit?
ECHO [1] Switch
ECHO [2] Exit

CHOICE /N /C:12 /D 2 /T 5 /M "> "
IF ERRORLEVEL ==2 GOTO end
IF ERRORLEVEL ==1 GOTO top

:end
