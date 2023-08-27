SetWorkingDir, %A_ScriptDir%

WriteLog(textToWrite) {
    FileAppend, % A_NowUTC ": " textToWrite "`n", logfile.txt ; can provide a full path to write to another directory
}

WriteContentLog(textToWrite) {
    ; FileAppend, % "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`n", logfile_content.txt
    FileAppend, % A_NowUTC ": " textToWrite "`n", logfile_content.txt
    ; FileAppend, % "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`n", logfile_content.txt
}