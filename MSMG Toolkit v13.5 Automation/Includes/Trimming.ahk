SetWorkingDir, %A_ScriptDir%

RTrimAndRemoveBlankLines(textToModify, widthOfWindow = -1) ; Define the function to trim and remove blank lines
{
    result := ""
    lines := StrSplit(textToModify, "`r`n")
    If ( lines.Length() = 1)
    {
        lines := StrSplit(textToModify, "`n")
    }
    Loop % lines.Length()
    {
        line := RTrim(lines[A_Index])
        If (line != "") {
            if (widthOfWindow != -1 && StrLen(line) > widthOfWindow)
            {
                wrappedText := ""
                while (StrLen(line) > widthOfWindow) {
                    wrappedText .= RTrim(SubStr(line, 1, widthOfWindow)) . "`n"
                    line := SubStr(line, widthOfWindow + 1)
                }
                wrappedText .= RTrim(line)
                line := wrappedText
            }
            result .= line "`n"
        }
    }
    result := RTrim(result, "`r`n")
    return result
}
