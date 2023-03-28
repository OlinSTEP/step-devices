/**
 * This example turns the ESP32 into a Bluetooth LE keyboard that writes the words, presses Enter, presses a media key and then Ctrl+Alt+Delete
 */
#include <BleKeyboard.h>
#include <PinButton.h>

BleKeyboard bleKeyboard;

const int leftButtonPin = 15;
const int rightButtonPin = 33;
const int selectButtonPin = 13;
const int upButtonPin = 12;
const int downButtonPin = 27;

PinButton leftButton(leftButtonPin, INPUT);
PinButton downButton(downButtonPin, INPUT);
PinButton rightButton(rightButtonPin, INPUT);
PinButton upButton(upButtonPin, INPUT);
PinButton selectButton(selectButtonPin, INPUT);

void setup() {
  Serial.begin(115200);
  Serial.println("Starting BLE work!");
  bleKeyboard.setName("STEP Button Controller");
  bleKeyboard.begin();
  pinMode(leftButtonPin, INPUT_PULLUP);
  pinMode(rightButtonPin, INPUT_PULLUP);
  pinMode(selectButtonPin, INPUT_PULLUP);
  pinMode(upButtonPin, INPUT_PULLUP);
  pinMode(downButtonPin, INPUT_PULLUP);
}

void loop() {
  bool sent = false;
  if(bleKeyboard.isConnected()) {
    leftButton.update();
    if (leftButton.isDoubleClick()) {
      Serial.println("ESC");
      bleKeyboard.releaseAll();
      bleKeyboard.write(KEY_ESC);
      sent = true;
      delay(100);
    } else if (leftButton.isClick()) {
      Serial.println("LEFT");
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(KEY_LEFT_ARROW);
      sent = true;
      delay(20);
    }
    
    rightButton.update();
    if (rightButton.isClick()) {
      Serial.println("RIGHT");
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(KEY_RIGHT_ARROW);
      sent = true;
      delay(20);
    }

    selectButton.update();
    if (selectButton.isClick()) {
      Serial.println("SELECT");
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(0x20);
      sent = true;
      delay(100);
    }

    upButton.update();
    if (upButton.isDoubleClick()) {
      Serial.println("EJECT");
      bleKeyboard.write(KEY_MEDIA_EJECT);
      sent = true;
      delay(100);
    } else if (upButton.isClick()) {
      Serial.println("UP");
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(KEY_UP_ARROW);
      sent = true;
      delay(20);
    }

    
    downButton.update();
    if (downButton.isClick()) {
      Serial.println("DOWN");
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(0x68);
      sent = true;
      delay(100);
    }

    
//    if (selectButtonState == 1 && rButtonState == 1 && lButtonState == 1 && ejectButtonState == 1 && downButtonState == 1 && lastState != 0 && !didScroll) {
//      lastState = 0;
//      bleKeyboard.releaseAll();
//    }
    if (sent) {
      bleKeyboard.releaseAll();
    }
  }
}
