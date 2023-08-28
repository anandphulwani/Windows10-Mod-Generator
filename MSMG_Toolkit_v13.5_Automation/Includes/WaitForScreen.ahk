SetWorkingDir, %A_ScriptDir%

WaitForScreen(screenContents, isType = "normal")
{
    global ConWinWidth
    startTime := A_TickCount
    timeout := 30000
    screentContentsNoOfLines := StrSplit(screenContents, "`n").Length()
    if ( screentContentsNoOfLines > 40 || isType = "block" )
    {
        timeout := 900000
    }
    WriteLog("screenContents is `n" . screenContents)
    
    olderText := ""
    Loop
    {
        text := RTrimAndRemoveBlankLines(GetConsoleText())
        expectedText := RTrimAndRemoveBlankLines(screenContents, ConWinWidth)

        ; If there are more lines in expectedtext, reduce it to match text
        if (isType = "normal" || isType = "regex")
        {
            textLines := StrSplit(text, "`n")
            expectedtextLines := StrSplit(expectedtext, "`n")
            lineCountDifference := expectedtextLines.Length() - textLines.Length() ; Calculate the difference in line counts
            if (lineCountDifference > 0) {
                Loop, % lineCountDifference
                    expectedtextLines.RemoveAt(1) ; Remove lines from the top of expectedtext
                expectedtext := ""
                Loop % expectedtextLines.Length()
                {
                    expectedtext .= expectedtextLines[A_Index] . "`n"
                }
                ; expectedText := RTrimAndRemoveBlankLines(expectedtext, ConWinWidth)
                expectedText := RTrimAndRemoveBlankLines(expectedtext)
            }
        }

        ; If Regex is set to yes, apply them
        ; if (isType = "regex")
        ; {
        ;     textLines := StrSplit(text, "`n")
        ;     expectedText := RTrimAndRemoveBlankLines(expectedtext, ConWinWidth)
        ;     expectedtextLines := StrSplit(expectedtext, "`n")

        ;     text := ""
        ;     expectedtext := ""
        ;     Loop % expectedtextLines.Length()
        ;     {
        ;         if ( expectedtextLines[A_Index] != "**REGEX AVOID**" )
        ;         {
        ;             text .= textLines[A_Index] . "`n"
        ;             expectedtext .= expectedtextLines[A_Index] . "`n"
        ;         }
        ;     }
        ;     text := RTrimAndRemoveBlankLines(text)
        ;     expectedText := RTrimAndRemoveBlankLines(expectedtext)
        ;     ; MsgBox, % text
        ;     ; MsgBox, % expectedText
        ;     WriteLog(text)
        ;     WriteLog(expectedText)
        ; }

 
        if (isType = "block")
        {
            WriteLog("is Type is block")
            expectedtextBlocks := StrSplit(expectedtext, "**BLOCK SEPERATOR**")
            isAllBlocksMatched := true
            Loop % expectedtextBlocks.Length()
            {
                expectedtextBlock := RTrimAndRemoveBlankLines(expectedtextBlocks[A_INDEX], ConWinWidth)
                if (!InStr(text, expectedtextBlock))
                {
                    WriteLog(text)
                    WriteLog(expectedtextBlock)
                    isAllBlocksMatched := false
                    Break
                }
                Else
                {
                    WriteLog("Block matched: " . A_INDEX)
                }
            }
            If ( isAllBlocksMatched )
            {
                Sleep 100
                WriteLog("now returing from blocks")
                Return
            }
        }
        Else
        {
            If ( text = expectedText )
            {
                Sleep 100
                WriteLog("now returing")
                Return
            }
        }
        If ( olderText != text )
        {
            startTime := A_TickCount 
        }
        if (A_TickCount - startTime >= timeout)
        {
            linesExpectedText := StrSplit(expectedText, "`n")
            linesText := StrSplit(text, "`n")
            Loop % linesText.Length()
            {
                lineText := linesText[A_Index]
                lineExpectedText := linesExpectedText[A_Index]
                if (lineText != lineExpectedText) {
                    MsgBox, @%lineText%@`n@%lineExpectedText%@
                }
            }    
            ExitApp
        }
        olderText := text
        Sleep 200
    }
    WriteLog("exited out of the loop")
}
