#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;By danijelM
;github.com/DanijelMi

; You can change these variables below
  fireRate=100 ; Default firing rate in controled fire mode
  XPOS := 100 ; On-screen coordinates for the display window.
  YPOS := 100 
  mode=0 ; Default starting mode
; 0 off ; 1 Controled Fire ; 2 Shotgun Mode ; 3 Gunner Mode ; 4 Semi Auto ; 

; Disables optional inputs initially
  Hotkey, *NumpadAdd, Off
  Hotkey, *NumpadSub, Off

#IfWinActive ahk_class Battlefield: Bad Company 2   ; Makes the script active only if in-game, comment out to test outside.

; Draws the transparent window displaying current mode + details.
  #SingleInstance, Force
  Gui, Color, FFFFFF 
  Gui, Font, S14, Arial Black
  Gui +LastFound +AlwaysOnTop +ToolWindow -caption
  WinSet, TransColor, FFFFFF
  Gui, add, Text, h200 w700 vFireRateText, %fireRate%
  Gui, show, y%YPOS% x%XPOS% AutoSize NoActivate, FireRate

return ; End of all run-time executions

; Controls

+f1::    ; Sets to Controled Fire mode
  mode=1
  GuiControl,, FireRateText, %fireRate%
  Hotkey, *NumpadAdd, On
  Hotkey, *NumpadSub, On
  return

+f2::    ; Sets to Shotgun mode
  mode=2
  GuiControl,, FireRateText, Slug
  Hotkey, *NumpadAdd, Off
  Hotkey, *NumpadSub, Off
  return

+f3::    ; Sets to Gunner mode
  mode=3
  GuiControl,, FireRateText, Heli
  Hotkey, *NumpadAdd, Off
  Hotkey, *NumpadSub, Off
  return

+f4::    ; Sets to Semi Auto mode
  mode=4
  GuiControl,, FireRateText, Semi
  Hotkey, *NumpadAdd, Off
  Hotkey, *NumpadSub, Off
  return

+f5::Suspend    ; Suspends the script
  return

*NumpadAdd::    ; Decreases fire rate in Controled Fire Mode (increases delay between each shot)
  fireRate+=5
  GuiControl,, FireRateText, %fireRate%
  return

*NumpadSub::    ; Increases fire rate in Controled Fire Mode (increases delay between each shot)
  fireRate-=5
  GuiControl,, FireRateText, %fireRate%
  return

~*XButton1::HotKey, ~*LButton, On   ; Turns the script on
~*XButton2::Hotkey, ~*LButton, Off  ; Turns the script off

; Input manipulation logic
$~*LButton::
  ; Controled Fire Logic
  While mode==1 && GetKeyState("LButton","p"){
    Click
    Sleep fireRate
  }
  ; Shotgun Mode Logic
  While mode == 2 && GetKeyState("LButton","p"){
    Click
    Sleep, 55
    SendInput, 3
    sleep, 85
    SendInput, 2
    If (GetKeyState("RButton", "P")){
      sleep, 220
      SendInput, {RButton}
    }
      sleep, 500
  }
  ; Gunner Mode Logic
  While mode==3{
  SendInput, {F1}
  Sleep 600
  }
  ; Semi Auto Logic
  if mode==4
    Click
  return




