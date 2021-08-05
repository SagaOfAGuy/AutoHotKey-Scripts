#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; Function that searches entire screen for a certain color
SearchColorOnScreen(color) {
    PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, color, 4, Fast RGB
    if ErrorLevel {
            MsgBox, Could not find color on screen
    }
    Else {
        MsgBox, Found color at %Px% %Py%
    }
}
; Function that searches for color on screen and clicks that region of screen
SearchColorAndClick(color) {
    PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, color, 4, Fast RGB
    if ErrorLevel {
            MsgBox, Could not find color on screen
    }
    Else {
        Send {Click %Px% %Py%}
    }
}

