@echo off
setlocal
set server=example.com
set username=root
:Start
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
if /i "%filename%" == "exit" goto Start
if NOT defined filename goto Upload
pscp -P 22 "%filename%" "%username%@%server%:/home/%username%/%filename%"
echo -------------------
goto Upload
:Download
echo Type the filename to download from %username%@%server%
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Start
if NOT defined filename goto Download
pscp -P 22 "%username%@%server%:/home/%username%/%filename%" "%filename%"
echo -------------------
goto Download