SetWorkingDir, %A_ScriptDir%

AdjustScreenToMatchTextFile(screenContents)
{
    global pid, ConWinWidth
    expectedText := RTrimAndRemoveBlankLines(screenContents, ConWinWidth)
    linesExpectedText := StrSplit(expectedText, "`n")
    pattern := "^\[(\d+)\] ([+-]) .+$"
    Loop
    {
        text := RTrimAndRemoveBlankLines(GetConsoleText())
        If ( text = expectedText ) ; Compare the current text with the expected text
        {
            Return
        }

        linesText := StrSplit(text, "`n")
        if (linesText.Length() < 3 || ( linesText[0] = "" && linesText[1] = "" && linesText[2] = "" && linesText[3] = "" && linesText[4] = "" && linesText[5] = "" )) {
            Sleep 100
            WriteLog("The Screen looks blank, i am going to loop again")
            continue
        }

        Loop % linesText.Length() ; Loop through each line
        {
            text := RTrimAndRemoveBlankLines(GetConsoleText())
            linesText := StrSplit(text, "`n")
            lineText := Trim(linesText[A_Index])
            lineExpectedText := Trim(linesExpectedText[A_Index])
            expectedlastLine := Trim(linesExpectedText[linesExpectedText.Length()])
            If (lineText = lineExpectedText)
            {
                continue
            }

            If RegExMatch(lineText, pattern, matchesLineText) 
            {
                If RegExMatch(lineExpectedText, pattern, matchesLineExpectedText) {
                    modifiedLineText := SubStr(lineText, 1, 5) . SubStr(lineText, 7)
                    modifiedLineExpectedText := SubStr(lineExpectedText, 1, 5) . SubStr(lineExpectedText, 7)
                    if ( modifiedLineText = modifiedLineExpectedText ) 
                    {
                        ControlSend, , %matchesLineText1%{Enter}, ahk_pid %pid%
                        Loop
                        {
                            currText := RTrimAndRemoveBlankLines(GetConsoleText())
                            linesCurrText := StrSplit(currText, "`n")
                            currlastLine := Trim(linesCurrText[linesCurrText.Length()])
                            if ( currlastLine != expectedlastLine ) {
                                Sleep 50
                            } else {
                                Break
                            }
                        }
                        Sleep 200
                    }
                } else {
                    MsgBox InEquality`n@%lineText%@`n@%lineExpectedText%@`nBoth the lines do not match and although captured text matches pattern but the file text doesn't match the pattern.
                    ExitApp    
                }
            } else {
                MsgBox InEquality`n@%lineText%@`n@%lineExpectedText%@`nBoth the lines do not match and captured text doesn't match the pattern too.
                ExitApp
            }
        }
    }
}
