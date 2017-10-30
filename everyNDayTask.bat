@echo off& call load.bat _uniqueStr& setlocal enabledelayedexpansion
title 创建每日计划任务
set /p file=拖入文件:
if not exist %file% (
	echo 文件不存在！& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p intervalDay=间隔天数(默认为1):
if "%intervalDay%" EQU "" (
	set intervalDay=1
)
set /p time=执行时间(格式 16:30):
if "%time%" EQU "" (
	echo 时间必须填写！& pause>nul& exit
)
set /p taskName=任务标题(可不写):
if "%taskName%" EQU "" (
	(%_call% ("taskName") %_uniqueStr%)
)

SCHTASKS /Create /SC DAILY /MO %intervalDay% /TN %taskName% /ST %time% /TR %file%