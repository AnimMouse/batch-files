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
echo Type the folder to upload to %username%@%server%
set folder=
set /p folder=Folder:
if /i "%folder%" == "exit" goto Question
if NOT defined folder goto Upload
pscp -P 22 -r "%folder%" "%username%@%server%:/home/%username%/"
echo -------------------
goto Upload

:Download
echo Type the folder to download from %username%@%server%
set folder=
set /p folder=Folder:
if /i "%folder%" == "exit" goto Question
if NOT defined folder goto Download
pscp -P 22 -r "%username%@%server%:/home/%username%/%folder%" .
echo -------------------
goto Download