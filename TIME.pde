
public void time() {
  int s = second();
  int m = minute();
  int h = hour();
  String t = nf(h, 2) + ":" + nf(m, 2) + ":" + nf(s, 2);
  fill(0, 255, 0);
  text("Time: " + t, width/2 + PADDING, 0 + PADDING);
}