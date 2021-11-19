@echo off
setlocal
title %~n0
set server=example.com
set username=root

:Question
cls
echo To upload, press 1
echo To download, press 2
CHOICE /c:12 /n /m Choice:
cls
if %errorlevel% EQU 2 goto Download
if %errorlevel% EQU 1 goto Upload

:Upload
echo Type the filename to upload to %username%@%server%
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Question
if NOT defined filename goto Upload
pscp -P 22 "%filename%" "%username%@%server%:/home/%username%/"
echo -------------------
goto Upload

:Download
echo Type the filename to download from %username%@%server%
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Question
if NOT defined filename goto Download
pscp -P 22 "%username%@%server%:/home/%username%/%filename%" .
echo -------------------
goto Download