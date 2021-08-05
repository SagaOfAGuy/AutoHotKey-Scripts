#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Import Chrome.ahk when included within root directory
;#include Chrome.ahk

/*
This script depends on Chrome.ahk which can be found here: https://github.com/G33kDude/Chrome.ahk

This script places waits on Chrome.ahk until a certain text on the DOM is found
*/
; Wait until text appears in DOM, execute JS
WaitForTextAndExecJS(page,interval,text,JS) {
    ; Timeout variable to break out of loop if text isn't found in DOM
    timeout := 0
    loop {
        ; Wait at interval
        Sleep %interval%
        try {
            ; Detect DOM text and DOM state if no errors
            documentState := page.Evaluate("document.readyState").value
            documentText := page.Evaluate("document.body.outerText").value
            ; if DOM state is complete
            if (InStr(documentState,"complete")) {
                ; if DOM text contains search query
                if (InStr(documentText, text)) {
                    ; Sleep for chosen interval
                    Sleep, %interval%
                    ; Evaluate chosen JS code
                    page.Evaluate(JS)
                    ; Break out of loop
                    break
                }
                Else {
                    ; Sleep at chosen interval
                    Sleep, %interval%
                    ; increment interval to timeout variable
                    timeout += %interval%
                    ; if timeout is reached, break out of loop
                    if (timeout >= 60000) {
                        MsgBox, Text not found on DOM
                        break
                    }
                }
            }
            Else {
                ; If not DOM is not complete or text doesn't match, sleep at chosen interval
                
                Sleep %interval%
            }
        }
        ; If JS is not able to be detected on page
        catch e {
            ; Sleep for chosen interval
            Sleep %interval%
            ; Continue through loop
            continue
        } 
    }     
}
; Wait until text appears in DOM, execute JS, and break out of loop
WaitForText(page,interval,text) {
    ; Timeout variable to break out of loop if text isn't found in DOM
    timeout := 0
    ; loop through DOM
    loop {
        ; Sleep chosen interval
        Sleep %interval%
        try {
            ; Find DOM state and DOM text
            documentState := page.Evaluate("document.readyState").value
            documentText := page.Evaluate("document.body.outerText").value
            ; If search query matches contents in DOM
            if (InStr(documentState, "complete")) {
                ; If document text is inside of DOM text
                if (InStr(documentText, text)) {
                    ; sleep for chosen interval
                    Sleep, %interval%
                    ; break out of loop
                    break
                }
            }
            ; If DOM isn't complete
            Else {
                ; Sleep at chosen interval
                Sleep %interval%
                ; increment to timeout variable
                timeout += %interval%
                ; If timeout is reached, break out of loop
                if (timeout >= 60000) {
                    MsgBox, Text not found on DOM
                    break
                }
            }
        }
        ; Catch error if JS can't be executed on page
        catch e {
            ; Sleep at chosen interval
            Sleep %interval%
            ; Continue through loop
        } 
    }     
} 
    
/* Examples: 
; Go to google.com
ChromeInst := new Chrome("--incognito")
PageInst := ChromeInst.GetPageByTitle("New Tab")
PageInst.Call("Page.navigate", {"url": "https://google.com"})

; Wait until the text 'Google' pops up, and execute JS on DOM
WaitForTextAndExecJS(PageInst,500,"Google","alert('hello')")
*/
