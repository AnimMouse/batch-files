@echo off
setlocal
title %~n0
:Filename
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Filename
:Start
echo Type the Start Timestamp
set start=
set /p start=Start:
if NOT defined start set start=00:00:00.0
:Duration
echo Type the Duration
set duration=
set /p duration=Duration:
if NOT defined duration goto Duration
echo Clip the first %start%, and clip everything that is %duration% after that
pause
ffmpeg -hide_banner -ss "%start%" -i "%filename%" -c copy -t %duration% "%filename% Cut.mkv"
echo Finished!
pause
cls
goto Filename