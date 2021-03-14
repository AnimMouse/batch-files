@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:Preset
echo Type the Preset
set preset=
set /p preset=Preset:
if NOT defined preset goto Preset
:AEncoder
echo Type the Audio Encoder
echo copy or flac, etc.
set aencoder=
set /p aencoder=Audio Encoder:
if NOT defined aencoder goto AEncoder
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v libx265 -preset "%preset%" -x265-params lossless=1 -pix_fmt yuv444p10le -c:a "%aencoder%" "%filename% x265 Lossless.mkv"
echo Finished!
pause
cls
goto Start