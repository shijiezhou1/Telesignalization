int number = 0;
class Makey {
  public void keyPressed() {
    if (key==CODED && keyCode == UP) {
      //println("up");
      MODEL = 1;
    }
    if (key==CODED && keyCode == DOWN) {
      //println("down");
      MODEL = 2;
    }
    if (key==CODED && keyCode == LEFT) {
      //println("right");
      MODEL = 3;
      background(0); //make the black background
    }
    if (key==CODED && keyCode == RIGHT) {
      //println("left");
      MODEL = 4;
      background(0, 0, 0);
    }

    if (key == 's') {
      println("Saving...");
      String s = "screen " + makerandomCharacter() + makerandomCharacter() + nf(number, randomfilename) +".png";
      save(s);
      number++; //order from 0 to infinity
      println("Done saving.");
    }
  }
}