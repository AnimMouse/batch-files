@echo off
setlocal
title %~n0
FOR /F "tokens=*" %%G IN ('dir /b *.avi') DO ffmpeg -hide_banner -hwaccel auto -i "%%G" -c:v ffv1 -level 3 -c:a flac "%%~nG FFV1.mkv"
pause