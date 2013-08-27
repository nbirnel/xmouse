mousedrag_treshold := 20 ; pixels

GroupAdd, ignore, ahk_class ConsoleWindowClass
GroupAdd, ignore, ahk_class inferno
GroupAdd, ignore, ahk_class SynergyDesk
Hotkey mbutton, paste_selection

#IfWinNotActive ahk_group ignore
~lButton::
  MouseGetPos, mousedrag_x, mousedrag_y
  keywait lbutton
  mousegetpos, mousedrag_x2, mousedrag_y2
  if (abs(mousedrag_x2 - mousedrag_x) > mousedrag_treshold
    or abs(mousedrag_y2 - mousedrag_y) > mousedrag_treshold)
  {
    wingetclass class, A
    if (class == "mintty")
      sendinput ^{Insert}
    else if (class == "MozillaWindowClass")
      sendinput ^v^c
    else if (class == "Emacs")
      sendinput !w
    else
      sendinput ^c
    settimer follow_mouse, 100
  }
  return
 
follow_mouse:
  ; tooltip copy
  return
 
paste_selection:
  sendinput {lbutton}
  WinGetClass class, A
  if (class == "mintty")
    sendinput +{Insert}
  else if (class == "MozillaWindowClass")
    sendinput ^v^v
  else if (class == "Emacs")
    SendInput ^y
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
