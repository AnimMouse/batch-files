@echo off
title Time
setlocal enabledelayedexpansion
mode con cols=30 lines=3
:Time
cls
echo Time:!time!
echo Date:!date!
timeout /t 1 /nobreak > nul
goto Time