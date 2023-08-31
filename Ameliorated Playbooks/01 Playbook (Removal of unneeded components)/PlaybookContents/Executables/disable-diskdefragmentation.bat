@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

taskkill /F /IM "Defrag.exe"
taskkill /F /IM "dfrgui.exe"

set "userHivePath=!SystemDrive!\System32\config\COMPONENTS"  
if exist "!userHivePath!" (
	set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
	echo Loading user hive: !userHivePath!
	reg unload "!tempHiveKey!"
	reg load "!tempHiveKey!" "!userHivePath!"
        
	echo Deleting registry key from user hive: !tempHiveKey!
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-defrag_31bf3856ad364e35_10.0.14393.0_none_316bfc567179b46c" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-defrag-scheduleclient_31bf3856ad364e35_10.0.14393.0_none_5d688503eaf49e43" /f
	reg delete "!tempHiveKey!\DerivedData\Components\x86_microsoft-windows-defrag_31bf3856ad364e35_10.0.14393.0_none_d54d60d2b91c4336" /f
	reg delete "!tempHiveKey!\DerivedData\Components\x86_microsoft-windows-defrag-scheduleclient_31bf3856ad364e35_10.0.14393.0_none_0149e98032972d0d" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-defrag_31bf3856ad364e35_none_53ba52aa53599b43" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-defrag-scheduleclient_31bf3856ad364e35_none_2c3c69f3b7a14864" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\x86_microsoft-windows-defrag_31bf3856ad364e35_none_f79bb7269afc2a0d" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\x86_microsoft-windows-defrag-scheduleclient_31bf3856ad364e35_none_d01dce6fff43d72e" /f

	echo Unloading user hive: !tempHiveKey!
	reg unload "!tempHiveKey!"
)


REM Define an array of registry keys
set "regKeys[0]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-d..g-adminui.resources_31bf3856ad364e35_en-us_f06cbdcf6eabc462\10.0"
set "regKeys[1]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-d..g-adminui.resources_31bf3856ad364e35_ru-ru_3ecaeab0f3e41a33\10.0"
set "regKeys[2]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-d..g-cmdline.resources_31bf3856ad364e35_en-us_580c9f41f8673a19\10.0"
set "regKeys[3]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-d..g-cmdline.resources_31bf3856ad364e35_ru-ru_a66acc237d9f8fea\10.0"
set "regKeys[4]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-defrag-adminui_31bf3856ad364e35_none_6e15cd49148481ff\10.0"
set "regKeys[5]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-defrag-cmdline_31bf3856ad364e35_none_90ae6efc47663a24\10.0"
set "regKeys[6]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-defrag-core.resources_31bf3856ad364e35_en-us_8406a6e1e4c3b58e\10.0"
set "regKeys[7]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-defrag-core.resources_31bf3856ad364e35_ru-ru_d264d3c369fc0b5f\10.0"
set "regKeys[8]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-defrag-core_31bf3856ad364e35_none_68712124bac3a83f\10.0"
set "regKeys[9]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-defrag-adminui_31bf3856ad364e35_none_786a779b48e543fa\10.0"
set "regKeys[10]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-d..g-adminui.resources_31bf3856ad364e35_en-us_944e224bb64e532c\10.0"
set "regKeys[11]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-d..g-adminui.resources_31bf3856ad364e35_ru-ru_e2ac4f2d3b86a8fd\10.0"

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

exit /b 0
