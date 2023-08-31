@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

taskkill /F /IM "charmap.exe"

for /f "usebackq delims=" %%a in (`dir /b /a:d "!SystemDrive!\Users"`) do (
	set "userHivePath=!SystemDrive!\Users\%%a\NTUSER.DAT"
    
	if exist "!userHivePath!" (
		set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
		echo Loading user hive: !userHivePath!
		reg unload "!tempHiveKey!"
		reg load "!tempHiveKey!" "!userHivePath!"
        
		echo Deleting registry key from user hive: !tempHiveKey!
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\CalendarRT" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\ContactsRT" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\GameBarApi" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\Poom" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\Remote Assistance" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\Sensors" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\Unified Store" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\Unistore" /f
		reg delete "!tempHiveKey!\SOFTWARE\Microsoft\UserData" /f
        
		echo Unloading user hive: !tempHiveKey!
		reg unload "!tempHiveKey!"
	)
)

REM Define an array of registry keys
set "regKeys[0]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-charmap.resources_31bf3856ad364e35_en-us_e1439e3c41e7211b\10.0"
set "regKeys[1]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-charmap.resources_31bf3856ad364e35_ru-ru_2fa1cb1dc71f76ec\10.0"
set "regKeys[2]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-charmap_31bf3856ad364e35_none_3a95a27cd96598b8\10.0"
set "regKeys[3]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-charmap.resources_31bf3856ad364e35_en-us_eb98488e7647e316\10.0"
set "regKeys[4]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-charmap.resources_31bf3856ad364e35_ru-ru_39f6756ffb8038e7\10.0"
set "regKeys[5]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-charmap_31bf3856ad364e35_none_44ea4ccf0dc65ab3\10.0"

REM Loop through the array of registry keys
for %%k in (%regKeys%) do (
    set "regKey=%%k"

    REM Read the default value
    for /f "tokens=2*" %%A in ('reg query "%regKey%" /ve') do (
        set "defaultValue=%%B"
    )

    REM Read the associated value data pair
    for /f "tokens=2*" %%A in ('reg query "%regKey%" /v "%defaultValue%"') do (
        set "valueDataName=%%A"
        set "valueData=%%B"
    )

    REM Delete the default value
    reg delete "%regKey%" /ve /f

    REM Delete the associated value data pair
    reg delete "%regKey%" /v "%valueDataName%" /f

    echo Deleted default value: %defaultValue% in key %regKey%
    echo Deleted value data pair: %valueDataName%=%valueData% in key %regKey%
)

set "userHivePath=!SystemDrive!\System32\config\COMPONENTS"
if exist "!userHivePath!" (
	set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
	echo Loading user hive: !userHivePath!
	reg unload "!tempHiveKey!"
	reg load "!tempHiveKey!" "!userHivePath!"
        
	echo Deleting registry key from user hive: !tempHiveKey!
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.0 (rs1_release.160715-1616)" /f
        
	echo Adding registry key to user hive: !tempHiveKey!
	reg add "!tempHiveKey!" /v "DisableWerReporting" /t REG_DWORD /d 00000001 /f
        
	echo Unloading user hive: !tempHiveKey!
	reg unload "!tempHiveKey!"
)

exit /b 0
