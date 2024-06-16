#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F13 & `:: Send {Blind}{Esc}
F13 & 1:: Send {Blind}{F1}
F13 & 2:: Send {Blind}{F2}
F13 & 3:: Send {Blind}{F3}
F13 & 4:: Send {Blind}{F4}
F13 & 5:: Send {Blind}{F5}
F13 & 6:: Send {Blind}{F6}
F13 & 7:: Send {Blind}{F7}
F13 & 8:: Send {Blind}{F8}
F13 & 9:: Send {Blind}{F9}
F13 & 0:: Send {Blind}{F10}
F13 & -:: Send {Blind}{F11}
F13 & =:: Send {Blind}{F12}

F13 & i::Send, {Blind}{up}
F13 & k::Send, {Blind}{down}
F13 & j::Send, {Blind}{left}
F13 & l::Send, {Blind}{right}

F13 & c:: Send {Blind}{Capslock}
F13 & h:: Send {Blind}{Home}
F13 & e:: Send {Blind}{End}
F13 & d:: Send {Blind}{Delete}

F13 & f:: Send {Blind}#^{Right}
F13 & b:: Send {Blind}#^{Left}
