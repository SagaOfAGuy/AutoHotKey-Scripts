#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; Function that searches entire screen for a certain color. Mostly used for testing purposes rather than storing X and Y coordinates of color area on screen.
/*
Example:
Searches entire screen for 0x00B3F6

SearchColorOnScreen(0x00B3F6) 
*/
SearchColorOnScreen(color) {
    ; Search entire screen for color
    PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, color, 4, Fast RGB
    ; If Color cannot be found, throw an error. If found, print out coordinates
    if ErrorLevel 
        MsgBox, Could not find color on screen
    Else
        MsgBox, Found color at %Px% %Py%
}
/*
Example:
Searches entire screen for 0x00B3F6 and clicks coordinate where 0x00B3F6 is found

SearchColorAndClick(0x00B3F6)
*/
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
; Function that returns X and Y coordinate of color on screen if found
/*
Example: 

Searches entire screen for 0x00B3F6 and clicks coordinate where 0x00B3F6 is found
ColorPosition := SearchColorAndGetCoords(0x00B3F6)

; Get x position of color on screen
posX := ColorPosition.x

; Get y position of color on screen
posY := ColorPosition.y
*/
SearchColorAndGetCoords(color) {
    ; Search entire screen for color
    PixelSearch, Px, Py, 0, 0, A_ScreenWidth, A_ScreenHeight, color, 4, Fast RGB
    ; Create object to store coordinate values
    obj := {}
    obj.x := Px
    obj.y := Py
    ; Handle error if color not found
    if ErrorLevel
        MsgBox, Could not find color on screen
    Else 
        return obj
}

