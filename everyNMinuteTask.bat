@echo off& call lib\load.bat _uniqueStr& setlocal enabledelayedexpansion
title 创建分钟间隔计划任务
set /p file=拖入文件:
if not exist %file% (
	echo 文件不存在！& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p intervalMinute=间隔分钟数:
set /p taskName=任务标题(可不写):
if "%taskName%" EQU "" (
	(%_call% ("taskName") %_uniqueStr%)
)


SCHTASKS /Create /SC MINUTE /MO %intervalMinute% /TN %taskName% /TR %file%