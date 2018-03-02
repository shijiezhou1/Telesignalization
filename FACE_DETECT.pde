import gab.opencv.*; 
import processing.video.*; 
import java.awt.*;
import java.lang.*;
import java.util.*;

PImage heart;

PImage Sone, Stwo, Sthree, Sfour, Sfive;
PImage holdingball;

Capture cam; 
OpenCV opencv; 
Rectangle[] faces;
OpenCV opencvtwo;
PFont hearttext; //font for the heart
PFont alert; //font for the alert message 
PFont generaltextsize;

int[] angles = { 30, 10, 45, 35, 60, 38, 75, 67 };

/////////////////////////////////
int PEOPLE5 = 0;
int PEOPLE4 = 0;
int PEOPLE3 = 0;
int PEOPLE2 = 0;
int PEOPLE1 = 0;
/////////////////////////////////////////////active graphic////////////////
ArrayList<Ball> balls;
final int ballWidth = 5;
Line xline;
Line yline;

int MODEL;
int systemtime;
int PADDING = 30;
float LINE_ONE = 70.0;
float LINE_TWO = 60.0;
float theta;   
float newvalue;
float numberofface = 0; //for MODEL 3
int timeoffaceturn = 0;

////////////face undetected ////////////
float textx= 150;
PFont texty; 
int index = 0;
String[] headlines1 = {"FACES ARE NOT DETECTED!"}; 
String[] headlines2 =   {"PLEASE FACE SCREEN AND STAND STLL WHILE HOLDING CRYSTALL BALLS!"};
////////////face undetected ////////////

boolean faceturned = false;
int facetime = 0;
int oldfacetime;

/////////////////////////////////////motion tracking variable ////////////////
PImage prevFrame;
float threshold = 50; //how different must a pxiel be to be a motion pixel
Motion newmotion;
float keeptrackmotionCount = 0;
PImage smileface;
//////////////////////////////////////

///////////////////////////////number of people in the frame/////////////
PImage people;

///////////////////////////////left and right arrow image////////////////
PImage leftimg, rightimg; 
/////////////////////////////image for eyes to screen////////////////////
PImage eyestoscreen1, eyestoscreen2, eyestoscreen3, eyestoscreen4, eyestoscreen5, eyestoscreen6;
PImage twofacelocation1, twofacelocation2, twofacelocation3, twofacelocation4, twofacelocation5, twofacelocation6;

public int toDRAW;
public float FACE_DISTANCE;
public float FACE_WIDTH;
public double DIFF;
public float motionthreshold;



///////////////////////////////FrameDifferencingAJA//////////////////////

int numPixels;
int[] previousFrame;


int randomfilename;

import processing.serial.*;
import cc.arduino.*;

Arduino arduino; 
int ledPin1 = 2; //red input
int ledPin2 = 3; //~ red light on
int ledPin3 = 5; //~ blue light on
int ledPin4 = 7;  //blue input
boolean redbuttonUnpressed; //unpress red button
boolean bluebuttonUnpressed; //unpress blue button

void setup() {

  //String[] cameras = Capture.list();
  //cam = new Capture(this, cameras[0]);
  //frameRate(30);
  fullScreen();  //display full screen press ESC to full screen
  //size(800, 600);
  noStroke();
  background (0, 0, 0);  //black background initial
  cam = new Capture(this, 320, 200);  // default capture devidce and size of capture  invoke
  //cam = new Capture(this, 480, 320);  // default capture devidce and size of capture  invoke
  cam.start();  

  //create an empty image the same size as the video 
  prevFrame = createImage(cam.width/2, cam.height/2, RGB);
  newmotion = new Motion();

  opencv = new OpenCV(this, cam.width, cam.height); 
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  faces = null; // null since no face at the beginning

  heart = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/heart.png");
  hearttext = loadFont("CenturyGothic-Bold-23.vlw"); 
  generaltextsize = loadFont("CenturyGothic-Bold-23.vlw"); 
  alert = loadFont("CenturyGothic-Bold-48.vlw");

  Sone = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/1.jpg");
  Stwo = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/2.jpg");
  Sthree = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/3.jpg");
  Sfour = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/4.jpg");
  Sfive = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/5.jpg");
  smileface = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/smile.png");
  people = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/people.png");
  leftimg = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/leftimg.png");
  rightimg = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/rightimg.png");

  holdingball = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/holdingball.png");

  eyestoscreen1 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/eyestoscreen1.png");
  eyestoscreen2 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/eyestoscreen2.png");
  eyestoscreen3 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/eyestoscreen3.png");
  eyestoscreen4 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/eyestoscreen4.png");
  eyestoscreen5 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/eyestoscreen5.png");
  eyestoscreen6 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/eyestoscreen6.png");

  twofacelocation1 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/twofacelocation1.png");
  twofacelocation2 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/twofacelocation2.png");
  twofacelocation3 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/twofacelocation3.png");
  twofacelocation4 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/twofacelocation4.png");
  twofacelocation5 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/twofacelocation5.png");
  twofacelocation6 = loadImage("/Users/account/Documents/Processing/FACE_DETECT/data/twofacelocation6.png");

  MODEL = 1; //first choice
  smooth(2); //make the image render fast

  ////////////////////////Ball///////////////////////
  balls = new  ArrayList();
  int screen300 = 500;
  for (int i=0; i < screen300; i++) { 
    balls.add(new Ball(50, -100, ballWidth, color (0, 0, 0)));
  }

  //////////////////////////Ball End/////////////////////
  
  
  numPixels = cam.width * cam.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  // loadPixels();
  
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[1], 57600); //dev/cu.usbmodem14111
  arduino.pinMode(ledPin1, Arduino.INPUT);
  arduino.pinMode(ledPin4, Arduino.INPUT);
  arduino.pinMode(ledPin2, Arduino.OUTPUT);
  arduino.pinMode(ledPin3, Arduino.OUTPUT);
}


void draw() {

  randomfilename = int(random(0, 100));
  
  //when all the button is released / unpressed open the windows
  redbuttonUnpressed = (arduino.digitalRead(ledPin1)==Arduino.LOW);
  bluebuttonUnpressed = (arduino.digitalRead(ledPin4)==Arduino.LOW);

  if (bluebuttonUnpressed) {
    arduino.digitalWrite(ledPin3, Arduino.HIGH); //blue
  }else{
    arduino.digitalWrite(ledPin3, Arduino.LOW); //blue
    
  }
  
  if (redbuttonUnpressed) {
    arduino.digitalWrite(ledPin2, Arduino.HIGH); //red
  }else{
    arduino.digitalWrite(ledPin2, Arduino.LOW); //red
  }

  if (redbuttonUnpressed || bluebuttonUnpressed) { //nothing over the button then display the result
    //println("twobutton pressed light on and not result" + frameRate);
    background(0);
    fill(0, 255, 0); 
    textFont(alert);
    textSize(40); 
    text(headlines1[index], textx, 100);
    text(headlines2[index], textx, 150);
    image(holdingball, 300, 300);
  }else{
    storemethod();
  }
  
  
  
}//END OF THE DRAWING METHOD

public static char makerandomCharacter() {
  Random rnd = new Random();
  char c = (char) (rnd.nextInt(26) + 'a');
  println(c);
  return c;
}

public float scalenum(float s, float a1, float a2, float b1, float b2) {
  return b1 + (s-a1)*(b2-b1)/(a2-a1);
}

public void captureEvent(Capture cam) { 
  //addition information 
  //prevFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height);
  //prevFrame.updatePixels();

  cam.read();
}
float numberface() {
  return faces.length;
}
float numberdistance() {
  return FACE_DISTANCE;
}

float numberwidth() {
  return FACE_WIDTH;
}
double twopeoplefar() { 
  return this.DIFF;
}

void faceThere() {
  if (faces.length<=0) {
    delay(800);
    background(0);
    fill(0, 255, 0); 
    textFont(alert);
    textSize(40); 
    text(headlines1[index], textx, 100);
    text(headlines2[index], textx, 150);
    image(holdingball, 300, 300);
    delay(100);
  }
}

float happylevel() {
  return this.keeptrackmotionCount;
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;

  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

float scaleit(float value, float min, float max, float newmin, float newmax) {
  return newvalue= (newmax - newmin)/(max-min)*(value-max)+newmax;
}

void storemethod(){

  //println(frameRate); //frameRate is important for the smile face
  //println(frameCount);
  FACE_DISTANCE=0;
  FACE_WIDTH = 0;
  DIFF = 0;
  systemtime = millis(); //every five seconds check 
  Makey makey = new Makey();
  makey.keyPressed(); //model 1, model 2, model 3 and model 4 

  rectangles drawrect= new rectangles();

  opencv.loadImage(cam); 
  faces = opencv.detect(); //init the faces array - its now no longer null

  if (MODEL == 1) {
    image(cam, 0, 0, width/2, height/2);
    
    //motion detection here
    int movementSum = 0; // Amount of movement in the frame
    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = cam.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      // Add these differences to the running tally
      movementSum += diffR + diffG + diffB;
      // Render the difference image to the screen
      // pixels[i] = color(diffR, diffG, diffB);
      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      // Save the current color into the 'previous' buffer
      previousFrame[i] = currColor;
    }
    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.
    if (movementSum > 0) {
      motionthreshold = movementSum;
      //println(movementSum); // Print the total amount of movement to the console
      
    }
    
  } else if (MODEL ==2) {
  } else if (MODEL ==3) {
  } else if (MODEL ==4) {
  }

  if (MODEL==1) {
    faceThere(); //always check if there is any face exit
    if (faces!=null) { 
      for (int i=0; i< faces.length; i++) { 
        //noFill(); 
        //stroke(0, 255, 0); 
        //strokeWeight(1.5); 
        //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
        textSize(12);
        fill(0, 255, 0); //text only green color
        //text("Person: " + faces.length, faces[i].x + LINE_TWO, faces[i].y - 10);
        FACE_WIDTH = faces[i].width; //each rectangle size
        FACE_DISTANCE = faces[i].x;
        if (faces.length == 2) {
          double firstfaceX = Math.abs((faces[1].x + faces[1].width/2) - (faces[0].x + faces[0].width/2));
          double firstfaceY = Math.abs((faces[1].y + faces[1].height/2) - (faces[0].y + faces[0].height/2));

          double diff = Math.sqrt(Math.pow(firstfaceX, 2) + Math.pow(firstfaceY, 2)); //square root (x^2 + y^2) 
          DIFF = diff; //different is the value
        } else if (faces.length == 3) {
          double firstfaceX = Math.abs((faces[1].x + faces[1].width/2) - (faces[0].x + faces[0].width/2));
          double firstfaceY = Math.abs((faces[1].y + faces[1].height/2) - (faces[0].y + faces[0].height/2));

          double diff = Math.sqrt(Math.pow(firstfaceX, 2) + Math.pow(firstfaceY, 2)); //square root (x^2 + y^2) 
          DIFF = diff; //different is the value
        } else if (faces.length == 4) {
          double firstfaceX = Math.abs((faces[1].x + faces[1].width/2) - (faces[0].x + faces[0].width/2));
          double firstfaceY = Math.abs((faces[1].y + faces[1].height/2) - (faces[0].y + faces[0].height/2));

          double diff = Math.sqrt(Math.pow(firstfaceX, 2) + Math.pow(firstfaceY, 2)); //square root (x^2 + y^2) 
          DIFF = diff; //different is the value
        }
        drawrect.moreRect();
        time(); //display the time

        newmotion.motion(); //call the motion class
      }
    }//FACE IS NOT NULL
  } else if (MODEL == 2) { //down===========================================================================
    //background(255, 0, 0); //make the background   all red
    if (faces!=null) {
      for (int i=0; i< faces.length; i++) { 
        noFill(); 
        stroke(255, 255, 255);  //white tracking 
        strokeWeight(1.5); 
        rect(faces[i].x, faces[i].y, faces[i].width/10, faces[i].height/10);
      }
    }
  } else if (MODEL == 3) {  //left===========================================================================
    faceThere();

    background(0, 255, 0);
    faceThere(); //always check if there is any face exit
    if (faces!=null) { 
      for (int i=0; i< faces.length; i++) { 
        noFill(); 
        stroke(255, 255, 255); 
        strokeWeight(1.5); 
        //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
        textSize(12);
        fill(0, 255, 0); //text only green color
        //text("Person: " + faces.length, faces[i].x + LINE_TWO, faces[i].y - 10);
        FACE_WIDTH = faces[i].width; //each rectangle size
        FACE_DISTANCE = faces[i].x;
        numberofface = scaleit(faces.length, 0, 10, 0, width);
        float a = (random(numberofface, numberofface+1) / (float) width) * 90f;
        // Convert it to radians
        theta = radians(a*2);
        // Start the tree from the bottom of the screen
        translate(width/2, height);
        // Draw a line 120 pixels
        line(0, 0, 0, -120);
        // Move to the end of that line
        translate(0, -120);
        // Start the recursive branching!
        branch(120);
      }
    }//FACE IS NOT NULL

    println("Showing your 3");
  } else if (MODEL == 4) { //right===========================================================================
    faceThere();
    println("Showing your 4");
  }
  

}