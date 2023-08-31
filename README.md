# Windows 10 Mod Generator

Welcome to the Windows 10 Mod Generator repository, a hub for tools and scripts dedicated to creating custom Windows 10 ISO images. Among these resources is a versatile toolkit that streamlines your Windows 10 installation process. This toolkit empowers you to integrate device drivers seamlessly, customize feature packs, incorporate updates, optimize your installation's footprint, personalize themes, and efficiently deploy your tailored Windows installation image. 

## Important Points

Before using the Windows 10 Mod Generator toolkit, consider the following:

1. **File Path Length Limitation:** To ensure smooth operation, extract the toolkit and associated files in the root path of your drive (e.g., `C:\`) to avoid potential issues related to long file paths. This prevents any limitations imposed by long file paths and ensures seamless functionality.

2. **Avoid Spaces in Folder Names:** The toolkit may encounter errors when processing folders with spaces in their names. To prevent this, ensure that the folder names you use for paths and operations do not contain spaces.

## Creating a Custom Windows 10 ISO

Crafting your personalized Windows 10 ISO involves a detailed and systematic four-step process that empowers you to tailor your installation exactly to your liking.

1. **[Download Windows 10 Latest and 1607 Versions](#step-1-download-windows-10-latest-and-1607-versions):** Begin by downloading the latest Windows 10 version alongside the 1607 version. These versions provide the essential foundation for creating your custom ISO.

2. **[Utilize the MSMG Toolkit for Stripping Features](#step-2-utilize-the-msmg-toolkit-for-stripping-features):** Leverage the power of the MSMG Toolkit to efficiently strip unwanted features from your Windows installation. This toolkit simplifies the process of removing unnecessary components, optimizing the footprint of your installation while ensuring a smooth and streamlined setup.

3. **[NTLite: Observe and Record Removal of Additional Features](#step-3-ntlite-observe-and-record-removal-of-additional-features):** Utilize NTLite to meticulously observe and record the removal of features that cannot be stripped using the MSMG Toolkit. This tool helps identify and document these additional components, setting the stage for further customization.

4. **[Ameliorated: Embed Changes and Apply the Playbook](#step-4-ameliorated-embed-changes-and-apply-the-playbook):** Building upon the insights gained from NTLite, use Ameliorated to embed the observed changes into a playbook. This playbook captures your preferences and modifications, ensuring consistent and efficient customization. Apply the playbook to implement these changes seamlessly into your Windows installation image.

With these four steps, you can effortlessly create a custom Windows 10 ISO tailored to your exact specifications. Explore each stage in the process to unleash the full potential of your customized Windows experience.


## Creating a Custom Windows 10 ISO

Crafting your personalized Windows 10 ISO involves a detailed and systematic four-step process that empowers you to tailor your installation exactly to your liking.

### Step 1: Download Windows 10 Latest and 1607 Versions

Begin by downloading the latest Windows 10 version alongside the 1607 version. These versions provide the essential foundation for creating your custom ISO.

#### Steps to download
1. To download the latest Windows 10, go to `https://www.microsoft.com/en-us/software-download/windows10`, select `Download Now` from `Create Windows 10 installation media` section to download `MediaCreationTool22H2.exe`.
2. Run `MediaCreationTool22H2.exe`, select `Create Installation Media` option, Unselect `Use the recommended options for this PC` and select the following options: `Langugage: English (United States)`, `Edition: Windows 10`, `Architecture: Both`, in "Choose which media to use" select `ISO file`, select the path and filename where you want to save the file and select OK, select `Finish` and wait for it to complete and finish up.
3. To download Windows 10 1607 version, download it from `https://archive.org/download/microsoft-windows-10-1607-oct-2016-64-bit/Microsoft_Windows_10_1607_Oct_2016_64_Bit.iso`.

### Step 2: Utilize the MSMG Toolkit for Stripping Features

Leverage the power of the **MSMG Toolkit** to efficiently strip unwanted features from your Windows installation. This toolkit simplifies the process of removing unnecessary components, optimizing the footprint of your installation while ensuring a smooth and streamlined setup.

#### Steps to Use
1. Navigate to a drive's root directory, which has at least 30 GB of free space.
   ```
   cd /D <DRIVE NANE>:
   ```
2. Create a directory with the name "WMG folder" (or any name of your choice, but keep it very short) and navigate to the newly created directory using the command line:
   ```
   mkdir WMG && cd WMG
   ```
3. Use the latest Windows 10 downloaded above, if you have ESD file in the contents, use NTLITE or other tool to convert ESD into WIM, if using NTLITE, just loading the image into NTLITE will do the conversion.
4. Copy the above contents into `MSMG_Toolkit_v13.5/DVD`
5. Clone the contents of this repository into the "WMG folder":
   ```
   git clone https://github.com/anandphulwani/Windows10-Mod-Generator.git .
   ```
4. Run the `RunMSMGAutomation.bat` script with administrative privileges or run the `RunMSMGAutomation.exe` directly which will request automatically for administrative priviliges.

### Step 3: NTLite - Observe and Record Removal of Additional Features (Optional)

Utilize **NTLite** to meticulously observe and record the removal of features that cannot be stripped using the MSMG Toolkit. This tool helps identify and document these additional components, setting the stage for further customization.
This is being done since we do not have a cracked version of the latest NTLITE 2023 version which supports Windows 10 22H2, the earlier version which we have only supports older version like Windows 10 1607.
So we are noting the changes from the old and doing the same changes in the new version.

#### Steps to Use
1. Install `BeyondCompare` and `regdiff.exe`.
2. We need to use the WIM file, if you have ESD file, use NTLITE to load the ESD file from the above downloaded Windows 10 1607 version, loading will automatically convert it to WIM.
3. Once it is convereted, you need to create two copies of the above files, put one in `Base_Win10_1607` and another in `Win10_1607` folder.
4. Using the following command to mount `DISM /Mount-WIM /imagefile:<PATH TO WIM>\Base_Win10_1607\install.wim /Index:1 /MountDir:<DRIVE NAME>\Base_Win10_1607_extract /readonly` to create a base copy to compare.
6. Using NTLITE, load install.wim from `Win10_1607` to `Win10_1607_extract`.
7. Apply all the removal operations.
8. Using BeyondCompare, compare `Base_Win10_1607_extract` and `Win10_1607_extract`, this will show files which are removed, modified. Select those files and copy thsoe changes files from the folder `Base_Win10_1607_extract` to `BeforeChange` and from `Win10_1607_extract` to `AfterChange`.
9. Note down the changes in registry can be compared using `https://github.com/anandphulwani/Registry-Tools/#registrychangesview`, the registry hives located in `Windows\System32\Config` folder.
10. To compare using registrychangesview, create a dummy snapshot using the following command:
    `RegistryChangesView.exe /CreateSnapshot ".\Dummy" /CreateSnapshot.SoftwareHive 1 /CreateSnapshot.SystemHive 1 /CreateSnapshot.NTUserHive 1 /CreateSnapshot.UsrClassHive 1 /CreateSnapshot.DefaultHive 1 /CreateSnapshot.BCD00000000Hive 1 /CreateSnapshot.SAMHive 1 /CreateSnapshot.SecurityHive 1`
11. Take the registry hives files which are changed noted above to look in the same format as been output by the dummy command and put it in `AfterChange/Snapshot2` folder.
12. Take the same registry hives files from `Base_Win10_1607_extract` folder and put it in `BeforeChange/Snapshot1` folder.
14. Calculate the difference using this command:
    `RegistryChangesView.exe /DataSourceDirection 1 /DataSourceType1 2 /DataSourceType2 2 /RegSnapshotPath1 "AfterChange\Snapshot2"  /RegSnapshotPath2 "BeforeChange\Snapshot1" /sreg ".\RegistryDifference.reg"`
15. For any other hive files which is not in the same format as created by dummy, you can use following command to take out the difference for every single file, for an e.g. for NTUSER.DAT hive the command will be
    ```
    REM ===================================================================
    REM NTUSER.DAT
    REM ===================================================================

    reg unload HKLM\OFFLINE_TEMP_PATH & ^
    reg load HKLM\OFFLINE_TEMP_PATH .\BeforeChange\Snapshot1\NTUSER.DAT && ^
    reg export HKLM\OFFLINE_TEMP_PATH BeforeChange\Snapshot1\NtUserDat.reg && ^
    reg unload HKLM\OFFLINE_TEMP_PATH

    reg unload HKLM\OFFLINE_TEMP_PATH & ^
    reg load HKLM\OFFLINE_TEMP_PATH .\AfterChange\Snapshot2\NTUSER.DAT && ^
    reg export HKLM\OFFLINE_TEMP_PATH AfterChange\Snapshot2\NtUserDat.reg && ^
    reg unload HKLM\OFFLINE_TEMP_PATH

    ..\regdiff.exe BeforeChange\Snapshot1\NtUserDat.reg AfterChange\Snapshot2\NtUserDat.reg >> RegDiffNtUserDat.txt
    ```
20. Also you need to unload the read only WIM you mounted earlier using the command
    `DISM /Unmount-WIM /MountDir:<DRIVE NAME>\Base_Win10_1607_extract /Discard`
21. Note down all the files changes removed, modified and registry changes. Use them to add to the Ameliorated playbook in the next step.

### Step 4: Ameliorated - Embed Changes and Apply the Playbook

Building upon the insights gained from NTLite, use Ameliorated to embed the observed changes into a playbook. This playbook captures your preferences and modifications, ensuring consistent and efficient customization. Apply the playbook to implement these changes seamlessly into your Windows installation image.

#### Steps to Use
1. The differences noted above have to applied using playbooks in the below format, you can see actions from this url: `https://docs.ameliorated.io/developers/actions.html`, in the below format replace all parts which are in `angle brackets <>`.
```
title: <YOUR TITLE>
description: <YOUR DESCRIPTION>
privilege: TrustedInstaller
actions:
    # ---------- <COMMENT>
  - !taskKill: {name: "<PROCESS NAME TO KILL WITHOUT EXTENSION>"}
  - !file: {path: '<FILE PATHNAME TO DELETE, USE VARIABLES LIKE %windir%, %ProgramData% ETC>'}
  - !registryKey: {path: 'HKLM\<REGISTRY KEY PATH>'}
  - !registryValue: {path: 'HKLM\<REGISTRY VALUE PATH>', value: '<REGISTRY VALUE DATA>', operation: <OPERATION>}
  - !run: {exeDir: true, exe: "<BATCH FILENAME.BAT TO RUN>", weight: 20}
```
2. You have to use batch file for the hives that are user specific like `NTUSER.DAT`, for which you will have to traverse all user accounts.
3. Also for some keys the default value is a version number, and that same version number is a key, for those also you have to use the batch file.
4. You can refer to examples like, in these order:
```
disable-narrator.yml
disable-charactermap.yml
disable-snippingtool.yml
disable-performancemonitor-resourcemonitor.yml
disable-diskdefragmentation.yml
disable-speechrecognition.yml
change-windowsmenuitems.yml

disable-narrator.bat
disable-charactermap.bat
disable-snippingtool.bat
disable-performancemonitor-resourcemonitor.bat
disable-diskdefragmentation.bat
disable-speechrecognition.bat
```

## Contributing

Contributions to this project are welcome! If you have ideas for improvements, encounter issues, or want to add functionality, feel free to contribute by opening issues or submitting pull requests. Make sure to follow the established coding standards and maintain documentation for any changes.

## License

The Windows 10 Mod Generator is licensed under the MIT License. You're free to use, modify, and distribute the toolkit and associated scripts according to the terms of the license.