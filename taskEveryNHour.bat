@echo off& call load.bat _uniqueStr& setlocal enabledelayedexpansion
title ����Сʱ����ƻ�����
set /p file=�����ļ�:
if not exist %file% (
	echo �ļ������ڣ�& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p intervalHour=���Сʱ��(Ĭ��Ϊ1):
if "%intervalHour%" EQU "" (
	set intervalHour=1
)
set /p taskName=�������(�ɲ�д):
if "%taskName%" EQU "" (
	(%_call% ("taskName") %_uniqueStr%)
)


SCHTASKS /Create /SC HOURLY /MO %intervalHour% /TN %taskName% /TR %file%