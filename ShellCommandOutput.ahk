#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Runs Powershell command and returns the output 
RunPowershellWithOutput(cmd) {
;Create ComObject for Wscript.shell to run powershell
    output := ComObjCreate("WScript.Shell").Exec("%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden " cmd).StdOut.ReadAll()
;return output of Powershell command
	return output
}

; Runs command in CMD and returns the output
RunCMDWithOutput(cmd) {
;Create ComObject for Wscript.shell to run CMD
    output := ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c " cmd).StdOut.ReadAll()
;return output of Powershell command
	return output
}

/*
Examples:
Store Powershell output of the command 'ls' into a variable within AutohotKey variable called 'filelist'
filelist := RunPowershellWithOutput("ls")

Store CMD output of the command 'echo hello' into a variable within AutohotKey variable called 'output'
output := RunCMDWithOutput("echo hello")
*/
