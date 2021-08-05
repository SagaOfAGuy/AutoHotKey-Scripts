#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; Function that searches entire screen for a certain color
SearchColorOnScreen(color) {
    ; Search entire screen for color
    PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, color, 4, Fast RGB
    ; If Color cannot be found, throw an error. If found, print out coordinates
    if ErrorLevel 
        MsgBox, Could not find color on screen
    Else
        MsgBox, Found color at %Px% %Py%
}
; Function that searches for color on screen and clicks that region of screen
SearchColorAndClick(color) {
    ; Search entire screen for color
    PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, color, 4, Fast RGB
    ; If Color cannot be found, throw an error. If found, click the coordinates found
    if ErrorLevel
        MsgBox, Could not find color on screen
    Else 
        Send {Click %Px% %Py%}
}
