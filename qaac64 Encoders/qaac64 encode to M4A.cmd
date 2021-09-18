@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:TVBR
echo Type the TVBR quality (0,9,18,27,36,45,54,63,73,82,91,100,109,118,127)
set tvbr=
set /p tvbr=TVBR:
if NOT defined tvbr goto TVBR
qaac64 -V "%tvbr%" "%filename%"
echo Finished!
pause
cls
goto Start