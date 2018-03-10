//This class diplay all the red line location
class Ball {
  float x;
  float y;
  color myColor;
  float w;
  Ball(float tempX, float tempY, float tempW, color tempmyColor1) {
    x = tempX;
    y = tempY;
    w = tempW;
    myColor=tempmyColor1;
  }
  void display(float i) {
    // Display the ball
    fill(myColor);
    stroke(myColor);
    ellipse(i, y, w, w);
    point(i, y);
  }
} 
