
float scale = 0.7;  //枝の短くなる比率
float angle = 35; //枝の広がり
float len = 65;  //最初の枝の長さ
int nn = 8; //枝別れの段数

void setup() {
  size(250, 250);
  background(255);
  stroke(100, 153, 0);
  drawTree(width/2, height, len, 0, nn);
}

void drawTree(float x1, float y1, float len, float stand, int n) {
  float x2= x1 + len*sin(radians(stand));  //枝先のx座標
  float y2= y1 - len*cos(radians(stand));  //枝先のy座標
  line(x1, y1, x2, y2);  //線を描く
  if (n >= 1) {  
    drawTree(x2, y2, len*scale, stand-angle, n-1); //次の左の枝の再帰呼出し
    drawTree(x2, y2, len*scale, stand+angle, n-1); //次の右の枝の再帰呼出し
    //drawTree(x2, y2, len*scale, 0,n-1);
  }
}
