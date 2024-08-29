@echo off
setlocal
title %~n0
FOR /F "tokens=*" %%G IN ('dir /b *.flac') DO ffmpeg -hide_banner -i "%%G" -c:a libopus -b:a 128k "%%~nG.opus"
pause