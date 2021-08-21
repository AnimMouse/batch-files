@echo off
FOR /F "tokens=*" %%G IN ('dir /b *.aac') DO ffmpeg -i "%%G" -c copy "%%~nGnew.m4a"
pause
exit
:: ffmpeg -i input.aac -c copy output.m4a