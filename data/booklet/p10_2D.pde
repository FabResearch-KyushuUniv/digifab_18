import processing.svg.PGraphicsSVG;

void setup() {
  beginRecord(SVG, "Fujiwara.svg");
  size(500, 500);
  background(255);
  Line(width/2, height/2, 150, 4);
  endRecord();
}

void Line(float x, float y, float r, int n) {
  final float cos[] = {1, 0.5, -0.5, -1, -0.5, 0.5};
  final float sin[] = {0, 0.8660254, 0.8660254, 0, -0.86602524, -0.86602524};

  final float tx[]={x+r*sin[0], x+r*sin[1], x+r*sin[2], x+r*sin[3], x+r*sin[4], x+r*sin[5]};
  final float ty[]={y+r*cos[0], y+r*cos[1], y+r*cos[2], y+r*cos[3], y+r*cos[4], y+r*cos[5]};

  line(x, y, tx[0], ty[0]);
  line(x, y, tx[1], ty[1]);
  line(x, y, tx[2], ty[2]);
  line(x, y, tx[3], ty[3]);
  line(x, y, tx[4], ty[4]);
  line(x, y, tx[5], ty[5]);

  float R =r/3;
  n--;
  for (int i=0; i<6; i++) {
    if (n>0) {
      Line(tx[i], ty[i], R, n);
    }
  }
}
