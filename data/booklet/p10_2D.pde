//SVG用のライブラリをインポート
import processing.svg.PGraphicsSVG;

float scale = 0.7;  //枝の短くなる比率
float angle = 30; //枝の広がり
float len = 70;  //最初の枝の長さ
int nn = 9; //枝別れの段数
float weight = 1; //幹の太さ

void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  
  beginRecord(SVG, "2D.svg");
  //四角形
  rectMode(CENTER);
  noFill();
  rect(width/2, height/2, 480, 480);
  //名前
  fill(0);
  textSize(32);
  textAlign(CENTER);
  text("FRACTAL", width/2, height/2+12);
  //木
  for(int n = 0; n < 360; n += 60){
    drawTree(width/2, height/2, len, n, nn, weight);
    //weight = 5.5;
  }
  endRecord();
  
}

void drawTree(float x1, float y1, float len, float stand, int n,float i) {
  strokeWeight(i);
  float x2= x1 + len*sin(radians(stand));  //枝先のx座標
  float y2= y1 - len*cos(radians(stand));  //枝先のy座標
  line(x1, y1, x2, y2);  //線を描く
  if (n >= 1) {
    drawTree(x2, y2, len*scale, stand-angle, n-1,i); //次の左の枝の再帰呼出し
    drawTree(x2, y2, len*scale, stand+angle, n-1,i); //次の右の枝の再帰呼出し
  }
}
