import processing.svg.PGraphicsSVG;

void setup() {
  size(600, 600);
  noLoop();
}

void draw() {
  beginRecord(SVG, "shimata2.svg");
  translate(width/2, height/2);
 
  arcfunction(10);
  endRecord();
}

void arcfunction(int counter) {
  if(counter > 0) {
    float s = 0;
    float e = random(240);
    int r = 50+counter*50;
    float kaiten = (random(360));
    strokeWeight(random(1,15));
    //stroke(100,100,100);
    fill(100,100,100);
    //noFill();
    arc(0, 0, r, r, radians(s), radians(e));
    //fill(0,0,0);
    ellipse(r/2*cos(radians(e)), r/2*sin(radians(e)), 4, 4);
    //strokeWeight(1);
    line(r/2*cos(radians(e)), r/2*sin(radians(e)),0,0);
    rotate(radians(kaiten));
    arcfunction(counter-1);
  }
}
