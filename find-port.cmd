@echo off

set port=%1

netstat -a -n -o | find "%port%"