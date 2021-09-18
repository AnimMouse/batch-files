@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:CID
echo Type the Stream Key
set cid=
set /p cid=Stream Key:
if NOT defined filename goto Start
ffmpeg -hide_banner -i "%filename%" -c:v copy -c:a copy -f hls -hls_time 2 -hls_list_size 4 -method PUT "https://a.upload.youtube.com/http_upload_hls?cid=%cid%&copy=0&file=index.m3u8"
echo Finished!
pause
cls
goto Start
:: Add -re to stream at native frame rate instead of line speed.