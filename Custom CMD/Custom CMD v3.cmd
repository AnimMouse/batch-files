@echo off
setlocal enabledelayedexpansion
title Command Prompt
set version=1.2
goto start

:help
%lines%
echo For list of directories, type "directory"
echo To enable/disable return code, type "debug"
echo For list of colors, type "colors"
echo To restart CMD, type "restart"
echo To check time and date, type "time"
goto cmd

:Start
echo Loading...
set "lines=echo -------------------"
:: Windows Version Check
set "wver1=VER | FINDSTR /L"
set "wver2=IF %ErrorLevel% EQU 0 ("
set "wver3=If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe"
%wver1% "6.1." > NUL:
%wver2%
%wver3% (SET winver=Windows 2008R2 & goto AdminCheck) ELSE (SET winver=Windows 7 & goto AdminCheck))
%wver1% "6.2." > NUL:
%wver2% EQU 0 (
%wver3% (SET winver=Windows 2012 & goto AdminCheck) ELSE (SET winver=Windows 8 & goto AdminCheck))
%wver1% "6.3." > NUL:
%wver2%
%wver3% (SET winver=Windows 2012 & goto AdminCheck) ELSE (SET winver=Windows 8.1 & goto AdminCheck))
%wver1% "10." > NUL:
%wver2%
%wver3% (SET winver=Windows 2016 & goto AdminCheck) ELSE (SET winver=Windows 10 & goto AdminCheck))
endlocal
echo Operating System is not supported.
pause
exit

:AdminCheck
set wver1=
set wver2=
set wver3=
if /i "%CD%" == "%WinDir%\system32" (goto admin) ELSE (goto Nadmin)

:admin
set ADMINstatus=Enabled
goto intro

:Nadmin
set actDIR=%CD%
cd %USERPROFILE%
set ADMINstatus=Disabled

:intro
cls
echo Custom CMD for %winver% [Version %version%]
%lines%
echo Administrator: %ADMINstatus%

:cmd
%lines%
echo Directory: %CD%
set CMD=
set /P CMD=Command:
if NOT defined CMD goto CMD
%lines%
set "cmdif=if /i "%CMD%" =="
:: Built-in Commands
%cmdif% "help" goto helpquestion
%cmdif% "cls" goto clear
%cmdif% "debug" goto debug
%cmdif% "time" goto Time&Date
%cmdif% "color" goto color
%cmdif% "directory" goto directory
%cmdif% "command" goto intro
%cmdif% "restart" goto reset
%cmdif% "exit" goto normalCMD
if defined CMD goto Commanding

:Commanding
%CMD%
if "%DebugStatus%" == "Enabled" (%lines% & echo Return Code:%ErrorLevel%)
goto cmd

:debug
if "%DebugStatus%" == "Enabled" (echo Debug is now Disabled & set DebugStatus=) ELSE (echo Debug is now Enabled & set DebugStatus=Enabled)
goto cmd

:: Built-in Commands
:clear
cls
goto intro

:reset
cls
echo Restarting...
set ADMINstatus=
set winver=
if /i NOT "%CD%" == "%WinDir%\system32" set actDIR=
goto Start

:normalCMD
endlocal
cd /d %USERPROFILE%
cmd
exit

:helpquestion
echo Press "1" to see Built-in Commands
echo Press "2" to see CMD Commands
CHOICE /c:12 /n /m Choice:
if errorlevel 2 goto helpcmd
if errorlevel 1 goto help

:helpcmd
set CMD=help
%lines%
goto Commanding

:color
echo For Normal Color, press "1".
echo For Green, press "2".
echo For Red, press "3".
echo For PowerShell color, press "4".
CHOICE /c:1234 /n /m Color:
if errorlevel 4 color 17
if errorlevel 3 color 0c
if errorlevel 2 color 0a
if errorlevel 1 color 07
if %ErrorLevel% LEQ 4 goto cmd

:directory
echo For Active Directory, type "1".
echo For User Directory, type "2".
echo For Root Directory, type "3".
echo For Desktop Directory, type "4".
echo For Administrator Directory, type "5".
CHOICE /c:12345 /n /m Choice:
if errorlevel 5 cd %SystemDrive%\Windows\system32
if errorlevel 4 cd %USERPROFILE%\Desktop
if errorlevel 3 cd %SystemDrive%\
if errorlevel 2 cd %USERPROFILE%
if errorlevel 1 if "%ADMINstatus%" == "Enabled" (%lines% & echo You cannot switch to Active Directory in Administrator.) else (cd %actDIR%)
if %ErrorLevel% LEQ 5 goto cmd

:Time&Date
echo Time:%time%
echo Date:%date%
goto cmd