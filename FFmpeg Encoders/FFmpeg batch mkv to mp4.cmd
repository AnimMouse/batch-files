@echo off
setlocal
:Start
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO ffmpeg -i "%%G" -c:v copy -c:a libfdk_aac -vbr:a 4 "%%~nG.mp4"
pause