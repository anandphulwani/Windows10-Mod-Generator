SetWorkingDir, %A_ScriptDir%

TraverseFolders(folderPath)
{
    Loop, Files, %folderPath%\*, DF
    {
        subfolderPathOrFile := A_LoopFileLongPath
        StringSplit, subfolderPathOrFileParts, subfolderPathOrFile, \
        folderIndex := subfolderPathOrFileParts0
        folderName := subfolderPathOrFileParts%folderIndex%   
            
        If (A_LoopFileAttrib = "D") ; Check if it's a directory
        {
            if ( SubStr(folderName, 1, 1) != "!" ) 
            {
                WriteLog("Traversing folder Start: " . subfolderPathOrFile)
                TraverseFolders(subfolderPathOrFile) ; Recursive call for subfolders
                WriteLog("Traversing folder Done: " . subfolderPathOrFile)
            }
        }
        Else
        {
            If (InStr(subfolderPathOrFile, ".txt") = StrLen(subfolderPathOrFile) - 3)
            {
                WriteLog("Processing folder Start: " . subfolderPathOrFile)
                ProcessFolder(subfolderPathOrFile)
                WriteLog("Processing folder Done: " . subfolderPathOrFile)
            }
        }
    }
}