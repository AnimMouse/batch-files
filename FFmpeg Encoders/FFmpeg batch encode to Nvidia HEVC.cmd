@echo off
setlocal
:Start
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -i "%%G" -vsync passthrough -c:v hevc_nvenc -b:v 3M -preset:v slow -tier:v high -rc:v vbr_hq -rc-lookahead:v 1 -2pass:v true -spatial-aq:v 1 -c:a copy "%%~nG HEVC.mkv"
pause
:: libopus -b:a 64K
:: ffmpeg -hide_banner -h encoder=hevc_nvenc
:: -vsync vfr -r 30