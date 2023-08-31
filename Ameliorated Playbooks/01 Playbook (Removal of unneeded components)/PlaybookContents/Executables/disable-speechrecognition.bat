@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

taskkill /F /IM "sapisvr.exe"
taskkill /F /IM "SpeechUXWiz.exe"
taskkill /F /IM "SpeechRuntime.exe"
taskkill /F /IM "SpeechModelDownload.exe"

set "userHivePath=!SystemDrive!\Windows\System32\SMI\Store\Machine\SCHEMA.DAT"  
if exist "!userHivePath!" (
	set "tempHiveKey=HKEY_LOCAL_MACHINE\TempUserHive"
        
	echo Loading user hive: !userHivePath!
	reg unload "!tempHiveKey!"
	reg load "!tempHiveKey!" "!userHivePath!"
        
	echo Deleting registry key from user hive: !tempHiveKey!
	reg delete "!tempHiveKey!\wcm://Microsoft-Windows-Speech-UserExperience-Common?version=10.0.14393.0&language=neutral&processorArchitecture=amd64&publicKeyToken=31bf3856ad364e35&versionScope=nonSxS&scope=allUsers" /f
	reg delete "!tempHiveKey!\wcm://Microsoft-Windows-Speech-UserExperience-Common?version=10.0.14393.0&language=neutral&processorArchitecture=x86&publicKeyToken=31bf3856ad364e35&versionScope=nonSxS&scope=allUsers" /f
        
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
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\140c0a623eee6dc9f4c65762b376b9cd4515dae620e674efd419da7415aa92cb" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\14be5190f45e6f8ecc5b6f032c2cc7af5c0ebe8dfc592c40d0f1dd9d05ded5f0" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\2965ae16a6469d15a64bf3b8688204b1bc571e4316c583a68c4b7f0cd6c28cbb" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\4c65b4152d90fb0bd909588615338bc33d3e92f6d3c6ef37176b66dbb396c389" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\51bbd41b8869f6a0f602aed48453ef5ecd43ca895197297908393b2e1c5daed4" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\5ac266bb2f0b147ac5bc9d824a971e71e9a157aa7edfc62851df6e93095d821f" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\5b21ad0ee98ac2e71e6ba8c0fb416490c08e0f093fd1ea4618ed407c60d2e8ae" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\60d31850d3e6bb4c78bed92a155716ff35c37847f19bdb292444f49b3bcb0361" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\63a44284cc2a8e54a39c5963f5373798abe2565d0336978a8a1b690b3a9956d9" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\69bf72ff063b5df1cfd9ea84eda3684721708a7bc9d0f631cf6137128d45e374" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\6a9d14344ff1fede666f42a1dbb760830886efc1b40b458b40473c03f56ed131" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\750498dcd5a51f53de6fabd913dd22554f3ce0e4fdbc1aa2f6bacfad5d580be4" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\794ea173bf0102585dc8f5e3816f16985748a1ae7de6aaa49547e5f0178c3168" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\84f4ff1354fd830fb5f426366d404a6959ceb228946da2e21c69269889f0d456" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\8db44195777d28178ae527bb242b941777af8893c90267758a8730dfc9976533" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\97f9e7f8027b7e30f0008404ec531c2481e0547d3f2c009e86a045434bcb3b2a" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\9cfb21fb3c3428a89b122eab28e9a87f646f7d5d6ee4c72b3bf8c8bdd73187d4" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\a6b721e6d25cfb46813ef67e7f94cd5ece0817b5f7c8a648a53fbeee341fba35" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\b27d1de9410e9b4fe75c586e79ba683f304c939d93600ce830ff42c59bc8e352" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\b5126c1dbb5a4eda79788729ed85fb02f40779da995c5142a4cd865327a54ff1" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\b9991c2c89c6ab7476e4c2b2885a3f28576b7c0ed1edc1b52f30788912e1fb06" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\bf22eb0f4cc50ace2d5597fd6b104e67f5bc8ee854efe9b484e5bcf62e91eee4" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\c0df1fe2d06779d6c0d6e2635ea60c093b3ee67ca70fe95e6fe158fef8e6bc8b" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\cb8b7660319a19eb750a3098b988da5c88233961e1b5ce143973bdff7488dfe9" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\cf546892f82fce4297ccd72c612861f9d4c8277014cdebfc392673feadab0f40" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\d51da1520146fd1d43e8f4db4e03b8292416cb4189125bc986af1b401fe9f066" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\d7ea4218d2cb76721073f2422a5b2d020bff6341cb992b50ed7e3abbb09c2179" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\e24b5810aedaa723d2db713ed4097a1ae5208e6ca85043466f0848f13d752446" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\ed7a60617a2e0e6eaf5554e9a7e0339e41f91149988126cdf02531ab2d675ede" /f
	reg delete "!tempHiveKey!\CanonicalData\Catalogs\f5bc8eb21c7544a72ba93d08b054ac3a3820d79ab66494e45c1c85451857aa1c" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_04458257afce9235" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_14367ebe36ec81ec" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_2a9dc3152397ea36" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_305de5eacbe6d31e" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_73bedac9749ce5dd" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_797efd9f1cebcec5" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_9446f9e50a475c08" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_b3b641e21f261125" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_bb246aa35ec9968e" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_cb156709e5e78645" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_dd6811995b4c57af" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_fcd75996702b0ccc" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0d0addedbd93bd64" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_a6ae0230df3a0106" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_bd7ccd16c08af7a4" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d5ab67b0304a810e" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_0ee12fd28be853dd" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_17dd964527a1a5d1" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_22a6375a9d2ff895" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_2a2831b323b92b8e" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_38875b2b5c6c0bb0" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_45deb612d897c210" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_768413a20032b3c6" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_a24de43ee7742e76" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_e3416e3abfdb2c44" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_eff572eeb21d5fb5" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_f1dccbf00e97b78b" /f
	reg delete "!tempHiveKey!\CanonicalData\Deployments\microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_fc3529be4c394449" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-r..ge-wow64-deployment_31bf3856ad364e35_10.0.14393.0_none_d5ab67b0304a810e" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-r..language-deployment_31bf3856ad364e35_10.0.14393.0_none_a6ae0230df3a0106" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-r..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_2a9dc3152397ea36" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-r..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_9446f9e50a475c08" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-r..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_73bedac9749ce5dd" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-r..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_dd6811995b4c57af" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..4-avcore-deployment_31bf3856ad364e35_10.0.14393.0_none_0d0addedbd93bd64" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_0a883718ee1110cd" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_d04f747b496f499d" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_305de5eacbe6d31e" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_b3b641e21f261125" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_bb246aa35ec9968e" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_en-us_cb156709e5e78645" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_04458257afce9235" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_14367ebe36ec81ec" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_797efd9f1cebcec5" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..oyment-languagepack_31bf3856ad364e35_10.0.14393.0_ru-ru_fcd75996702b0ccc" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..s-avcore-deployment_31bf3856ad364e35_10.0.14393.0_none_bd7ccd16c08af7a4" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_22a6375a9d2ff895" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_2a2831b323b92b8e" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_38875b2b5c6c0bb0" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_768413a20032b3c6" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_a24de43ee7742e76" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..ecoreuap-deployment_31bf3856ad364e35_10.0.14393.0_none_fc3529be4c394449" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_10.0.14393.0_none_0ee12fd28be853dd" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_10.0.14393.0_none_17dd964527a1a5d1" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_10.0.14393.0_none_45deb612d897c210" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_10.0.14393.0_none_e3416e3abfdb2c44" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_10.0.14393.0_none_eff572eeb21d5fb5" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_10.0.14393.0_none_f1dccbf00e97b78b" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-r..ral-language-client_31bf3856ad364e35_10.0.14393.0_none_e9f98a40bc58c4f0" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..ortedlanguage_en-us_31bf3856ad364e35_10.0.14393.0_none_5ff9e0110edd1081" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..zer-en-us-n-onecore_31bf3856ad364e35_10.0.14393.0_none_e38b630b4675c8a1" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speech-iekillbits_31bf3856ad364e35_10.0.14393.0_none_ce70003f238c2bac" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speechrecognizer-en-us_31bf3856ad364e35_10.0.14393.0_none_e4833550031f5124" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-t..peech-en-us-onecore_31bf3856ad364e35_10.0.14393.0_none_29715d649f8f81f6" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-t..peech-ru-ru-onecore_31bf3856ad364e35_10.0.14393.0_none_d4edd088d05e1677" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-t..tospeech-en-us-male_31bf3856ad364e35_10.0.14393.0_none_073753c462fde142" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-texttospeech-en-us_31bf3856ad364e35_10.0.14393.0_none_85d92b7859351ee0" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-texttospeech-ru-ru_31bf3856ad364e35_10.0.14393.0_none_607fcd75a4b823e1" /f
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-voiceactivation-en-us_31bf3856ad364e35_10.0.14393.0_none_236ac34309cea932" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-r..ral-language-client_31bf3856ad364e35_10.0.14393.0_none_f44e3492f0b986eb" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-s..xperience.resources_31bf3856ad364e35_10.0.14393.0_en-us_d71da304fe9f3a83" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-s..xperience.resources_31bf3856ad364e35_10.0.14393.0_ru-ru_203ebab94fa4362a" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-s..zer-en-us-n-onecore_31bf3856ad364e35_10.0.14393.0_none_ede00d5d7ad68a9c" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speechcommonnoia64_31bf3856ad364e35_10.0.14393.0_none_3a729ccd0ea393ce" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speechrecognizer-en-us_31bf3856ad364e35_10.0.14393.0_none_eed7dfa23780131f" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-t..peech-en-us-onecore_31bf3856ad364e35_10.0.14393.0_none_33c607b6d3f043f1" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-t..peech-ru-ru-onecore_31bf3856ad364e35_10.0.14393.0_none_df427adb04bed872" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-t..tospeech-en-us-male_31bf3856ad364e35_10.0.14393.0_none_118bfe16975ea33d" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-texttospeech-ru-ru_31bf3856ad364e35_10.0.14393.0_none_6ad477c7d918e5dc" /f
	reg delete "!tempHiveKey!\DerivedData\Components\x86_microsoft-windows-speech-iekillbits_31bf3856ad364e35_10.0.14393.0_none_725164bb6b2eba76" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-onecore-r..ge-wow64-deployment_31bf3856ad364e35_none_fd8e840e21b42f31" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-onecore-r..language-deployment_31bf3856ad364e35_none_c8bae1819c7d20f9" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-onecore-s..4-avcore-deployment_31bf3856ad364e35_none_36493637bcac0c0b" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-onecore-s..ecoreuap-deployment_31bf3856ad364e35_none_efd636e47e653baa" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-onecore-s..ecoreuap-deployment_31bf3856ad364e35_none_f735d9560277355a" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-onecore-s..s-avcore-deployment_31bf3856ad364e35_none_0952e47a4a9093cb" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_none_0b0fb476fb146d1a" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_none_5a7a46364aa41c2b" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_none_84a35a22b9ab99bf" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_none_c25e08f42572b75c" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_none_d07d4e9077ffd5c6" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-l..-enduser-deployment_31bf3856ad364e35_none_e7a0afe04c2afa02" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-r..ral-language-client_31bf3856ad364e35_none_7c9548cf6779b5df\v!10.0.14393.0" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-s..ortedlanguage_en-us_31bf3856ad364e35_none_1b42f7e0ec877496" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-s..zer-en-us-n-onecore_31bf3856ad364e35_none_313230a19104b576" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-speech-iekillbits_31bf3856ad364e35_none_1e47a49eb1578e03" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-speechrecognizer-en-us_31bf3856ad364e35_none_cd9d87acd163a64b" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-t..peech-en-us-onecore_31bf3856ad364e35_none_0ac8fd46871e4b89" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-t..peech-ru-ru-onecore_31bf3856ad364e35_none_e390228b2c5cacd0" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-t..tospeech-en-us-male_31bf3856ad364e35_none_f9f5cc95aa4aeb9d" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-texttospeech-en-us_31bf3856ad364e35_none_ff182e5b00b68f6f" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-texttospeech-ru-ru_31bf3856ad364e35_none_1780d9dcdbe0e436" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\amd64_microsoft-windows-voiceactivation-en-us_31bf3856ad364e35_none_e939f0fced17472d" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-r..ral-language-client_31bf3856ad364e35_none_86e9f3219bda77da\v!10.0.14393.0" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-s..xperience.resources_31bf3856ad364e35_en-us_1809478f9a4f2b02" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-s..xperience.resources_31bf3856ad364e35_ru-ru_666774711f8780d3" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-s..zer-en-us-n-onecore_31bf3856ad364e35_none_3b86daf3c5657771" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-speechcommonnoia64_31bf3856ad364e35_none_5ec6d76e0a4eaf4f" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-speechrecognizer-en-us_31bf3856ad364e35_none_d7f231ff05c46846" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-t..peech-en-us-onecore_31bf3856ad364e35_none_151da798bb7f0d84" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-t..peech-ru-ru-onecore_31bf3856ad364e35_none_ede4ccdd60bd6ecb" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-t..tospeech-en-us-male_31bf3856ad364e35_none_044a76e7deabad98" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\wow64_microsoft-windows-texttospeech-ru-ru_31bf3856ad364e35_none_21d5842f1041a631" /f
	reg delete "!tempHiveKey!\DerivedData\VersionedIndex\10.0.14393.350 (rs1_release.161013-1725)\ComponentFamilies\x86_microsoft-windows-speech-iekillbits_31bf3856ad364e35_none_c229091af8fa1ccd" /f


	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-d..onmanager-component_31bf3856ad364e35_10.0.14393.0_none_fc75d74edf59d3e7" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-i..inghelper-component_31bf3856ad364e35_10.0.14393.0_none_318b8434ed78e60e" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..chservice-component_31bf3856ad364e35_10.0.14393.0_none_db117e6ba291ba86" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..chservice-component_31bf3856ad364e35_10.0.14393.206_none_e7a1500329a8306a" /v "f!speechbrokeredapi.dll" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..chservice-component_31bf3856ad364e35_10.0.14393.206_none_e7a1500329a8306a" /v "f!speechruntime.exe" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-onecore-s..chservice-component_31bf3856ad364e35_10.0.14393.206_none_e7a1500329a8306a" /v "f!speechservicewinrtapi.pro_8c91080d80fe0a71" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-analog-voice-adapters_31bf3856ad364e35_10.0.14393.0_none_d1b7a14781422fdf" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-s..voicecommon-onecore_31bf3856ad364e35_10.0.14393.0_none_62b5e369f636d30b" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speechcommon-onecore_31bf3856ad364e35_10.0.14393.0_none_a0cd81f03476c058" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speechengine-onecore_31bf3856ad364e35_10.0.14393.0_none_0bab5791e90fa16d" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speech-pal-desktop_31bf3856ad364e35_10.0.14393.206_none_ba2eb68e27d9f588" /v "f!windows.speech.pal.deskto_ac8ec17bda61895c" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speechpal-desktop_31bf3856ad364e35_10.0.14393.206_none_c17af230b41a1491" /v "f!speechpal.dll" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_microsoft-windows-speech-windows_31bf3856ad364e35_10.0.14393.0_none_f1b7e0ff6c220793" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_multimedia-voiceactivationmanager_31bf3856ad364e35_10.0.14393.0_none_0ea53ed6da1fbef9" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_bd7ccd16c08af7a4" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_10.0.14393.0_en-us_9186c038ab55d881" /v "c!microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_b3b641e21f261125" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_10.0.14393.0_en-us_9186c038ab55d881" /v "c!microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_fcd75996702b0ccc" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.0_none_40ef7c0160a1bf8c" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0a883718ee1110cd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_4d443e70e7e53f99" /v "f!speech-synthesis.xsd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_4d443e70e7e53f99" /v "f!synthesis-core.xsd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_4d443e70e7e53f99" /v "f!windows.media.speech.dll" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_4d443e70e7e53f99" /v "f!windows.media.speech.uxre_be5691ea15f31de0" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\amd64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_4d443e70e7e53f99" /v "f!xml.xsd" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-onecore-d..onmanager-component_31bf3856ad364e35_10.0.14393.0_none_06ca81a113ba95e2" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-onecore-i..inghelper-component_31bf3856ad364e35_10.0.14393.0_none_3be02e8721d9a809" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-onecore-s..chservice-component_31bf3856ad364e35_10.0.14393.0_none_e56628bdd6f27c81" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-onecore-s..chservice-component_31bf3856ad364e35_10.0.14393.206_none_f1f5fa555e08f265" /v "f!speechservicewinrtapi.pro_8c91080d80fe0a71" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-s..voicecommon-onecore_31bf3856ad364e35_10.0.14393.0_none_6d0a8dbc2a979506" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speechcommon-onecore_31bf3856ad364e35_10.0.14393.0_none_ab222c4268d78253" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speechcommon-onecore_31bf3856ad364e35_10.0.14393.351_none_b776eeb1f01b0260" /v "f!sapi_onecore.dll_fd2920efaedb8a9f" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speechcommon-onecore_31bf3856ad364e35_10.0.14393.351_none_b776eeb1f01b0260" /v "f!speechmodeldownload.exe" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speechengine-onecore_31bf3856ad364e35_10.0.14393.0_none_160001e41d706368" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speech-pal-desktop_31bf3856ad364e35_10.0.14393.206_none_c48360e05c3ab783" /v "f!windows.speech.pal.deskto_ac8ec17bda61895c" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-speech-windows_31bf3856ad364e35_10.0.14393.0_none_fc0c8b51a082c98e" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_multimedia-voiceactivationmanager_31bf3856ad364e35_10.0.14393.0_none_18f9e9290e8080f4" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_0d0addedbd93bd64" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_microsoft-windows-texttospeech-en-us_31bf3856ad364e35_10.0.14393.0_none_902dd5ca8d95e0db" /v "c!microsoft-w..-deployment_31bf3856ad364e35_10.0.14393.0_f1dccbf00e97b78b" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_10.0.14393.0_en-us_9bdb6a8adfb69a7c" /v "c!microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_14367ebe36ec81ec" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_10.0.14393.0_en-us_9bdb6a8adfb69a7c" /v "c!microsoft-o..anguagepack_31bf3856ad364e35_10.0.14393.0_cb156709e5e78645" /f" 
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.0_none_4b44265395028187" /v "c!microsoft-o..-deployment_31bf3856ad364e35_10.0.14393.0_d04f747b496f499d" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_5798e8c31c460194" /v "f!windows.media.speech.dll" /f
	reg delete "!tempHiveKey!\DerivedData\Components\wow64_windows-media-speech-winrt_31bf3856ad364e35_10.0.14393.351_none_5798e8c31c460194" /v "f!windows.media.speech.uxre_be5691ea15f31de0" /f

	echo Unloading user hive: !tempHiveKey!
	reg unload "!tempHiveKey!"
)

REM Define an array of registry keys
set "regKeys[0]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-onecore-i..inghelper-component_31bf3856ad364e35_none_4d7df354b759b231\10.0"
set "regKeys[1]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..ce-common.resources_31bf3856ad364e35_en-us_cc8eca20f2f8ec5d\10.0"
set "regKeys[2]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..erexperience-common_31bf3856ad364e35_none_70a5c4921aed5d1c\10.0"
set "regKeys[3]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..iagnostic.resources_31bf3856ad364e35_en-us_ce08e005cda91d4e\10.0"
set "regKeys[4]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..monnoia64.resources_31bf3856ad364e35_en-us_d9822d86d5e96bc1\10.0"
set "regKeys[5]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..voicecommon-onecore_31bf3856ad364e35_none_ff1f383bef4497dc\10.0"
set "regKeys[6]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..xperience.resources_31bf3856ad364e35_en-us_0db49d3d65ee6907\10.0"
set "regKeys[7]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-s..xperience.resources_31bf3856ad364e35_ru-ru_5c12ca1eeb26bed8\10.0"
set "regKeys[8]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-shenzhouttsvoicecommon_31bf3856ad364e35_none_f4aa17dfe3a89542\10.0"
set "regKeys[9]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speech-userexperience_31bf3856ad364e35_none_44c7f25e1c201984\10.0"
set "regKeys[10]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speech-windows_31bf3856ad364e35_none_7a8af7fee22a7594\10.0"
set "regKeys[11]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speechcommon_31bf3856ad364e35_none_5c31ed2262792e3d\10.0"
set "regKeys[12]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speechcommonnoia64_31bf3856ad364e35_none_54722d1bd5eded54\10.0"
set "regKeys[13]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speechdiagnostic_31bf3856ad364e35_none_bd542641b133f131\10.0"
set "regKeys[14]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speechengine-onecore_31bf3856ad364e35_none_15c28b5e299e480a\10.0"
set "regKeys[15]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speechengine.resources_31bf3856ad364e35_en-us_61530d4d9af827d1\10.0"
set "regKeys[16]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-speechengine_31bf3856ad364e35_none_b680d33f853a2410\10.0"
set "regKeys[17]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_multimedia-voiceactivationmanager_31bf3856ad364e35_none_18f5644cb9800bde\10.0"
set "regKeys[18]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_de-de_507cd27ea059d173\10.0"
set "regKeys[19]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_en-gb_7e111f82be293973\10.0"
set "regKeys[20]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_en-us_7d596b6abeb2ec96\10.0"
set "regKeys[21]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_es-es_7d5e4e7cbeae98d9\10.0"
set "regKeys[22]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_es-mx_7d284e10bed70dc6\10.0"
set "regKeys[23]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_fr-ca_ab8abdf2dc0d6e91\10.0"
set "regKeys[24]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_fr-fr_aad2f4f8dc974107\10.0"
set "regKeys[25]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_it-it_32ffda43367543f9\10.0"
set "regKeys[26]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_ja-jp_6082eb4f5455d036\10.0"
set "regKeys[27]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_ko-kr_8de6265d72494850\10.0"
set "regKeys[28]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_pt-br_71013f7e07f4422f\10.0"
set "regKeys[29]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_windows-media-speech-winrt.resources_31bf3856ad364e35_zh-cn_374ccf25333d6294\10.0"
set "regKeys[30]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-onecore-d..onmanager-component_31bf3856ad364e35_none_ec4abacaed4c20db\10.0"
set "regKeys[31]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-onecore-i..inghelper-component_31bf3856ad364e35_none_57d29da6ebba742c\10.0"
set "regKeys[32]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-s..monnoia64.resources_31bf3856ad364e35_en-us_e3d6d7d90a4a2dbc\10.0"
set "regKeys[33]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-s..voicecommon-onecore_31bf3856ad364e35_none_0973e28e23a559d7\10.0"
set "regKeys[34]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-shenzhouttsvoicecommon_31bf3856ad364e35_none_fefec2321809573d\10.0"
set "regKeys[35]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-speech-userexperience_31bf3856ad364e35_none_4f1c9cb05080db7f\10.0"
set "regKeys[36]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-speech-windows_31bf3856ad364e35_none_84dfa251168b378f\10.0"
set "regKeys[37]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-speechengine-onecore_31bf3856ad364e35_none_201735b05dff0a05\10.0"
set "regKeys[38]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-texttospeech-en-us_31bf3856ad364e35_none_096cd8ad3517516a\10.0"
set "regKeys[39]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_multimedia-voiceactivationmanager_31bf3856ad364e35_none_234a0e9eede0cdd9\10.0"
set "regKeys[40]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_de-de_5ad17cd0d4ba936e\10.0"
set "regKeys[41]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_en-gb_8865c9d4f289fb6e\10.0"
set "regKeys[42]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_en-us_87ae15bcf313ae91\10.0"
set "regKeys[43]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_es-es_87b2f8cef30f5ad4\10.0"
set "regKeys[44]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_es-mx_877cf862f337cfc1\10.0"
set "regKeys[45]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_fr-ca_b5df6845106e308c\10.0"
set "regKeys[46]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_fr-fr_b5279f4b10f80302\10.0"
set "regKeys[47]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_it-it_3d5484956ad605f4\10.0"
set "regKeys[48]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_ja-jp_6ad795a188b69231\10.0"
set "regKeys[49]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_ko-kr_983ad0afa6aa0a4b\10.0"
set "regKeys[50]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_pt-br_7b55e9d03c55042a\10.0"
set "regKeys[51]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_windows-media-speech-winrt.resources_31bf3856ad364e35_zh-cn_41a17977679e248f\10.0"
set "regKeys[52]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-s..ce-common.resources_31bf3856ad364e35_en-us_70702e9d3a9b7b27\10.0"
set "regKeys[53]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-s..erexperience-common_31bf3856ad364e35_none_1487290e628febe6\10.0"
set "regKeys[54]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-speechcommon_31bf3856ad364e35_none_0013519eaa1bbd07\10.0"
set "regKeys[55]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-speechengine.resources_31bf3856ad364e35_en-us_053471c9e29ab69b\10.0"
set "regKeys[56]=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\x86_microsoft-windows-speechengine_31bf3856ad364e35_none_5a6237bbccdcb2da\10.0"

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

reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\amd64_microsoft-windows-r..ral-language-client_31bf3856ad364e35_none_7c9548cf6779b5df\10.0" /v "10.0.14393.0" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SideBySide\Winners\wow64_microsoft-windows-r..ral-language-client_31bf3856ad364e35_none_86e9f3219bda77da\10.0" /v "10.0.14393.0" /f

exit /b 0
