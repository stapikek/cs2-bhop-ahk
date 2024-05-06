#Persistent
#NoEnv

DllCall("timeBeginPeriod", UInt, 1)

; Set the process priority to REALTIME_PRIORITY_CLASS
Process, Priority, , R

SetTitleMatchMode, 2  
SetTitleMatchMode, Fast ; Faster matching
TICK_64_MS := 15.6
exit_key := "End"
activation_key := "xButton1"

Gui, Font, s10 Bold cFF0000
Gui, Add, Text, x145 y90 w200 h50, hold down mouse4 to activate bunnyhop
Gui, Font, s10 Bold cFF0000 
Gui, Add, Text, x290 y9 w120 h50, modified by stapi
Gui, Font, s12 Bold
Gui, Color, 000000 ; Background color
Gui, Margin, 10, 10
Gui, Show, Center, CS2 Bhop by stapi
GuiControlGet, result

While !GetKeyState(exit_key, "P") 
{
    If GetKeyState(activation_key, "P") 
    {
        MouseClick, WheelDown  ; Simulate mouse wheel down
        Sleep, % (TICK_64_MS * 1) ; Sleep for a specific time
        
        
        

        MouseClick, WheelDown ; Simulate mouse wheel down
        While GetKeyState(activation_key, "P")
        {
            MouseClick, WheelDown
            Sleep, % (TICK_64_MS * 2)
        }
    }
    else
    {
        Sleep, 1
    }
}

DllCall("timeEndPeriod", UInt, 1)
ExitApp
