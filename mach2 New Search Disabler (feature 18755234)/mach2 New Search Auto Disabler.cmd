:@echo off
:: Under Constrution, not working
exit
setlocal
if /i not "%CD%" == "%WinDir%\system32" goto NOTAdmin

:AutoCheck
mach2 display | findstr /I 18755234
if errorlevel 1 goto Disable
if errorlevel 0 goto Revert

:Revert
mach2 revert 18755234
goto AutoCheck

:Disable
mach2 disable 18755234
echo -------------------
echo Disabled!
timeout /t 5
exit

:NOTAdmin
echo Please run this program in Administrator.
pause
exit