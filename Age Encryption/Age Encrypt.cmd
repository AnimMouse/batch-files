@echo off
setlocal
title %~n0

:Key
cls
echo Input the public key that will be used to encrypt
set key=
set /p key=Key:
if NOT defined key goto Key
echo -------------------

:Filename
echo Input the filename to encrypt
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Key
if NOT defined filename goto Filename
echo -------------------
age -r "%key%" -o "%filename%.age" "%filename%"
goto Filename