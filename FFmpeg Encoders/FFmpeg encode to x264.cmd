@echo off
setlocal
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
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v libx264 -crf "%crf%" -preset "%preset%" -x264-params opencl=true -c:a copy "%filename%.mp4"
echo Finished!
pause
cls
goto Start