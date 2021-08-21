@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:CRF
echo Type the CRF
set crf=
set /p crf=CRF:
if NOT defined crf goto CRF
:Preset
echo Type the Preset
set preset=
set /p preset=Preset:
if NOT defined preset goto Preset
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v libx265 -crf "%crf%" -preset "%preset%" -c:a copy "%filename%.mkv"
echo Finished!
pause
cls
goto Start