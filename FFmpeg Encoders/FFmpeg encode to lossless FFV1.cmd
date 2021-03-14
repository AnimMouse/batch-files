@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:Level
echo Type the Level
echo 1 or 3
set level=
set /p level=Level:
if NOT defined level goto Level
:AEncoder
echo Type the Audio Encoder
echo copy or flac, etc.
set aencoder=
set /p aencoder=Audio Encoder:
if NOT defined aencoder goto AEncoder
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -c:v ffv1 -level %level% -pix_fmt yuv444p10le -c:a "%aencoder%" "%filename% FFV1 Lossless.mkv"
echo Finished!
pause
cls
goto Start