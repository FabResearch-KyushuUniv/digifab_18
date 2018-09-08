import processing.svg.PGraphicsSVG;
void setup() {
  beginRecord(SVG, "Sonoda Koki .svg");
  size(250, 250);
  noFill();
  circlesR(125, 125, 100, 5);
  endRecord(); 
}

void circlesR(float x, float y, float r, int n) {
  ellipse(x, y, r*2, r*2);
  if (n>1) {
    float newR = r/2;
    float angle =random(PI);
    circlesR(x+newR*cos(angle),y+newR*sin(angle), newR, n-1); //右側の円
    circlesR(x-newR*cos(angle),y- newR*sin(angle), newR, n-1); //左側の円
  }
}
