@echo off
setlocal
title Number Counter
set number=0
:Counter
echo %number%
echo %number% >> number.txt
set /a number=%number%+1
cls
goto Counter