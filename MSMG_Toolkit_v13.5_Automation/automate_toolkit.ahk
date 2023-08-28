#NoEnv
#SingleInstance, Force

#Include Includes\\ConsoleAutomation.ahk ; Include the key-value pairs from the separate file
#Include Includes\Logging.ahk
#Include Includes\\Trimming.ahk
#Include Includes\\TraverseFolders.ahk
#Include Includes\\ProcessFolder.ahk
#Include Includes\\WaitForScreen.ahk
#Include Includes\\AdjustScreenToMatchTextFile.ahk

SendMode Input
SetKeyDelay, 50, 50
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2

Run "..\\MSMG_Toolkit_v13.5\\Start.cmd"

WinWait, :  MSMG Toolkit v13.5,,30
WinActivate, :  MSMG Toolkit v13.5,,30
WinWaitActive, :  MSMG Toolkit v13.5,,30

WinGet, pid, PID , :  MSMG Toolkit v13.5
if ErrorLevel
{
	MsgBox, WinWait timed out.
	ExitApp
}
AttachConsole(pid)
Sleep, 4000

TraverseFolders("Structure")
WriteLog("Done")

; Loop, 15
; {
;     Sleep, 15000
;     text := GetConsoleText()
;     Clipboard := text
;     MsgBox, %text%
; }

ExitApp