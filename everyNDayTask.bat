@echo off& call load.bat _uniqueStr& setlocal enabledelayedexpansion
title ����ÿ�ռƻ�����
set /p file=�����ļ�:
if not exist %file% (
	echo �ļ������ڣ�& pause>nul& exit
)
for /f %%i in ("%file%") do (
	if "%%~xi"==".ahk" (
		set file="'C:\Program Files\AutoHotkey\AutoHotkeyU64.exe' '%file%'" 
	)
)
set /p intervalDay=�������(Ĭ��Ϊ1):
if "%intervalDay%" EQU "" (
	set intervalDay=1
)
set /p time=ִ��ʱ��(��ʽ 16:30):
if "%time%" EQU "" (
	echo ʱ�������д��& pause>nul& exit
)
set /p taskName=�������(�ɲ�д):
if "%taskName%" EQU "" (
	(%_call% ("taskName") %_uniqueStr%)
)

SCHTASKS /Create /SC DAILY /MO %intervalDay% /TN %taskName% /ST %time% /TR %file%