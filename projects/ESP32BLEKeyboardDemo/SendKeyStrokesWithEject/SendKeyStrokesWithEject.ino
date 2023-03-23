/**
 * This example turns the ESP32 into a Bluetooth LE keyboard that writes the words, presses Enter, presses a media key and then Ctrl+Alt+Delete
 */
#include <BleKeyboard.h>
#include <RotaryEncoder.h>


const int PIN_ENCODER_A = 15;
const int PIN_ENCODER_B = 32;

RotaryEncoder encoder(PIN_ENCODER_A, PIN_ENCODER_B, RotaryEncoder::LatchMode::TWO03);
// This interrupt will do our encoder reading/checking!
void checkPosition() {
  encoder.tick(); // just call tick() to check the state.
}
int last_rotary = 0;

BleKeyboard bleKeyboard;

const int lButton = 13;
const int rButton = 12;
const int selectButton = 27;
const int ejectButton = 33;
const int downButton = 22;
const int additionalGround = 14;


int lButtonState = 1;
int rButtonState = 1;
int selectButtonState = 1;
int ejectButtonState = 1;
int downButtonState = 1;
int lastState = 0;  // 0 nothing, 1 left, 2 right, 3 select, 4 eject, 5 down

void setup() {
  Serial.begin(115200);
  Serial.println("Starting BLE work!");
  bleKeyboard.begin();
  pinMode(additionalGround, OUTPUT);
  digitalWrite(additionalGround, LOW);
  pinMode(lButton, INPUT_PULLUP);
  pinMode(rButton, INPUT_PULLUP);
  pinMode(selectButton, INPUT_PULLUP);
  pinMode(ejectButton, INPUT_PULLUP);
  pinMode(downButton, INPUT_PULLUP);
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
      if ((int)direction == -1) {
        bleKeyboard.write(KEY_RIGHT_ARROW);
        delay(20);
      } else if ((int)direction == 1) {
        bleKeyboard.write(KEY_LEFT_ARROW);
        delay(20);
      }
      didScroll = true;
    }
    last_rotary = curr_rotary;

    lButtonState = digitalRead(lButton);
    if (lButtonState == 0 && lastState != 1) {
      lastState = 1;
      bleKeyboard.releaseAll();
      bleKeyboard.write(KEY_ESC);
      delay(20);
    }
    
    rButtonState = digitalRead(rButton);
    if (rButtonState == 0 && lastState != 2) {
      bleKeyboard.releaseAll();
      lastState = 2;
      bleKeyboard.write(KEY_RIGHT_ARROW);
      delay(20);
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

    ejectButtonState = digitalRead(ejectButton);
    if (ejectButtonState == 0 && lastState != 4) {
      Serial.println("eject button");
      lastState = 4;
      bleKeyboard.write(KEY_MEDIA_EJECT);
      delay(100);
    }

    
    downButtonState = digitalRead(downButton);
    if (downButtonState == 0 && lastState != 5) {
      Serial.println("down button");
      lastState = 5;
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(0x68);
      delay(100);
    }

    
    if (selectButtonState == 1 && rButtonState == 1 && lButtonState == 1 && ejectButtonState == 1 && downButtonState == 1 && lastState != 0 && !didScroll) {
      lastState = 0;
      bleKeyboard.releaseAll();
    }
  }
}
