; Note: Rebind Capslock to F13, RCtrl to F14 with reg script.

#Requires AutoHotkey v2.0
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.

F13::Send("{F13}")
F14::Send("{F14}")

; Function keys
F13 & 1::Send("{Blind}{F1}")
F13 & 2::Send("{Blind}{F2}")
F13 & 3::Send("{Blind}{F3}")
F13 & 4::Send("{Blind}{F4}")
F13 & 5::Send("{Blind}{F5}")
F13 & 6::Send("{Blind}{F6}")
F13 & 7::Send("{Blind}{F7}")
F13 & 8::Send("{Blind}{F8}")
F13 & 9::Send("{Blind}{F9}")
F13 & 0::Send("{Blind}{F10}")
F13 & -::Send("{Blind}{F11}")
F13 & =::Send("{Blind}{F12}")

; Arrow keys
F13 & j::Send("{Blind}{Left}")
F13 & k::Send("{Blind}{Down}")
F13 & i::Send("{Blind}{Up}")
F13 & l::Send("{Blind}{Right}")

; Navigation keys
F13 & p::Send("{Blind}{Insert}")
F13 & `;::Send("{Blind}{Delete}")
F13 & u::Send("{Blind}{Home}")
F13 & o::Send("{Blind}{End}")
F13 & {::Send("{Blind}{PgUp}")
F13 & '::Send("{Blind}{PgDn}")

; Switch desktops
F13 & Tab::Send("{Blind}#{Tab}")
F13 & q::Send("{Blind}#^{Left}")
F13 & w::Send("{Blind}#^{Right}")

; Switch tabs
F13 & t::Send("{Blind}^{Tab}")
F13 & r::Send("{Blind}^+{Tab}")

; Switch IME
F13 & Space::Send("{Blind}{vkF3sc029}")

; Next/Back chapters on youtube.com
F14 & Left::Send("^{Left}")
F14 & Right::Send("^{Right}")
