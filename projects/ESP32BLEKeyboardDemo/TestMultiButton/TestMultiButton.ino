/**
 * This example turns the ESP32 into a Bluetooth LE keyboard that writes the words, presses Enter, presses a media key and then Ctrl+Alt+Delete
 */
#include <BleKeyboard.h>
#include <RotaryEncoder.h>
#include <PinButton.h>


const int PIN_ENCODER_A = 15;
const int PIN_ENCODER_B = 32;

RotaryEncoder encoder(PIN_ENCODER_A, PIN_ENCODER_B, RotaryEncoder::LatchMode::TWO03);
// This interrupt will do our encoder reading/checking!
void checkPosition() {
  encoder.tick(); // just call tick() to check the state.
}
int last_rotary = 0;

BleKeyboard bleKeyboard;

const int leftButtonPin = 13;
const int rightButtonPin = 12;
const int selectButton = 27;
const int upButtonPin = 33;
const int downButtonPin = 14;

PinButton leftButton(leftButtonPin, INPUT);
PinButton downButton(downButtonPin, INPUT);
PinButton rightButton(rightButtonPin, INPUT);
PinButton upButton(upButtonPin, INPUT);

int lButtonState = 1;
int rButtonState = 1;
int selectButtonState = 1;
int upButtonState = 1;
int downButtonState = 1;
int lastState = 0;  // 0 nothing, 1 left, 2 right, 3 select, 4 up, 5 down

void setup() {
  Serial.begin(115200);
  Serial.println("Starting BLE work!");
  bleKeyboard.begin();
  pinMode(downButtonPin, INPUT_PULLDOWN);
  pinMode(upButtonPin, INPUT_PULLDOWN);
  pinMode(leftButtonPin, INPUT_PULLDOWN);
  pinMode(rightButtonPin, INPUT_PULLDOWN);

  pinMode(selectButton, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(PIN_ENCODER_A), checkPosition, CHANGE);
  attachInterrupt(digitalPinToInterrupt(PIN_ENCODER_B), checkPosition, CHANGE);
}

void loop() {
  if(bleKeyboard.isConnected()) {
    int curr_rotary = encoder.getPosition();
    bool didScroll = false;
    RotaryEncoder::Direction direction = encoder.getDirection();

    if (curr_rotary != last_rotary) {
      Serial.print("Encoder value: ");
      Serial.print(curr_rotary);
      Serial.print(" direction: ");
      Serial.println((int)direction);
      // Note: this doesn't work properly when not in QuickNav
      if ((int)direction == -1) {
        //bleKeyboard.press(KEY_LEFT_CTRL);
        //bleKeyboard.press(KEY_LEFT_ALT);
        bleKeyboard.write(KEY_RIGHT_ARROW);
        delay(20);
        didScroll = true;
      } else if ((int)direction == 1) {
        //bleKeyboard.press(KEY_LEFT_CTRL);
        //bleKeyboard.write(KEY_LEFT_ALT);
        bleKeyboard.write(KEY_LEFT_ARROW);
        delay(20);
        didScroll = true;
      }
    }
    last_rotary = curr_rotary;

    leftButton.update();
    if (leftButton.isDoubleClick()) {
      Serial.println("left");
      lastState = 1;
      bleKeyboard.releaseAll();
      bleKeyboard.write(KEY_ESC);
      delay(20);
    } else if (leftButton.isClick()) {
      Serial.println("eject button");
      lastState = 4;
      bleKeyboard.releaseAll();
      bleKeyboard.write(KEY_MEDIA_EJECT);
      delay(100);
    }

    rightButton.update();
    if (rightButton.isClick()) {
        lastState = 2;
        bleKeyboard.press(KEY_LEFT_CTRL);
        bleKeyboard.press(KEY_LEFT_ALT);
        bleKeyboard.write(0x68);
        delay(100);
    }

    selectButtonState = digitalRead(selectButton);
    if (selectButtonState == 0 && lastState != 3) {
      Serial.println("selected button");
      lastState = 3;
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(0x20);
      delay(100);
    }

    upButton.update();
    if (upButton.isDoubleClick()) {
      lastState = 4;
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.press(KEY_LEFT_GUI);
      bleKeyboard.write(KEY_LEFT_ARROW);
      Serial.println("double up");
    } else if (upButton.isClick()) {
      lastState = 4;
      Serial.println("up");
      bleKeyboard.releaseAll();
      bleKeyboard.write(KEY_UP_ARROW);
      delay(20);
      // old code for hide / show keyboard
    }


    downButton.update();
    if (downButton.isDoubleClick()) {
      lastState = 5;
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.press(KEY_LEFT_GUI);
      bleKeyboard.write(KEY_RIGHT_ARROW);
      Serial.println("double down");
    } else if (downButton.isClick()) {
      lastState = 5;
      Serial.println("down");
      bleKeyboard.releaseAll();
      bleKeyboard.write(KEY_DOWN_ARROW);
      delay(20);
    }
    
//
//    downButtonState = digitalRead(downButton);
//    if (downButtonState == 0 && lastState != 5) {
//      Serial.println("down button");
//      lastState = 5;
//      bleKeyboard.releaseAll();
//      bleKeyboard.press(KEY_LEFT_CTRL);
//      bleKeyboard.press(KEY_LEFT_ALT);
//      bleKeyboard.write(0x68);
//      delay(100);
//    }

    
    if (selectButtonState == 1 && rButtonState == 1 && lButtonState == 1 && upButtonState == 1 && downButtonState == 1 && lastState != 0 && !didScroll) {
      lastState = 0;
      bleKeyboard.releaseAll();
    }
  }
}
