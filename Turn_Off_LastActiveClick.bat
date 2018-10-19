@echo off

:: Created by: Shawn Brink
:: Created on: November 14th 2016
:: Tutorial: http://www.tenforums.com/tutorials/69809-taskbar-buttons-last-active-click-turn-off-windows-10-a.html


Reg ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V LastActiveClick /T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe/T REG_DWORD /D 0 /F

taskkill /f /im explorer.exe
start explorer.exe