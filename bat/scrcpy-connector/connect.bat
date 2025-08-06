@echo off
.\scrcpy-win64\adb.exe start-server

set /a count=0
set /a max_wait=12	:: timeout 5s * 12 times

:wait_device
.\scrcpy-win64\adb.exe get-state >nul 2>&1
if errorlevel 1 (
	set /a count+=1
	if %count% gtr %max_wait% (
	    echo Device authorization timed out. Exiting.
	    timeout /t 5 >nul
	    exit /b
	)
	echo Waiting for device authorization...
	timeout /t 5 >nul
	goto wait_device
)

.\scrcpy-win64\scrcpy.exe
.\scrcpy-win64\adb.exe kill-server
