/*===========================================================================
                                Serial Setup and Variable
============================================================================*/
import processing.serial.*;

Serial mySerial;
String myString = null;
int lf = 10;
int myVal;

/*---------------------------------------
              Hysteresis SetUp
-----------------------------------------*/
int minimumVal = 10;
int maximumVal = 80;

int var_too_far = 55;
int var_too_close = 35;


/*---------------------------------------
              Image SetUp
-----------------------------------------*/
PImage checkImg, errorImg;

/*---------------------------------------
              Color SetUp
-----------------------------------------*/
color lBlue = color(51, 212, 182);
color lWhite = color(255, 248, 232);
color yellow = color(255,255,0);


void setup() {
  /*------------------------------------
              Screen SetUp
  --------------------------------------*/
  size(1000, 600);
  
  /*------------------------------------
              Screen SetUp
  --------------------------------------*/
  checkImg = loadImage("0.png");
  errorImg = loadImage("1.png");
  
  
  
  /*------------------------------------
              Serial SetUp
  --------------------------------------*/
  String myPort = Serial.list()[0];
  mySerial = new Serial(this, myPort, 9600);
  
  frameRate(20);
  
  //println("==============================================================");
  //println("When converting the string recived from the Serial Port equals");
  //println("to a zero (0) so i Decided to display the output of my program");
  //println("On the console.");
  //println("==============================================================");
  
}


void draw() {
  background(0);
  
  textAlign(LEFT);
  line(width * 0.10, 0, width * 0.10, 65);
  line(width * 0.10, 220, width * 0.10, height);
  
  while(mySerial.available() > 0) {
    myString = mySerial.readStringUntil(lf); //Read serial port until new line is found
    if(myString != null) {
      myString = myString.trim(); 
      myVal = int(myString);
      println(myVal);
      
        
    }
  }
  
  if(myString != null) {
    
    fill(yellow);
    textSize(23);
    text("Distance data from sensor ", width * 0.10, 95);
    
    fill(255);
    textSize(16);
    text("Current Distance: " + myString + " cm" , width * 0.10, 115);
    
    fill(yellow);
    textSize(23);
    text("Current Status ", width * 0.10, 155);
    
    if(myVal >= var_too_far && myVal  <= maximumVal) {
          //Too far 
          fill(255);
          textSize(16);
          text("Too far, Turn towards the wall ", width * 0.10, 175);
          
          //Image Display
          image(checkImg, width * 0.10, 200);
    } 
    
    if(myVal <= var_too_close && myVal  >= minimumVal) {
      //Too Close
      fill(255);
      textSize(16);
      text("Too close, Turn away from the wall ", width * 0.10, 175);
      
      //Image Display
       image(errorImg, width * 0.10, 200);
    }
    
    if (myVal > var_too_close && myVal  < var_too_far) {
      //No Change
      fill(255);
      textSize(16);
      text("NO Change | Safety Zone", width * 0.10, 175);
      
      //Image Display
       image(checkImg, width * 0.10, 200);
    }
  }
    
    
  }
  
  
  
