@echo off
Title Windows 8 Custom Refresh Image Creater
goto WinVerCheck

:Error8
cls
title Error
color 17
echo A problem has been detected and Windows 8 Custom Refresh Image Creater has
echo been shut down to prevent damage to your computer.
echo.
echo The problem seems to be caused by the following file: WIN8.SYS
echo.
echo CONTROLLER_FAULT_IN_NONWIN8_AREA
echo.
echo If this is the first time you've seen this stop error screen,
echo restart your elevated command prosessor. If this screen appears again, follow
echo these steps:
echo.
echo Check to make sure any new command prosessor is properly installed.
echo If this is a new installation, ask your command prosessor manufacturer
echo for any Administrator updates you might need.
echo.
echo If problems continue, disable or remove any newly installed command
echo prosessor. Disable CMD memory options such as caching or shadowing.
echo If you need to use not elevated CMD to remove or disable components, restart
echo your command prosessor, press menu to open menu, and then
echo select Open.
echo.
echo Technical information:
echo.
echo *** STOP: 0x00000050 (0xFD3094C2,0x00000001,0xFBFE7617,0x00000000)
echo.
echo.
echo ***  WIN8.SYS - Address FBFE7617 base at FBFE5000, DateStamp 3d6dd67c
pause
exit

:ErrorAdmin
cls
title Error
color 17
echo A problem has been detected and Windows 8 Custom Refresh Image Creater has
echo been shut down to prevent damage to your computer.
echo.
echo The problem seems to be caused by the following file: ADMIN.SYS
echo.
echo CONTROLLER_FAULT_IN_NONADMIN_AREA
echo.
echo If this is the first time you've seen this stop error screen,
echo restart your elevated command prosessor. If this screen appears again, follow
echo these steps:
echo.
echo Check to make sure any new command prosessor is properly installed.
echo If this is a new installation, ask your command prosessor manufacturer
echo for any Administrator updates you might need.
echo.
echo If problems continue, disable or remove any newly installed command
echo prosessor. Disable CMD memory options such as caching or shadowing.
echo If you need to use not elevated CMD to remove or disable components, restart
echo your command prosessor, press menu to open menu, and then
echo select Open.
echo.
echo Technical information:
echo.
echo *** STOP: 0x00000050 (0xFD3094C2,0x00000001,0xFBFE7617,0x00000000)
echo.
echo.
echo ***  ADMIN.SYS - Address FBFE7617 base at FBFE5000, DateStamp 3d6dd67c
pause
exit

:WinVerCheck
echo Checking Windows Version
ping localhost -n 2 > nul
:Windows XP
VER | FINDSTR /L "5.1." > NUL:
IF %ErrorLevel% EQU 0 GOTO Error8
:Windows 2003
VER | FINDSTR /L "5.2." > NUL:
IF %ErrorLevel% EQU 0 GOTO Error8
:Windows XP x64
VER | FINDSTR /L "5.3." > NUL:
IF %ErrorLevel% EQU 0 GOTO Error8
:Windows Vista
VER | FINDSTR /L "6.0." > NUL:
IF %ErrorLevel% EQU 0 GOTO Error8
:Windows 7
VER | FINDSTR /L "6.1." > NUL:
IF %ErrorLevel% EQU 0 GOTO Error8
:Windows 8
VER | FINDSTR /L "6.2." > NUL:
IF %ErrorLevel% EQU 0 GOTO AdminCheck
:Windows 8.1
VER | FINDSTR /L "6.3." > NUL:
IF %ErrorLevel% EQU 0 GOTO AdminCheck

:AdminCheck
echo Checking CMD
ping localhost -n 2 > nul
if /i "%CD%" == "%WinDir%\system32" (goto TheQuestion) ELSE (goto ErrorAdmin)

:TheQuestion
cls
echo Windows 8 Custom Recovery Image Creater
echo -------------------
echo 1. Create Image
echo 2. Deregister Image
echo 3. Set the active Image Directory
CHOICE /c:123 /n /m Choice:
if errorlevel 3 goto DriveSet
if errorlevel 2 goto DeReg
if errorlevel 1 goto Create

:Create
set Create=Yes
goto DriveSet

:DriveSet
cls
echo Set the Drive Letter
CHOICE /c:cdefghijklmnopqrstuvwxyz /n /m "Drive Letter:"
if errorlevel 24 set DriveLetter=Z
if errorlevel 23 set DriveLetter=Y
if errorlevel 22 set DriveLetter=X
if errorlevel 21 set DriveLetter=W
if errorlevel 20 set DriveLetter=V
if errorlevel 19 set DriveLetter=U
if errorlevel 18 set DriveLetter=T
if errorlevel 17 set DriveLetter=S
if errorlevel 16 set DriveLetter=R
if errorlevel 15 set DriveLetter=Q
if errorlevel 14 set DriveLetter=P
if errorlevel 13 set DriveLetter=O
if errorlevel 12 set DriveLetter=N
if errorlevel 11 set DriveLetter=M
if errorlevel 10 set DriveLetter=L
if errorlevel 9 set DriveLetter=K
if errorlevel 8 set DriveLetter=J
if errorlevel 7 set DriveLetter=I
if errorlevel 6 set DriveLetter=H
if errorlevel 5 set DriveLetter=G
if errorlevel 4 set DriveLetter=F
if errorlevel 3 set DriveLetter=E
if errorlevel 2 set DriveLetter=D
if errorlevel 1 set DriveLetter=C
if /i "%Create%" == "Yes" (goto CreateImage) ELSE (goto Set)

:CreateImage
cls
echo ----------------------
echo Now Creating Image...
echo ----------------------
echo Log:
recimg -CreateImage %DriveLetter%:\RefreshImage
goto FinishCreate

:FinishCreate
cls
echo Finished!
pause
goto TheQuestion

:DeReg
cls
recimg /deregister
cls
echo Deregister Finished
pause
goto TheQuestion

:Set
cls
recimg /setcurrent "%DriveLetter%"
cls
echo Setting Finished!
pause
goto TheQuestion