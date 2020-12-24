@echo off
setlocal
title %~n0
:Start
echo Type the YouTube video ID
set video=
set /p video=Video ID:
if NOT defined video goto Start
youtube-dl -f "bestaudio[ext=webm]" --add-metadata "%video%"
:: Get filename and put it in variable
for /F "tokens=*" %%g IN ('youtube-dl --get-filename "%video%"') do (set filename=%%g)
:: WebM to Opus
ffmpeg -i "%filename%" -c:a copy "%filename%.opus"
del "%filename%"
echo Finished!
echo --------------------
goto Start