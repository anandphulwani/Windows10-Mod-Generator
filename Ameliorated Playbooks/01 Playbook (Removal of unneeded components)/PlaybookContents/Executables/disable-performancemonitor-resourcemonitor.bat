@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

taskkill /F /IM "perfmon.exe"
taskkill /F /IM "resmon.exe"

REM Define an array of registry keys
set "regKeys[0]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-p..etoolsgui.resources_31bf3856ad364e35_en-us_2ba0ec43c7b04efd\10.0"
set "regKeys[1]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-p..etoolsgui.resources_31bf3856ad364e35_ru-ru_79ff19254ce8a4ce\10.0"
set "regKeys[2]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-performancetoolsgui_31bf3856ad364e35_none_76d3a3c0bd549ed0\10.0"
set "regKeys[3]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-p..etoolsgui.resources_31bf3856ad364e35_en-us_35f59695fc1110f8\10.0"
set "regKeys[4]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-p..etoolsgui.resources_31bf3856ad364e35_ru-ru_8453c377814966c9\10.0"
set "regKeys[5]=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-performancetoolsgui_31bf3856ad364e35_none_81284e12f1b560cb\10.0"

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
