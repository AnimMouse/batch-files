@echo off
setlocal
:: Date
set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
:: Time
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
:: Filename
set dateandtime=%CUR_YYYY%-%CUR_MM%-%CUR_DD% %CUR_HH%.%CUR_NN%.%CUR_SS%
:: FFmpeg Record
ffmpeg -hide_banner -hwaccel d3d11va -f gdigrab -framerate 30 -i desktop -f dshow -i audio="Stereo Mix (VIA High Definition Audio)" -c:v h264_qsv -b:v 5M -preset:v slow -cavlc:v 1 -profile:v high -c:a libopus -b:a 64K "Record %dateandtime%.mkv"
pause
exit
:: ffmpeg -hide_banner -h encoder=h264_qsv
:: ffmpeg -hide_banner -list_devices true -f dshow -i dummy