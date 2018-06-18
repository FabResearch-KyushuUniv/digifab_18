int value = 0;
int[] pos_x = new int[0];
int[] pos_y = new int[0];

void setup() {
  size(600,600);
  background(255);
  frameRate(60);
}

void draw() {
  noStroke();
  rect(0,0,width,height);
  stroke(0);  
  beginShape();
  for (int i = 0; i < pos_x.length; i++){
    vertex(pos_x[i], pos_y[i]);
  }
  endShape();
  printArray(pos_x);
  printArray(pos_y);
}

void mouseClicked(){
  pos_x = append(pos_x, mouseX);
  pos_y = append(pos_y, mouseY);
  value += 10;
}