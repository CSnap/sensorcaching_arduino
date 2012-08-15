/*
  Sends sensor data to Android
  (needs SensorGraph and Amarino app installed and running on Android)
*/
 
#include <MeetAndroid.h>

MeetAndroid meetAndroid;
int sensor = A2;


void setup()  
{
  // use the baud rate your bluetooth module is configured to 
  // not all baud rates are working well, i.e. ATMEGA168 works best with 57600
  Serial.begin(115200); 
 
  // we initialize pin 5 as an input pin
  pinMode(sensor, INPUT);
}

void loop()
{
  meetAndroid.receive(); // you need to keep this in your loop() to receive events
  
  // read input pin and send result to Android
  meetAndroid.send(analogRead(sensor));
  
  // add a little delay otherwise the phone is pretty busy
  delay(100);
}


