@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
ffmpeg -hide_banner -i "%filename%" -vn -c:a copy "%filename%.m4a"
echo Finished!
pause
cls
goto Start