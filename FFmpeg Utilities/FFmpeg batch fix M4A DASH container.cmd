@echo off
FOR /F "tokens=*" %%G IN ('dir /b *.m4a') DO ffmpeg -i "%%G" -c copy "%%~nGnew.m4a"
pause
exit
:: ffmpeg -i input.m4a -c copy output.m4a