int value = 0;

void setup() {
  size(600,600);
  background(255);
  frameRate(60);
  rectMode(CENTER);
}

void draw() {
  noStroke();
  fill(value,value,0);
  rect(mouseX, mouseY, 10, 10);
}

void mouseClicked(){
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}