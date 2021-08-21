@echo off
setlocal
title %~n0
set codec=h264_qsv
ffmpeg -hide_banner -h encoder=%codec%
ffmpeg -hide_banner -h encoder=%codec% > %codec%.txt
pause