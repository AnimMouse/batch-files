@echo off
setlocal
title %~n0
:Start
echo Type the Filename
set filename=
set /p filename=Filename:
if NOT defined filename goto Start
:Model
echo Type the Model
set model=
set /p model=Model:
if NOT defined model set model=default
realesrgan-ncnn-vulkan.exe -i "%filename%" -o "%filename% ESRGAN.jpg" -n "%model%"
echo Finished!
pause
cls
goto Start