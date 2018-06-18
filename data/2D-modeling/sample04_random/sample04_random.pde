void setup() {
  
size (500, 500);
colorMode(HSB, 360, 256, 256);
background(0);
noStroke();
smooth();
rectMode(CENTER);

}

void draw() {

  for (int i = 0; i < 10; i++) {
  pushMatrix();
  translate(random(width), random(height));
  rotate(random(PI/2));
  scale(random(0.5, 5));
  fill(random(0, 90), 255, 255, 51);
  rect(0, 0, 10, 10);
  popMatrix();
}

}