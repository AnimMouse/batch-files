@echo off
setlocal
title %~n0

:Remote
rclone listremotes
echo -------------------
echo Type the remote to use
set remote=
set /p remote=Remote:
if NOT defined remote goto Remote

:Question
echo -------------------
echo To upload, press 1
echo To download, press 2
choice /c:12 /n /m Choice:
cls
if errorlevel 2 goto Download
if errorlevel 1 goto Upload

:Upload
echo Type the filename to upload to %remote%
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Remote
if NOT defined filename goto Upload
echo -------------------
rclone copy "%filename%" "%remote%:" --progress
goto Upload

:Download
echo Type the filename to download from %remote%
set filename=
set /p filename=Filename:
if /i "%filename%" == "exit" goto Remote
if NOT defined filename goto Download
echo -------------------
rclone copy "%remote%:%filename%" . --progress
goto Download