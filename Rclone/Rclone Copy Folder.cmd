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
echo To copy upload, press 1
echo To copy download, press 2
choice /c:12 /n /m Choice:
cls
if errorlevel 2 goto Download
if errorlevel 1 goto Upload

:Upload
echo Type the folder to copy upload to %remote% inside %remotefolder%
set localfolder=
set /p localfolder=Local Folder:
if /i "%localfolder%" == "exit" goto Remote
if NOT defined localfolder goto Upload
echo -------------------
rclone copy "%localfolder%" "%remote%:%remotefolder%" -P
goto Upload

:Download
echo Type the folder to copy download from %remote% inside %remotefolder%
set localfolder=
set /p localfolder=Local Folder:
if /i "%localfolder%" == "exit" goto Remote
if NOT defined localfolder goto Download
echo -------------------
rclone copy "%remote%:%remotefolder%" "%localfolder%" -P
goto Download