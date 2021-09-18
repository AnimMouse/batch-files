@echo off
setlocal
title %~n0
:Start
echo Type the YouTube video ID
set video=
set /p video=Video ID:
if NOT defined video goto Start
yt-dlp -f "bestaudio[ext=m4a]" --add-metadata "%video%"
echo Finished!
echo --------------------
goto Start