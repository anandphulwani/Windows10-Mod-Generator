@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

taskkill /F /IM "SnippingTool.exe"

set "userHivePath=!SystemDrive!\Windows\System32\SMI\Store\Machine\SCHEMA.DAT"  
if exist "!userHivePath!" (
	set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
	echo Loading user hive: !userHivePath!
	reg unload "!tempHiveKey!"
	reg load "!tempHiveKey!" "!userHivePath!"
        
	echo Deleting registry key from user hive: !tempHiveKey!
	reg delete "!tempHiveKey!\wcm://Microsoft-Windows-SnippingTool-App?version=10.0.14393.0&language=neutral&processorArchitecture=amd64&publicKeyToken=31bf3856ad364e35&versionScope=nonSxS&scope=allUsers" /f
        
	echo Unloading user hive: !tempHiveKey!
	reg unload "!tempHiveKey!"
)


set "userHivePath=!SystemDrive!\System32\config\COMPONENTS"  
if exist "!userHivePath!" (
	set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
	echo Loading user hive: !userHivePath!
	reg unload "!tempHiveKey!"
	reg load "!tempHiveKey!" "!userHivePath!"
        
	echo Deleting registry key from user hive: !tempHiveKey!
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\3aa33ab0f7185b38a62970bb4227e08d44dfa1001adbd7aa6923409d091c783b" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\a9b24563bfe83a99d1a14f26b736c83e9c9dd64a564a93e823a3eb2c7aa74d85" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\d8fc3d723aefa586869bcfd18025b40c3b567f8f9193e49869fc7a0d632bf65c" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..anguagepack_31bf3856ad364e35_10.0.14393.0_a07f9b90b1a8da6d" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..anguagepack_31bf3856ad364e35_10.0.14393.0_e9a0b34502add614" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..nippingtool_31bf3856ad364e35_10.0.14393.0_b5bd63d2721a1d07" /f

	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..gtool-app.resources_31bf3856ad364e35_10.0.14393.0_en-us_d71b102b96e8da5e" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..ngtool-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_a07f9b90b1a8da6d" /f

	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..gtool-app.resources_31bf3856ad364e35_10.0.14393.0_ru-ru_203c27dfe7edd605" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..ngtool-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_e9a0b34502add614" /f

	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-snippingtool_31bf3856ad364e35_10.0.14393.0_none_b5bd63d2721a1d07" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-snippingtool-app_31bf3856ad364e35_10.0.14393.0_none_c7386daaa0559849" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-snippingtool-licensing_31bf3856ad364e35_10.0.14393.0_none_5471ea7c999068c4" /f

	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-s..gtool-app.resources_31bf3856ad364e35_en-us_af02f0b5c0f7ec61" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-s..ngtool-languagepack_31bf3856ad364e35_en-us_dd814008f6e2970a" /f

	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-s..gtool-app.resources_31bf3856ad364e35_ru-ru_fd611d9746304232" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-s..ngtool-languagepack_31bf3856ad364e35_ru-ru_2bdf6cea7c1aecdb" /f

	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-snippingtool_31bf3856ad364e35_none_8a8a8d468c2b56c0" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-snippingtool-app_31bf3856ad364e35_none_15adfaea8708490e" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-snippingtool-licensing_31bf3856ad364e35_none_28ebabd9a43aa3ab" /f
                
	echo Unloading user hive: !tempHiveKey!
	reg unload "!tempHiveKey!"
)

exit /b 0
