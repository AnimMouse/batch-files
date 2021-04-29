@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
ffmpeg -hide_banner -hwaccel auto -i "%filename%" -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "%filename%.gif"
echo Finished!
pause
cls
goto Start