@echo off
setlocal
title SumatraPDF Install for All Users
:Start
echo Type the Filename of SumatraPDF Installer
echo This batch file should be placed in the same location beside the installer.
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
echo --------------------
echo Type the install location
echo Leave blank for default location: C:\Program Files\SumatraPDF
set location=
set /p location=Location:
if NOT defined location set location=C:\Program Files\SumatraPDF
echo %filename% %location%
start "" "%filename%" -s -with-preview -d "%location%"
echo --------------------
echo Finished!
pause