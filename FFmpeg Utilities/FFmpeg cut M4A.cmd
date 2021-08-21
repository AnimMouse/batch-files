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
:Stop
echo Type the Stop Timestamp
set stop=
set /p stop=Stop:
if NOT defined stop goto stop
echo Clip the first %start%, and clip at %stop%
pause
ffmpeg -hide_banner -ss "%start%" -i "%filename%" -c copy -t %stop% "%filename% Cut.m4a"
echo Finished!
pause
cls
goto Filename