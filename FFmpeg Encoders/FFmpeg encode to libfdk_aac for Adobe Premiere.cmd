@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v copy -c:a libfdk_aac "%filename%.mp4"
echo Finished!
pause
cls
goto Start