@echo off
setlocal
:: Time
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
:: Filename
set dateandtime=%date% %CUR_HH%.%CUR_NN%.%CUR_SS%
:: FFmpeg Record
ffmpeg -hide_banner -f gdigrab -framerate 30 -i desktop -f dshow -i audio="Stereo Mix (VIA High Definition Audio)" -vsync vfr -c:v libvpx-vp9 -crf 34 -b:v 0 -cpu-used 3 -row-mt 1 -c:a libopus -b:a 64K "Record %dateandtime%.webm"
pause
exit
:: ffmpeg -hide_banner -h encoder=libvpx-vp9
:: ffmpeg -hide_banner -list_devices true -f dshow -i dummy