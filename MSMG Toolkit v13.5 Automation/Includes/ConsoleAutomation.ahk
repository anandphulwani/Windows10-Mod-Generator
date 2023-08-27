SetWorkingDir, %A_ScriptDir%


ConWinWidth := 500

; http://www.autohotkey.com/forum/post-32244.html#32244

Edit_LineColToIndex( p_hw, p_control, p_line, p_col ) 
{
	index := Edit_GetLineIndex( p_hw, p_control, p_line ) 
	return, index+( p_col-1 )
} 

Edit_GetLineIndex( p_hw, p_control, p_line ) 
{
	EM_LINEINDEX = 0xBB 
	SendMessage, EM_LINEINDEX, p_line-1, 0, %p_control%, ahk_id %p_hw% 
	return, ErrorLevel
} 

Edit_GetLineLength( p_hw, p_control, p_line ) 
{
	EM_LINELENGTH = 0x00C1 
	Send, EM_LINELENGTH, Edit_GetLineIndex( p_hw, p_control, p_line ), 0, p_control, ahk_id %p_hw% 
	return, ErrorLevel
} 

Edit_SelectText( p_hw, p_control, p_line1, p_col1, p_line2, p_col2 ) 
{
	EM_SETSEL = 0x00B1 
	ix1 := Edit_LineColToIndex( p_hw, p_control, p_line1, p_col1 ) 
	ix2 := Edit_LineColToIndex( p_hw, p_control, p_line2, p_col2 )+1 
	SendMessage, EM_SETSEL, ix1, ix2, %p_control%, ahk_id %p_hw%
} 

Edit_SetPosition( p_hw, p_control, p_line, p_col ) 
{
	EM_SETSEL = 0x00B1 
	ix := Edit_LineColToIndex( p_hw, p_control, p_line, p_col ) 
	SendMessage, EM_SETSEL, ix, ix, %p_control%, ahk_id %p_hw%
}



AttachConsole(pid)
{
	global hConOut
	; AttachConsole accepts a process ID. 
	if !DllCall("AttachConsole","uint",pid) 
	{
		MsgBox AttachConsole failed - error %A_LastError%. 
		ExitApp
	}
	; If it succeeded, console functions now operate on the target console window. 
	; Use CreateFile to retrieve a handle to the active console screen buffer. 
	hConOut:=DllCall("CreateFile","str","CONOUT$","uint",0xC0000000 
	,"uint",7,"uint",0,"uint",3,"uint",0,"uint",0) 
	if hConOut = -1 ; INVALID_HANDLE_VALUE 
	{
		MsgBox CreateFile failed - error %A_LastError%. 
		ExitApp
	}

	GetConsoleText() ; Call to set default ConWinWidth
} 

GetConsoleText()
{
	global ConWinWidth
	global hConOut, textLen
	; Allocate memory for a CONSOLE_SCREEN_BUFFER_INFO structure. 
	VarSetCapacity(info, 32, 0) 
	; Get info about the active console screen buffer. 
	if !DllCall("GetConsoleScreenBufferInfo","uint",hConOut,"uint",&info) 
	{
		MsgBox GetConsoleScreenBufferInfo failed - error %A_LastError%. 
		ExitApp
	} 

    NumPut(0, info , 12, "Short") ; Added to set the capture from the top of the scrolled content, not just visible content, remove it to take in jus the visible content
	; Determine which section of the buffer is on display. 
	ConWinLeft := NumGet(info, 10, "Short")     ; info.srWindow.Left 
	ConWinTop := NumGet(info, 12, "Short")      ; info.srWindow.Top 
	ConWinRight := NumGet(info, 14, "Short")    ; info.srWindow.Right 
	ConWinBottom := NumGet(info, 16, "Short")   ; info.srWindow.Bottom 
	ConWinAttribute := NumGet(info, 18, "Short") ; attribute
	ConWinAttribute := NumGet(info, 20, "Short") ; attribute
	
	;  ConWinHeight := NumGet(info, 24, "Short") ; screenheight
	
	/*
	http://www.chemieonline.de/forum/archive/index.php/t-7858.html
	
	void gettextinfo(struct text_info *_r) {
		CONSOLE_SCREEN_BUFFER_INFO Info;
		GetConsoleScreenBufferInfo (GetStdHandle (STD_OUTPUT_HANDLE), &Info);
		_r->winleft = Info.srWindow.Left;
		_r->winright = Info.srWindow.Right;
		_r->wintop = Info.srWindow.Top;
		_r->winbottom = Info.srWindow.Bottom;
		_r->attribute = Info.wAttributes;
		_r->normattr = LIGHTGRAY | BLACK;
		/* _r->currmode = ; */ /* What is currmode? */
		_r->screenheight = Info.dwSize.Y;
		_r->screenwidth = Info.dwSize.X;
		_r->curx = wherex ();
		_r->cury = wherey ();
	}
	*/
	
	ConWinWidth := ConWinRight-ConWinLeft+1 
	ConWinHeight = 5000 ; ConWinHeight := ConWinBottom-ConWinTop+1 
	
	; Allocate memory to read into. 
	VarSetCapacity(text, ConWinWidth*ConWinHeight, 0) 
	; Read text. 
	/*
	if !DllCall("ReadConsoleOutputCharacter","uint",hConOut,"str",text 
	,"uint",ConWinWidth*ConWinHeight,"uint",0,"uint*",numCharsRead) 
	{
		MsgBox ReadConsoleOutputCharacter failed - error %A_LastError%. 
		ExitApp
	} 
	*/
	;/* Alternate, slower method: 
	; Allocate memory to read into. 
	VarSetCapacity(buf, ConWinWidth*ConWinHeight*4, 0) 
	; Read an array of CHAR_INFO structures, containing text and attributes. 
	; Note: &info+10 is the address of a SMALL_RECT containing the coords we 
	; wish to read from. On success, it will receive the actual coords used. 
	if !DllCall("ReadConsoleOutput","uint",hConOut,"uint",&buf 
	,"uint",ConWinWidth|ConWinHeight<<16,"uint",0 
	,"uint",&info+10) 
	{
		MsgBox ReadConsoleOutput failed - error %A_LastError%. 
		ExitApp
	} 
	; buf should now contain an array of CHAR_INFO structures. 
	; We must decode this to retrieve readable text. 
	VarSetCapacity(text, ConWinWidth*ConWinHeight) 
	Loop % ConWinWidth*ConWinHeight 
	text .= Chr(NumGet(buf, 4*(A_Index-1), "Char")) 
	;*/ 
	; Optional: insert line breaks every %ConWinWidth% characters. 
	text := RegExReplace(text, "`a).{" ConWinWidth "}(?=.)", "$0`n", textLen) 
	; Finally, display the text. 
	Return text
}