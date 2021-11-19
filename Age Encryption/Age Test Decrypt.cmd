@echo off
setlocal
title %~n0

:Key
cls
echo Input the private key that will be used to test decrypt
set key=
set /p key=Key:
if NOT defined key goto Key
echo -------------------

:Filename
echo Input the filename to test decrypt
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Key
if NOT defined filename goto Filename
for /F "delims=" %%i in ("%filename%") do set filename_noext=Test %%~ni
set key-random=%random%
echo %key%> age-decrypt-%key-random%.key
echo -------------------
age -d -i "age-decrypt-%key-random%.key" -o "%filename_noext%" "%filename%"
del age-decrypt-%key-random%.key
goto Filename