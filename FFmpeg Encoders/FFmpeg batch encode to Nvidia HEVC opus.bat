@echo off
setlocal
title %~n0
:Start
FOR /F "tokens=*" %%G IN ('dir /b *.mkv') DO ffmpeg -hide_banner -hwaccel nvdec -hwaccel_output_format cuda -i "%%G" -vsync passthrough -c:v hevc_nvenc -b:v 3M -preset:v p7 -tune:v hq -tier:v high -rc:v vbr -rc-lookahead:v 1 -multipass:v fullres -spatial-aq:v 1 -weighted_pred:v 1 -c:a libopus -b:a 64K "%%~nG HEVC.mkv"
pause
:: libopus -b:a 64K
:: ffmpeg -hide_banner -h encoder=hevc_nvenc
:: -vsync vfr -r 30