import processing.svg.PGraphicsSVG;

void setup() {
  size(700, 700);
  //beginRecord(SVG, "fractal_takada.svg");
  noFill();
  rectMode(CENTER);
  rect1(width/2, height/2, 500, 500,3);
  //endRecord();
}

void rect1(float x, float y, float w, float h,int n) {
  rect(x, y, w, h);
  ellipse(x,y,w,h);
  //ellipse(x,y,w*1.1,h);
  if (n>1) {
    float newW = w/4.26;
    float newH = h/4.26;
    
    rect1(x, y, newW,newH, n-1);
    rect1(x+newW, y, newW,newH, n-1); 
    rect1(x-newW, y, newW,newH, n-1); 
    rect1(x, y+newH, newW,newH, n-1); 
    rect1(x, y-newH, newW,newH, n-1);
    rect1(x+newW, y+newH, newW,newH, n-1); 
    rect1(x-newW, y-newH, newW,newH, n-1); 
    rect1(x-newW, y+newH, newW,newH, n-1); 
    rect1(x+newW, y-newH, newW,newH, n-1);
  }
}
