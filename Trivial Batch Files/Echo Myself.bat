@echo off
setlocal enabledelayedexpansion
title Echo
:Echo
cls
echo Me:%input%
set input=
set /p input=You:
goto Echo