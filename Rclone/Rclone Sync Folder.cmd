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

:RemoteFolder
echo -------------------
rclone lsd "%remote%:"
echo -------------------
echo Type the folder to use
set remotefolder=
set /p remotefolder=Remote Folder:
if NOT defined remotefolder goto RemoteFolder

:Question
echo -------------------
echo To sync upload, press 1
echo To sync download, press 2
choice /c:12 /n /m Choice:
cls
if errorlevel 2 goto Download
if errorlevel 1 goto Upload

:Upload
echo Type the folder to sync upload to %remote% inside %remotefolder%
set localfolder=
set /p localfolder=Local Folder:
if /i "%localfolder%" == "exit" goto Remote
if NOT defined localfolder goto Upload
echo -------------------
rclone sync "%localfolder%" "%remote%:%remotefolder%" --progress --no-update-modtime
goto Upload

:Download
echo Type the folder to sync download from %remote% inside %remotefolder%
set localfolder=
set /p localfolder=Local Folder:
if /i "%localfolder%" == "exit" goto Remote
if NOT defined localfolder goto Download
echo -------------------
rclone sync "%remote%:%remotefolder%" "%localfolder%" --progress
goto Download