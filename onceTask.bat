@echo off& call load.bat _uniqueStr& setlocal enabledelayedexpansion
title 创建一次性计划任务
set /p file=拖入文件:
if not exist %file% (
	echo 文件不存在！& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p time=执行时间(格式 16:30):
(%_call% ("taskName") %_uniqueStr%)


SCHTASKS /Create /SC ONCE /TN %taskName% /ST %time% /TR %file%