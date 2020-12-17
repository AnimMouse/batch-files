@echo off
setlocal
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
ffmpeg -hide_banner -hwaccel cuda -hwaccel_output_format cuda -i "%filename%" -vsync passthrough -c:v hevc_nvenc -b:v 3M -preset:v slow -tier:v high -rc:v vbr_hq -rc-lookahead:v 1 -2pass:v true -spatial-aq:v 1 -c:a copy "%filename%.mkv"
echo Finished!
pause
cls
goto Start
:: libopus -b:a 64K
:: ffmpeg -hide_banner -h encoder=hevc_nvenc
:: -vsync vfr -r 30