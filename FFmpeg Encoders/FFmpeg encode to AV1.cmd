@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:CRF
echo Type the CRF (0–63)
set crf=
set /p crf=CRF:
if NOT defined crf goto CRF
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v libaom-av1 -crf "%crf%" -b:v 0 -c:a copy "%filename%.mkv"
echo Finished!
pause
cls
goto Start
:: libopus -b:a 64K