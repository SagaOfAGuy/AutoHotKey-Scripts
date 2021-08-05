# AutoHotKey-Scripts
Useful Autohotkey scripts for a variety of purposes

# Example Usage
To use these scripts, include them as a script within a separate script you've created

```AutoHotKey
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Include ColorSearch.ahk as a script
#include ColorSearch.ahk

; Call one of the methods within ColorSearch.ahk. In this case we'll choose, SearchColorAndGetCoords().
; Store this within a variable, and pass a hex color code value through this method
ColorCoordinate := SearchColorAndGetCoords(0x00B3F6)

; Since ColorCoordinate returns an object with attributes x and y, call them
posX := ColorCoordinate.x
posY := ColorCoordinate.y

; Print out coordinates of color if found on screen via MsgBox
MsgBox % PosX PosY

```
