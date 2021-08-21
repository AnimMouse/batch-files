@echo off
setlocal
title %~n0
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO ffmpeg -hide_banner -i "%%G" -c:v copy -c:a libfdk_aac -vbr:a 4 "%%~nG.mp4"
pause