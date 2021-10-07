#include <SharpIR.h>

#define ir A0
#define model 1080
// ir: the pin where your sensor is attached
// model: an int that determines your sensor:  1080 for GP2Y0A21Y
//                                            20150 for GP2Y0A02Y
//                                            (working distance range according to the datasheets)


//Led configuarations
const int led_close = 2;
const int led_far = 4;
const int led_within = 3;

//Sensor min & max values
int minimumVal = 10;
int maximumVal = 80;

int var_too_far = 55;
int var_too_close = 35;



SharpIR SharpIR(ir, model);

void setup() {
  //Set up led pins
  pinMode(led_close, OUTPUT);
  pinMode(led_within, OUTPUT);
  pinMode(led_far, OUTPUT);
  
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  delay(1000);   

  //unsigned long pepe1=millis();  // takes the time before the loop on the library begins

  int dis=SharpIR.distance();  // this returns the distance to the object you're measuring


  //Serial.print("Mean distance: ");  // returns it to the serial monitor
  //Serial.println(dis);


  /*=======================================================================================
                                  Sensor data manipulation
   =======================================================================================*/
  //Determine the min & max values
  if(dis <= minimumVal) {
    dis = 0;
    //Serial.println(dis);
  } else if (dis >= maximumVal) {
    dis = 80;
    //Serial.println(dis);
  }


  if(dis >= var_too_far && dis <= maximumVal) {
    //Serial.println("Too far, Turn towards the wall | Distance: " + String(dis));

    Serial.println(dis);
    
    //Turn ON too far Led
    digitalWrite(led_far, HIGH);
    digitalWrite(led_within, LOW);
    digitalWrite(led_close, LOW);
    
  } else if(dis <= var_too_close && dis >= minimumVal) {
    //Serial.println("Too close, Turn away from the wall | Distance: " + String(dis));

    Serial.println(dis);

    //Turn ON too close Led
    digitalWrite(led_far, LOW);
    digitalWrite(led_within, LOW);
    digitalWrite(led_close, HIGH);
    
  } else {
    //Serial.println("NO Change | Distance: " + String(dis));

    Serial.println(dis);

    //Turn ON withIn Led
    digitalWrite(led_far, LOW);
    digitalWrite(led_within, HIGH);
    digitalWrite(led_close, LOW);
  }
  
  //unsigned long pepe2=millis()-pepe1;  // the following gives you the time taken to get the measurement
  //Serial.print("Time taken (ms): ");
  //Serial.println(pepe2);  

}
