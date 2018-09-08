import processing.svg.PGraphicsSVG;

void setup(){
  size(400,400);
  background(255);
  noFill();
  beginRecord(SVG, "PApplet.svg");
  circleR(200,200,180,4);
  endRecord();
}

void circleR(float x, float y, float r,int n){
  ellipse(x,y,r*2,r*2);
  if(n>1){
    float newR = r/2;
    circleR(x+newR,y,newR,n-1);
    circleR(x-newR,y,newR,n-1);
    circleR(x,y+newR,newR,n-2);
    circleR(x,y-newR,newR,n-2);
  }
}
