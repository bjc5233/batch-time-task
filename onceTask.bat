@echo off& call load.bat _uniqueStr& setlocal enabledelayedexpansion
title ����һ���Լƻ�����
set /p file=�����ļ�:
if not exist %file% (
	echo �ļ������ڣ�& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p time=ִ��ʱ��(��ʽ 16:30):
(%_call% ("taskName") %_uniqueStr%)


SCHTASKS /Create /SC ONCE /TN %taskName% /ST %time% /TR %file%