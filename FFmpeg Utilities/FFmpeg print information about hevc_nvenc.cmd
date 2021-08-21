@echo off
setlocal
title %~n0
set codec=hevc_nvenc
ffmpeg -hide_banner -h encoder=%codec%
ffmpeg -hide_banner -h encoder=%codec% > %codec%.txt
pause