@echo off
title Wifi Hotspot
if /i "%CD%" == "%WinDir%\system32" goto TheQuestion
echo Please run this program in Administrator.
pause
exit

:TheQuestion
cls
echo To Setup, press 1
echo To Control, press 2
CHOICE /c:12 /n /m Choice:
if errorlevel 2 goto Control
if errorlevel 1 goto SetupSSID

:SetupSSID
cls
echo Type your Wi-Fi SSID
set SSID=
set /p SSID=SSID:
if NOT defined SSID goto SetupSSID
if defined SSID goto SetupPass

:SetupPass
cls
echo Type your Wi-Fi Password
echo The password should be at least 8-63 character long.
set Password=
set /p Password=Password:
if NOT defined Password goto SetupPass
if defined Password goto SetupApply

:SetupApply
cls
echo Applying
echo Name:%SSID%
echo Password:%Password%
echo Log:
echo -------------------
netsh wlan set hostednetwork ssid=%SSID% key=%Password%
echo -------------------
echo Finished!
pause
goto TheQuestion

:Control
cls
echo To Start, press 1
echo To Stop, press 2
echo To Enable, press 3
echo To Disable, press 4
echo To Show the Settings, press 5
echo To Go Back, press Q
CHOICE /c:12345q /n /m Choice:
if errorlevel 6 goto TheQuestion
if errorlevel 5 goto See
if errorlevel 4 goto Disable
if errorlevel 3 goto Enable
if errorlevel 2 goto Stop
if errorlevel 1 goto Start

:Enable
cls
echo Enabling...
echo -------------------
netsh wlan set hostednetwork mode=allow
echo -------------------
echo Finished!
pause
goto TheQuestion


:Disable
cls
echo Disabling...
echo -------------------
netsh wlan set hostednetwork mode=disallow
echo -------------------
echo Finished!
pause
goto TheQuestion

:Start
cls
echo Starting...
echo -------------------
netsh wlan start hostednetwork
echo -------------------
echo Finished!
pause
goto TheQuestion

:Stop
cls
echo Stopping...
echo -------------------
netsh wlan stop hostednetwork
echo -------------------
echo Finished!
pause
goto TheQuestion

:See
cls
netsh wlan show hostednetwork
echo -------------------
pause
goto TheQuestion