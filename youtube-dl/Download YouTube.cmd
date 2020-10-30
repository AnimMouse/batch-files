@echo off
setlocal
:Start
echo Type the YouTube video ID
set video=
set /p video=Video ID:
if NOT defined video goto Start
youtube-dl "%video%"
echo Finished!
goto Start