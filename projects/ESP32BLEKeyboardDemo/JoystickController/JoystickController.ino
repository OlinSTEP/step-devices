/**
 * This example turns the ESP32 into a Bluetooth LE keyboard that writes the words, presses Enter, presses a media key and then Ctrl+Alt+Delete
 */
#include <BleKeyboard.h>
#include <PinButton.h>

#define LOW_THRESHOLD 800
#define HIGH_THRESHOLD 3200

#define JOYSTICK_LEFT 1
#define JOYSTICK_RIGHT 2
#define JOYSTICK_UP 3
#define JOYSTICK_DOWN 4
#define JOYSTICK_NONE 0


BleKeyboard bleKeyboard;

const int xAxisPin = A6;
const int yAxisPin = A7;
const int selectButtonPin = 15;

PinButton selectButton(selectButtonPin, INPUT);

int joystickState = 0;
int lastState = 0;

int num_consecutive = 0;
long last_time = 0;

void setup() {
  Serial.begin(115200);
  Serial.println("Starting BLE work!");
  bleKeyboard.setName("STEP Joystick Controller");
  bleKeyboard.begin();
  
  pinMode(xAxisPin, INPUT);
  pinMode(yAxisPin, INPUT);
  pinMode(selectButtonPin, INPUT_PULLUP);
}

void loop() {
  bool sent = false;
  if(bleKeyboard.isConnected()) {
    lastState = joystickState;
    if (analogRead(yAxisPin) < LOW_THRESHOLD) {
      joystickState = JOYSTICK_LEFT;
    } else if (analogRead(yAxisPin) > HIGH_THRESHOLD) {
      joystickState = JOYSTICK_RIGHT;
    } else if (analogRead(xAxisPin) < LOW_THRESHOLD) {
      joystickState = JOYSTICK_DOWN;
      num_consecutive = 0;
    } else if (analogRead(xAxisPin) > HIGH_THRESHOLD) {
      joystickState = JOYSTICK_UP;
      num_consecutive = 0;
    } else {
      joystickState = JOYSTICK_NONE;
      num_consecutive = 0;
    }

    long time_needed = last_time + 1250*exp(-num_consecutive) + 100;

    if (joystickState == JOYSTICK_LEFT && (millis() > time_needed || num_consecutive == 0)) {
      Serial.println("LEFT");
      bleKeyboard.releaseAll();
      //bleKeyboard.press(KEY_LEFT_CTRL);
      //bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(KEY_LEFT_ARROW);
      sent = true;
      delay(20);
      num_consecutive++;
    }
    
    if (joystickState == JOYSTICK_RIGHT && (millis() > time_needed || num_consecutive == 0)) {
      Serial.println("RIGHT");
      bleKeyboard.releaseAll();
      //bleKeyboard.press(KEY_LEFT_CTRL);
      //bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(KEY_RIGHT_ARROW);
      sent = true;
      delay(20);
      num_consecutive++;
    }

    if (joystickState == JOYSTICK_UP && lastState != JOYSTICK_UP) {
      Serial.println("UP");
      bleKeyboard.write(KEY_ESC);
      sent = true;
      delay(100);
    }
    
    if (joystickState == JOYSTICK_DOWN && lastState != JOYSTICK_DOWN) {
      Serial.println("DOWN");
      bleKeyboard.releaseAll();
      bleKeyboard.press(KEY_LEFT_CTRL);
      bleKeyboard.press(KEY_LEFT_ALT);
      bleKeyboard.write(0x68);
      sent = true;
      delay(100);
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

    if (sent) {
      last_time = millis();
      bleKeyboard.releaseAll();
    }
  }
}
