import processing.svg.PGraphicsSVG;

float scale = 0.75;  //枝の短くなる比率
float angle = 72; //枝の広がり
float len = 350;  //最初の枝の長さ
int n = 6; //枝別れの段数
float r=250;

void setup() {
    beginRecord(SVG, "PApplet.svg");
  size(800, 800);
  //background(209,227,245);
  stroke(150, 80, 150);
  noFill();
  //ellipse(width/2, height*5/6, r,r);
  drawAjisai(width/2, height, len, 0, r, n);
     endRecord();
}

void drawAjisai(float x1, float y1, float len, float stand, float r1,  int n) {
  float r2= r1*0.5;
  float x2= x1 + len*sin(radians(stand));  //枝先のx座標
  float y2= y1 - len*cos(radians(stand));  //枝先のy座標
  
  line(x1, y1, x2, y2);  //線を描く
  ellipse(x2, y2, r2, r2);
  int ran= int(random(1,4));
  println(ran);

  
  if (n >= 4) {  
   if(ran==3){//長い
    drawAjisai(x2, y2, len*scale, stand, r2, n-1); //次の右の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale, stand-angle, r2,  n-1); //次の左の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale, stand+angle, r2, n-1); //次の右の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale, stand-(angle*2), r2,  n-1); //次の左の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale, stand+(angle*2), r2, n-1); //次の右の枝の再帰呼出し
   }else if(ran>=2&& ran<3){//短い
     drawAjisai(x2, y2, len*scale*scale*scale, stand, r2, n-1); //次の右の枝の再帰呼出し
     drawAjisai(x2, y2, len*scale*scale*scale, stand-angle, r2,  n-1); //次の左の枝の再帰呼出し
     drawAjisai(x2, y2, len*scale*scale*scale, stand+angle, r2, n-1); //次の右の枝の再帰呼出し
     drawAjisai(x2, y2, len*scale*scale*scale, stand-(angle*2), r2,  n-1); //次の左の枝の再帰呼出し
     drawAjisai(x2, y2, len*scale*scale*scale, stand+(angle*2), r2, n-1); //次の右の枝の再帰呼出し
    
     }
  }else if(n<4&&n>=1){
    drawAjisai(x2, y2, len*scale*scale*scale*scale, stand, r2, n-1); //次の右の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale*scale*scale*scale, stand-angle, r2,  n-1); //次の左の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale*scale*scale*scale, stand+angle, r2, n-1); //次の右の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale*scale*scale*scale, stand-(angle*2), r2,  n-1); //次の左の枝の再帰呼出し
    drawAjisai(x2, y2, len*scale*scale*scale*scale, stand+(angle*2), r2, n-1); //次の右の枝の再帰呼出し
    
  }
}
