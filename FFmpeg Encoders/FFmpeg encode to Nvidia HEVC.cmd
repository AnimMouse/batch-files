@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -i "%filename%" -vsync passthrough -c:v hevc_nvenc -b:v 3M -preset:v slow -tier:v high -rc:v vbr_hq -rc-lookahead:v 1 -2pass:v true -spatial-aq:v 1 -c:a copy "%filename%.mkv"
ffmpeg -hide_banner -hwaccel nvdec -hwaccel_output_format cuda -i "%filename%" -vsync passthrough -c:v hevc_nvenc -b:v 3M -preset:v p7 -tune:v hq -tier:v high -rc:v vbr -rc-lookahead:v 1 -multipass:v fullres -spatial-aq:v 1 -weighted_pred:v 1 -c:a copy "%filename%.mkv"
echo Finished!
pause
cls
goto Start