@echo off& call lib\load.bat _uniqueStr& setlocal enabledelayedexpansion
title �������Ӽ���ƻ�����
set /p file=�����ļ�:
if not exist %file% (
	echo �ļ������ڣ�& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p intervalMinute=���������:
set /p taskName=�������(�ɲ�д):
if "%taskName%" EQU "" (
	(%_call% ("taskName") %_uniqueStr%)
)


SCHTASKS /Create /SC MINUTE /MO %intervalMinute% /TN %taskName% /TR %file%