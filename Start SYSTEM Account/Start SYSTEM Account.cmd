@echo off
setlocal
title Interactive Desktop for SYSTEM
:: Checks if running on Administrator.
if /i not "%CD%" == "%WinDir%\system32" goto NOTAdmin
set "lines=echo -------------------"

:TheQuestion
cls
echo To start, press "1".
echo To stop, press "2".
choice /c:12 /n /m Choice:
if errorlevel 2 goto Stop
if errorlevel 1 goto Start

:Start
cls
echo Starting Interactive Desktop Service
%lines%
sc start UI0Detect
%lines%
echo Creating Service
%lines%
sc create testsvc binpath= "cmd /K start" type= own type= interact
%lines%
echo Starting CMD in SYSTEM Account
sc start testsvc > nul
%lines%
echo Deleting Service
%lines%
sc delete testsvc
%lines%
echo Starting Interactive Desktop
rundll32 winsta.dll,WinStationSwitchToServicesSession
%lines%
echo Started
pause
goto TheQuestion

:Stop 
cls
echo Stopping Interactive Desktop Service
%lines%
sc stop UI0Detect
%lines%
echo Stopped
pause
goto TheQuestion

:NOTAdmin
title Error
echo Please run this program in Administrator.
pause
exit