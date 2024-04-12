#NoTrayIcon
#SingleInstance force
GameTitle := "Epic Seven"

^F12::
IfWinNotExist, %GameTitle%
{
	Run "C:\Program Files\Google\Play Games\Bootstrapper.exe"
	ChangeResolution(1920, 1080)
	Sleep 10000
	
	WinGetPos, , , w, h, ahk_exe client.exe
	WinMove, ahk_exe client.exe, , , , 1040, 639
	
	SetControlDelay -1
	ControlClick, x40 y285, ahk_exe client.exe
	Sleep 800
	
	SetControlDelay -1
	ControlClick, x818 y300, ahk_exe client.exe ;Change the y-coordinate to wherever your E7 is on the library list.
	Sleep 500
	WinMove, ahk_exe client.exe, , , , %w%, %h%
	
	Sleep 500
	
	ChangeResolution(2560, 1080)
	
	WinWait, %GameTitle%, , 20
	if ErrorLevel
	{
		return
	}
	else
	{
		WinMove, %GameTitle%, , 950, 50, 1686, 950
		WinClose, ahk_exe client.exe
		return
	}
}
else
{
	WinMove, %GameTitle%, , 950, 50, 1686, 950
	return
}


ChangeResolution(Screen_Width := 1920, Screen_Height := 1080, Color_Depth := 32)
{
	VarSetCapacity(Device_Mode,156,0)
	NumPut(156,Device_Mode,36) 
	DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&Device_Mode )
	NumPut(0x5c0000,Device_Mode,40) 
	NumPut(Color_Depth,Device_Mode,104)
	NumPut(Screen_Width,Device_Mode,108)
	NumPut(Screen_Height,Device_Mode,112)
	Return DllCall( "ChangeDisplaySettingsA", UInt,&Device_Mode, UInt,0 )
}
Return
