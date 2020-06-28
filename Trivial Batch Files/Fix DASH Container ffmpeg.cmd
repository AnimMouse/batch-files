@echo off
FOR /F "tokens=*" %%G IN ('dir /b *.m4a') DO ffmpeg -i "%%G" -c copy "%%~nGnew.m4a"
pause
exit
:: ffmpeg -i input.m4a -c copy output.aac
:: FOR /F "tokens=*" %%G IN ('dir /b *.m4a') DO ffmpeg -i "%%G" -c copy "%%~nGnew.m4a"
:: FOR /F "tokens=*" %%G IN ('dir /b *.aac') DO ffmpeg -i "%%G" -c copy "%%~nGnew.m4a"