@echo off
title Interactive Desktop for SYSTEM
if /i "%CD%" == "%WinDir%\system32" goto TheQuestion
echo Please run this program in Administrator.
pause
exit

:TheQuestion
echo To start, type "1".
echo To stop, type "2".
CHOICE /c:12 /n /m Choice:
if errorlevel 2 goto Stop
if errorlevel 1 goto Start

:Start
cls
echo Starting Interactive Desktop Service
sc start UI0Detect
cls
echo Creating Service
sc create testsvc binpath= "cmd /K start" type= own type= interact
cls
echo Starting CMD in SYSTEM Account
sc start testsvc
cls
echo Deleting Service
sc delete testsvc
cls
echo Starting Interactive Desktop
rundll32 winsta.dll,WinStationSwitchToServicesSession
cls
goto TheQuestion

:Stop 
cls
echo Stopping Interactive Desktop Service
sc stop UI0Detect
cls
goto TheQuestion

:NOTAdmin
title Error
echo Please run this program in Administrator.
pause
exit