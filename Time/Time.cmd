@echo off
title Time
setlocal enabledelayedexpansion
echo Loading
mode con cols=30 lines=3
:time
cls
echo Time:!time!
echo Date:!date!
timeout /t 1 /nobreak > nul
goto time