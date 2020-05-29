@echo off
setlocal enabledelayedexpansion
title Command Prompt
echo Loading...
set version=1.1

:Start
prompt Custom$SCMD$Sis$SLoading...$BCommand:

:WinVerCheck
VER | FINDSTR /L "6.1." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2008R2 & goto AdminCheck) ELSE (SET winver=Windows 7 & goto AdminCheck))
 
VER | FINDSTR /L "6.2." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2012 & goto AdminCheck) ELSE (SET winver=Windows 8 & goto AdminCheck))

VER | FINDSTR /L "6.3." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2012 & goto AdminCheck) ELSE (SET winver=Windows 8.1 & goto AdminCheck))
echo Operating System is not supported.
pause
exit

:AdminCheck
if /i "%CD%" == "%WinDir%\system32" (goto admin) ELSE (goto NOTadmin)

:NOTadmin
set actDIR=%CD%
cd %USERPROFILE%
set ADMINstatus=Disabled
goto startcmd

:admin
set ADMINstatus=Enabled

:startcmd
prompt Custom$SCMD$Sfor$S%winver%$S[Version$S%version%]$BCommand:
cls

:intro
echo Custom CMD for %winver% [Version %version%]
echo -------------------
echo Administrator: %ADMINstatus%

:cmd
echo -------------------
echo Directory: %CD%
set CMD=
set /P CMD=Command:
if NOT defined CMD goto CMD
echo -------------------
if /i "%CMD%" == "help" goto helpquestion
if /i "%CMD%" == "cls" goto clear
if /i "%CMD%" == "debug" goto debug
if /i "%CMD%" == "time" goto Time&Date
if /i "%CMD%" == "color" goto color
if /i "%CMD%" == "directory" goto directory
if /i "%CMD%" == "command" goto intro
if /i "%CMD%" == "restart" goto reset
if /i "%CMD%" == "exit" goto normalCMD
if defined CMD goto Commanding

:Commanding
%CMD%
if "%DebugStatus%" == "Enabled" echo ------------------- & echo Return Code:%ErrorLevel%
goto cmd

:debug
if "%DebugStatus%" == "Enabled" (echo Debug is now Disabled & set DebugStatus=) ELSE (echo Debug is now Enabled & set DebugStatus=Enabled)
goto cmd

:clear
cls
goto intro

:reset
cls
echo Restarting...
set ADMINstatus=
set winver=
prompt $P$G
if /i NOT "%CD%" == "%WinDir%\system32" set actDIR=
goto Start

:normalCMD
endlocal
prompt $P$G
cd /d %USERPROFILE%
cmd
exit

:helpquestion
echo Press "1" to see Custom CMD Commands
echo Press "2" to see CMD Commands
CHOICE /c:12 /n /m Choice:
if errorlevel 2 goto helpcmd
if errorlevel 1 goto help

:helpcmd
set CMD=help
echo -------------------
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
if errorlevel 1 if "%ADMINstatus%" == "Enabled" (echo ------------------- & echo You cannot switch to Active Directory in Administrator.) else (cd %actDIR%)
if %ErrorLevel% LEQ 5 goto cmd

:Time&Date
echo Time:%time%
echo Date:%date%
goto cmd

:help
echo -------------------
echo For list of directories, type "directory"
echo To enable/disable return code, type "debug"
echo For list of colors, type "colors"
echo To restart CMD, type "restart"
echo To check time and date, type "time"
goto cmd