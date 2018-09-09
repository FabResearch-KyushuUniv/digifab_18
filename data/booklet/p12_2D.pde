float scale = 0.7;  //枝の短くなる比率
float angle = 25; //枝の広がり
float len = 45;  //最初の枝の長さ
int nn = 10; //枝別れの段数

import processing.svg.PGraphicsSVG;
void setup() {
  beginRecord(SVG, "PApplet.svg");
  size(850, 850);
  background(255);
  noStroke();
  fill(0);
  
  drawbubble(width/3-50, height/5*2, len, 0, nn);
   endRecord();
  
}

void drawbubble(float x1, float y1, float len, float stand, int n) {
  float x2= x1 + len*sin(radians(stand));  //枝先のx座標
  float y2= y1 - len*cos(radians(stand));  //枝先のy座標
  float r = sqrt(sq(x1-x2)+sq(y1-y2));
  ellipse((x1+x2)/2,(y1+y2)/2,r/2,r/2);
  
  if (n >= 1) {  

    drawbubble(x2, y2, len*scale, stand-angle, n-1); //次の左の枝の再帰呼出し
    drawbubble(x2, y2, len*scale*1.6, stand+angle, n-1); //次の右の枝の再帰呼出し

  }
  
  
}
