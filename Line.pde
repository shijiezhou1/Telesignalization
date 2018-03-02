class Line {

  Line(int x, int y, int x1, int y1, int temp) {
    fill(temp);
    strokeWeight(3);
    line(x, y, x1, y1);
  }
}