@echo off
setlocal
if /i not "%CD%" == "%WinDir%\system32" goto NOTAdmin

:TheQuestion
mach2 display
echo -------------------
echo Does feature 18755234 still enabled? Y or N?
CHOICE /c:yn /n /m "Choice:"
if errorlevel 2 goto Disable
if errorlevel 1 goto Revert

:Revert
mach2 revert 18755234
cls
goto TheQuestion

:Disable
cls
mach2 disable 18755234
echo -------------------
echo Disabled!
timeout /t 5
exit

:NOTAdmin
echo Please run this program in Administrator.
pause
exit