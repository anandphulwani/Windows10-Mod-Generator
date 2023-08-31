@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

taskkill /F /IM "Narrator.exe"

for /f "usebackq delims=" %%a in (`dir /b /a:d "!SystemDrive!\Users"`) do (
	echo del /q /f "!SystemDrive!\Users\%%a\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessibility\Narrator.lnk"
	del /q /f "!SystemDrive!\Users\%%a\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessibility\Narrator.lnk"

	set "userHivePath=!SystemDrive!\Users\%%a\NTUSER.DAT"
    
	if exist "!userHivePath!" (
		set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
		echo Loading user hive: !userHivePath!
		reg unload "!tempHiveKey!"
		reg load "!tempHiveKey!" "!userHivePath!"
        
		echo Deleting registry key from user hive: !tempHiveKey!
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\Narrator" /f
        
		echo Unloading user hive: !tempHiveKey!
		reg unload "!tempHiveKey!"
	)
)

exit /b 0
