@echo off
setlocal
title Number Counter
set number=0
:Counter
echo %number%
ping localhost -n 1 >nul
set /a number=%number%+1
cls
goto Counter