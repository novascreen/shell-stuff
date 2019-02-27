@echo off

set action=%1

:choose
if "%action%" == "start" goto start
if "%action%" == "stop" goto stop
if "%chosen%" == "true" goto fail

echo.
echo Run 'iis-svc start' or 'iis-svc stop' to skip this step
echo.
echo  [1] start
echo  [2] stop
echo.
set /p choice=Choose action:

if "%choice%" == "1" set action=start
if "%choice%" == "2" set action=stop

set chosen=true
goto choose


:start
net start W3SVC
net start MsDepSvc
net start ReportServer$SQL2016
net start MSSQL$SQL2016
goto end

:stop
net stop W3SVC
net stop MsDepSvc
net stop ReportServer$SQL2016
net stop MSSQL$SQL2016
goto end

:fail
echo Invalid choice

:end
