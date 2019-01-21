@echo off

REM Time in seconds
set time=%1

powercfg.exe /SETACVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK %time%
powercfg.exe /SETACTIVE SCHEME_CURRENT