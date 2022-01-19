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
:CPU-Used
echo Type the CPU Used (0-5)
set cpu-used=
set /p cpu-used=CPU Used:
if NOT defined cpu-used goto CPU-Used
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v libvpx-vp9 -crf "%crf%" -b:v 0 -cpu-used "%cpu-used%" -row-mt 1 -c:a copy "%filename%.webm"
echo Finished!
pause
cls
goto Start