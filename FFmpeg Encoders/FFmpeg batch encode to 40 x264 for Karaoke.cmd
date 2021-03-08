@echo off
setlocal
:Start
FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO ffmpeg -hide_banner -hwaccel auto -i "%%G" -c:v libx264 -crf 40 -preset slow -x264-params opencl=true -c:a copy "%%~nG Karaoke.mp4"
pause