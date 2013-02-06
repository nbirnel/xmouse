mousedrag_treshold := 20 ; pixels

Hotkey mbutton, paste_selection

#IfWinNotActive ahk_class ConsoleWindowClass
~lButton::
  MouseGetPos, mousedrag_x, mousedrag_y
  keywait lbutton
  mousegetpos, mousedrag_x2, mousedrag_y2
  if (abs(mousedrag_x2 - mousedrag_x) > mousedrag_treshold
    or abs(mousedrag_y2 - mousedrag_y) > mousedrag_treshold)
  {
    wingetclass class, A
    if (class == "Emacs")
      sendinput !w
    else if (class == "MozillaWindowClass")
      sendinput ^v^c
    else if (class == "inferno")
      noop = ""
    else if (class == "mintty")
      noop = ""
    else if (class == "ConsoleWindowClass")
      noop = ""
    else
      sendinput ^c
    settimer follow_mouse, 100
  }
  return
#IfWinNotActive
 
follow_mouse:
  ; tooltip copy
  return
 
paste_selection:
  sendinput {lbutton}
  WinGetClass class, A
  if (class == "Emacs")
    SendInput ^y
  else if (class == "MozillaWindowClass")
    sendinput ^v^v
  else if (class == "inferno")
    noop = ""
  else if (class == "mintty")
    noop = ""
  else if (class == "ConsoleWindowClass")
    noop = ""
  else
    SendInput ^v
  gosub cleanup
  return
 
cleanup:
  SetTimer cleanup, off
  settimer follow_mouse, off
  tooltip
  Return
 
 
; ;; clipx
; ^mbutton::
;   sendinput ^+{insert}
;   return
