# BF_BC2-HotkeySet
A set of useful functions for Battlefield: Bad Company 2 (Cheats)

Written in AutoHotKey, to be easily edited and read.

Currently contains 4 features:
1. Controled Fire Mode: intentionally lowers the fire rate for easier recoil control. Adjust fire reate with numpad +- .
2. Shotgun Mode: automates a certain combination of keys after each shot that increases the overall fire rate. This exploits a glitch that is in the core game, but difficult to execute consistently manually.
3. Gunner Mode: Constatnly tries to enter the pilot seat (by using the default F1 control). Avoids a helicopter crash if the previous pilot was shot down.
4. Semi Auto Mode: Makes all firearms behave like semi-automatic rifles.

The current mode and any additional info(if needed) is displayed on a always-on-top graphical widget.

Default Controls:
Shift+F1 - Controled Fire Mode
  Numpad +- - Adjust Controled Fire Rate
Shift+F2 - Shotgun Mode
Shift+F3 - Gunner Mode
Shift+F4 - Semi Auto Mode
Shift+F5 - Suspend/Activate Script 

Optional:
XButton1 - Activate Script
XButton2 - Suspend Script


Issues:
* Graphical display does not render on top of the game unless the game is set to windowed mode.
Solution 1: Set the game to windowed mode by editing the settings.ini usually located in My Documents.
Solution 2: Edit the X,Y coordinate variables in the script to move the widget to a second monitor if you have one.


To-do:
* Find a better way to communicate data to the end user.
* In Controled Fire Mode, change the fire-rate metric from miliseconds between shots to rounds per minute.
* Add More Functions:
 - QuickScope automation
 - QuickScope-fire delay
 - Med/Ammo Kit Placement
