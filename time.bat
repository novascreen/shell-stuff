@echo off
powershell -Command "& { Measure-Command { %* | Out-Host } }";