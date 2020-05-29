@echo off
setlocal enabledelayedexpansion
goto Start

:Start
Title Command Prompt
prompt Custom$SCMD$Sis$SLoading...$BCommand:
if "%RenewVersionSkip%" == "Yes" (goto InfoRenewSkip) ELSE (goto SetInfo)

:SetInfo
echo Setting Infomations
ping localhost -n 2 > nul
set /a ValRange= ( 10 - 1 ) + 1
set /a version= ( %random% %% %ValRange% ) + 1
set /a ValRange= 5 + 1 
:set /a versiondecimal= ( %random% %% %ValRange% )
set /a versiondecimal=%random% %% %ValRange%
set ValRange=
goto WinVerCheck

:InfoRenewSkip
set RenewVersionSkip=
goto WinVerCheck

:WinVerCheck
echo Checking Windows Version
ping localhost -n 2 > nul
VER | FINDSTR /L "5.1." > NUL:
IF %ErrorLevel% EQU 0 SET winver=Windows XP
 
VER | FINDSTR /L "5.2." > NUL:
IF %ErrorLevel% EQU 0 SET winver=Windows 2003
 
VER | FINDSTR /L "5.3." > NUL:
IF %ErrorLevel% EQU 0 SET winver=Windows XP (x64 Edition)
 
VER | FINDSTR /L "6.0." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2008R1) ELSE (SET winver=Windows Vista))
 
VER | FINDSTR /L "6.1." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2008R2) ELSE (SET winver=Windows 7))
 
VER | FINDSTR /L "6.2." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2012) ELSE (SET winver=Windows 8))

VER | FINDSTR /L "6.3." > NUL:
IF %ErrorLevel% EQU 0 (
If EXIST %SystemRoot%\System32\ServerManagerLauncher.exe (SET winver=Windows 2012) ELSE (SET winver=Windows 8.1))
goto AdminCheck

:AdminCheck
echo Checking CMD
ping localhost -n 2 > nul
if /i "%CD%" == "%WinDir%\system32" (goto admin) ELSE (goto NOTadmin)

:NOTadmin
echo Starting
set actDIR=%CD%
cd /d %USERPROFILE%
set ADMINstatus=Disabled
ping localhost -n 2 > nul
goto startcmd

:admin
echo Starting as Admin
set ADMINstatus=Enabled
ping localhost -n 2 > nul
goto startcmd

:startcmd
prompt Custom$SCMD$Sfor$S%winver%$S[Version$S%version%]$BCommand:
cls
goto intro

:help
echo -------------------
echo Type "home" any time to go to the current user profile directory.
echo Type "desktop" any time to go to the current user desktop.
echo.
echo Type help to see list of common commands like cd, rd, md, del,
echo ren, replace, copy, xcopy, move, attrib, tree, edit, and cls.
echo Type [command]/? for detailed info.
goto cmd

:intro
echo Custom CMD for %winver% [Version %version%.%versiondecimal%]
echo (c) Microsoft Corporation. All rights reserved.
echo -------------------
echo Administrator: %ADMINstatus%
goto cmd

:cmd
echo -------------------
echo Directory: %CD%
set CMD=
set /P CMD=Command:
if NOT defined CMD goto CMD
echo -------------------
if /i "%CMD%" == "echo" goto EchoError
if /i "%CMD%" == "echo on" goto EchoError
if /i "%CMD%" == "echo off" goto EchoError
if /i "%CMD%" == "echo /?" goto EchoError
if /i "%CMD%" == "time" goto Time&Date
if /i "%CMD%" == "exit" goto normalCMD
if /i "%CMD%" == "color" goto color
if /i "%CMD%" == "command" goto intro
if /i "%CMD%" == "debug" goto debug
if /i "%CMD%" == "cls" goto clear
if /i "%CMD%" == "active" goto activeDIR
if /i "%CMD%" == "admin" goto adminDIR
if /i "%CMD%" == "root" goto rootDIR
if /i "%CMD%" == "home" goto userDIR
if /i "%CMD%" == "desktop" goto desktop
if /i "%CMD%" == "help" goto helpquestion
if /i "%CMD%" == "restart" goto reset
if defined CMD goto Commanding

:Commanding
%CMD%
if "%DebugStatus%" == "Enabled" echo ------------------- & echo Return Code:%ErrorLevel%
goto cmd

:EchoError
echo Editing Echo is not allowed.
goto cmd

:debug
if "%DebugStatus%" == "Enabled" (echo Debug is now Disabled & set DebugStatus=) ELSE (echo Debug is now Enabled & set DebugStatus=Enabled)
goto cmd

:reset
cls
echo Restarting...
ping localhost -n 1 > nul
set ADMINstatus=
ping localhost -n 1 > nul
set RenewVersionSkip=Yes
ping localhost -n 1 > nul
set winver=
ping localhost -n 1 > nul
prompt $P$G
ping localhost -n 1 > nul
if /i NOT "%CD%" == "%WinDir%\system32" set actDIR=
cls
ping localhost -n 3 > nul
goto Start

:helpquestion
echo Type "1" to see Custom CMD Commands
echo Type "2" to see CMD Commands
CHOICE /c:12 /n /m Choice:
if errorlevel 2 goto helpcmd
if errorlevel 1 goto help

:helpcmd
set CMD=help
echo -------------------
goto Commanding

:color
echo For Normal Color, type "1".
echo For Green, type "2".
echo For Red, type "3".
echo For PowerShell color, type "4".
CHOICE /c:1234 /n /m Color:
if errorlevel 4 color 17
if errorlevel 3 color 0c
if errorlevel 2 color 0a
if errorlevel 1 color 07
if %ErrorLevel% LEQ 4 goto cmd

:clear
cls
goto intro

:activeDIR
if "%ADMINstatus%" == "Enabled" echo You cannot switch to Active Directory in Administrator. & goto cmd
cd /d %actDIR%
set DIRswitch=Active Directory
goto switchTOdir

:userDIR
cd /d %USERPROFILE%
set DIRswitch=User Directory
goto switchTOdir

:rootDIR
cd /d %SystemDrive%\
set DIRswitch=Root Directory
goto switchTOdir

:desktop
cd /d %USERPROFILE%\Desktop
set DIRswitch=Desktop Directory
goto switchTOdir

:adminDIR
cd /d %SystemDrive%\Windows\system32
set DIRswitch=Administrator
goto switchTOdir

:normalCMD
endlocal
prompt $P$G
cmd
exit

:Time&Date
echo Time:%time%
echo Date:%date%
goto cmd

:switchTOdir
echo Switched to %DIRswitch%
set DIRswitch=
goto cmd