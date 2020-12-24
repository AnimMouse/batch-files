@echo off
setlocal
title %~n0
:Start
echo Type the YouTube video ID
set video=
set /p video=Video ID:
if NOT defined video goto Start
youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" "%video%"
echo Finished!
echo --------------------
goto Start