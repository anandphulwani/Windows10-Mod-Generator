SetWorkingDir, %A_ScriptDir%

ProcessFolder(fullFileName)
{
    WriteLog("ProcessFolder Starts")
    global pid
    If (InStr(fullFileName, "screen.txt") = StrLen(fullFileName) - 9)
    {
        FileRead, fileContents, %fullFileName%
        WriteLog("ProcessFolder -----> WaitForScreen Starts")
        WaitForScreen(fileContents, "normal")
        WriteLog("ProcessFolder -----> WaitForScreen Ends")
    }
    Else If (InStr(fullFileName, "screentomatch.txt") = StrLen(fullFileName) - 16)
    {
        FileRead, fileContents, %fullFileName%
        AdjustScreenToMatchTextFile(fileContents)
    }
    Else If (InStr(fullFileName, "screenregex.txt") = StrLen(fullFileName) - 14)
    {
        FileRead, fileContents, %fullFileName%
        WriteLog("ProcessFolder -----> WaitForScreen Regex Starts")
        WaitForScreen(fileContents, "regex")
        WriteLog("ProcessFolder -----> WaitForScreen Regex Ends")
    }
    Else If (InStr(fullFileName, "screenblocks.txt") = StrLen(fullFileName) - 15)
    {
        FileRead, fileContents, %fullFileName%
        WriteLog("ProcessFolder -----> WaitForScreen Blocks Starts")
        WaitForScreen(fileContents, "block")
        WriteLog("ProcessFolder -----> WaitForScreen Blocks Ends")
    }
    Else
    {
        MsgBox, Found different text file %fullFileName%
        ExitApp
    }

    ; Extract values from the folder name
    StringSplit, fullFileNameParts, fullFileName, \
    folderIndex := fullFileNameParts0 - 1
    folderName := fullFileNameParts%folderIndex%
    
    if (RegExMatch(folderName, "^(?!_)[^_]+_[^_]+$"))
    {
        StringSplit, folderParts, folderName, _
        latterValue := folderParts2
        latterValueParts := ""
        if (RegExMatch(latterValue, "^(.*)-[^-]+$"))
        {
            StringSplit, latterValueParts, latterValue, -
        }
        else
        {
            latterValueParts1 := latterValue
            latterValueParts2 := "WOEnt"
        }
        
        consoleText := RTrimAndRemoveBlankLines(GetConsoleText()) . " "
        If (latterValueParts2 = "WOEnt" || latterValueParts2 = "WOEntIgnM")
        {
            Loop 
            {
                ControlSend, , %latterValueParts1%, ahk_pid %pid%
                Sleep, 300
                If ( latterValueParts2 = "WOEntIgnM" || consoleText != RTrimAndRemoveBlankLines(GetConsoleText()) . " ")
                {
                    Break
                }
            }
        }
        Else If (latterValueParts2 = "WEnt" || latterValueParts2 = "WEntIgnM")
        {
            Loop 
            {
                ControlSend, , %latterValueParts1%, ahk_pid %pid%
                Sleep, 300
                If ( latterValueParts2 = "WEntIgnM" || RTrimAndRemoveBlankLines(consoleText . latterValueParts1) = RTrimAndRemoveBlankLines(GetConsoleText()))
                {
                    Break
                }
            }
            consoleText := GetConsoleText()
            Loop 
            {
                ControlSend, , {Enter}, ahk_pid %pid%
                Sleep, 300
                If ( latterValueParts2 = "WEntIgnM" || consoleText != RTrimAndRemoveBlankLines(GetConsoleText()) . " ")
                {
                    Break
                }
            }
        }
        Else
        {
            MsgBox, String after "-" is not "WEnt" nor it is "WOEnt"
        }
    }
    WriteLog("ProcessFolder Ends")
}
