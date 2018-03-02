class Motion {
  public void motion() {

    loadPixels();
    cam.loadPixels();
    prevFrame.loadPixels();

    float sumX = 0;
    float sumY = 0;
    int motionCount = 0; 

    // Begin loop to walk through every pixel
    for (int x = 0; x < cam.width/2; x++ ) {
      for (int y = 0; y < cam.height/2; y++ ) {
        // What is the current color
        color current = cam.pixels[x+y*cam.width/2];

        // What is the previous color
        color previous = prevFrame.pixels[x+y*cam.width/2];

        // Step 4, compare colors (previous vs. current)
        float r1 = red(current); 
        float g1 = green(current);
        float b1 = blue(current);
        float r2 = red(previous); 
        float g2 = green(previous);
        float b2 = blue(previous);

        // Motion for an individual pixel is the difference between the previous color and current color.
        float diffpixel = dist(r1, g1, b1, r2, g2, b2);

        // If it's a motion pixel add up the x's and the y's
        if (diffpixel > threshold) {  
          sumX += x;
          sumY += y;
          motionCount++;
        }
      }
    }

    // average location is total location divided by the number of motion pixels.
    float avgX = sumX / motionCount; 
    float avgY = sumY / motionCount;      

    keeptrackmotionCount = motionCount; //assignit 

    //println(keeptrackmotionCount);
    //fill(0);
    //ellipse(avgX, avgY, 30, 30);
  }
}