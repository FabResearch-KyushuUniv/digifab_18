int pointCount;
int freq = 1; 
float phi = 0;
float angle = 0;
float y = 0;
float x = 0;

void setup(){
  size(600, 600);
  frameRate(60);
}

void draw(){
  pointCount = width;
  fill(255);
  rect(0, 0, width, height);

  translate(0, height/2);
  beginShape();
  for(int i = 0; i <= pointCount; i++) {
    angle = map(i, 0, pointCount, 0, TWO_PI);
    y = sin(angle * freq + radians(phi));
    y = y * 100;
    vertex(i, y);
  }
  endShape();
  
  translate(width/2, height/2);
  beginShape();
  for(int i = 0; i <= pointCount; i++) {
    angle = map(i, 0, pointCount, 0, TWO_PI);
    y = sin(angle * freq + radians(phi));
    y = y * 100;
    x = cos(angle * freq + radians(phi));
    x = x * 100;
    vertex(x, y);
  }
  endShape();
  
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  stroke(0);
  translate(0, height/2);
  beginShape();
  for(int i = 0; i <= pointCount; i++) {
    angle = map(i, 0, pointCount, 0, TWO_PI);
    y = sin(angle * freq + radians(phi));
    y = y * 100;
    vertex(i, y);
  }
  endShape();
  phi += 1;
}