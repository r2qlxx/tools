#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

F13 & j::Send {Blind}{Left}
F13 & k::Send {Blind}{Down}
F13 & i::Send {Blind}{Up}
F13 & l::Send {Blind}{Right}

F13 & s:: Send {Blind}{Insert}
F13 & d:: Send {Blind}{Delete}
F13 & h:: Send {Blind}{Home}
F13 & e:: Send {Blind}{End}

F13 & 1:: Send {Blind}#^{Left}
F13 & 2:: Send {Blind}#^{Right}

F13 & c:: Send {Blind}^{Insert}
F13 & v:: Send {Blind}+{Insert}