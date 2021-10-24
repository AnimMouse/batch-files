@echo off
setlocal
title %~n0
:Filename
echo Type the Filename of pkg
set filename=
set /p filename=Filename:
if NOT defined filename goto Filename
:zRIF
echo Type the zRIF String
set zrif=
set /p zrif=zRIF:
pkg2zip -x "%filename%" "%zrif%"
echo Finished!
pause
cls
goto Filename