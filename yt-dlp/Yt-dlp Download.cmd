@echo off
setlocal
title %~n0
:Start
echo Type the video URL or ID
set video=
set /p video=Video:
if NOT defined video goto Start
yt-dlp "%video%"
echo Finished!
echo --------------------
goto Start