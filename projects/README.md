# Work in Progress Projects

## ESP32BLEKeyboardDemo

This uses an Adafruit Feather ESP32 board to present as a Bluetooth keyboard.  The current demo implements four functions when connected to an iPhone with VoiceOver turned on: move VoiceOver cursor to next item, move VoiceOver cursor to previous item, select current item, toggle display of onscreen keyboard.

The heavy lifting on the BLE side is handled by T-vK's [ESP32-BLE-Keyboard library](https://github.com/T-vK/ESP32-BLE-Keyboard).  We did make a minor change to add the media eject button as an additional control.
