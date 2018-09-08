import processing.svg.PGraphicsSVG;

void setup(){
 
  size(800,800);
  background(255);
  frameRate(3);              //フレームレートの設定
  
}


void draw() {
  
  background(255);
  
  float x = width / 2;      //中心のx座標
  float y = height /2;     //中心のy座標
  int    k = int(random(100)%5 + 3);                   //正k角形
  int    r = 200;               //正k角形の内接円の半径(最初の図形の大きさ)
  int    n = 3;                   //再帰回数
  
  /* デフォルトの設定
  float x = width / 2;      //中心のx座標
  float y = height /2;     //中心のy座標
  int    k = 3;                   //正k角形
  int    r = 200;               //正k角形の内接円の半径(最初の図形の大きさ)
  int    n = 5;                   //再帰回数
  */
  
  drawRegularPolygon(x,y,k,r,n);
  
  if(keyPressed) {
    if(key == 's') {             //sを押すと画像を保存
      println("save");
      beginRecord(SVG, "saiki.svg");
      
      drawRegularPolygon(x,y,k,r,n);
      
      endRecord();
      
    }
  }
}



void drawRegularPolygon(float x0, float y0, int k, int r, int n)   //中心座標( x0 , y0)で半径rの円に内接する正k角形を描画する。
{
  
  float [] x = new float [50];                     //正k角形のx座標格納用配列。(正50角形まで対応)
  float [] y = new float [50];                     //正k角形のx座標格納用配列。(正50角形まで対応)
  
  float theta = 360 / k; // 円をk等分する。
  
 //--------------------------------------------------------------------------------------------------------------------------
 //中心座標で円をk等分し、k等分した円周上の点を正k角形の頂点として結んでいく。
 //各頂点のx,y座標を配列に格納-
 //--------------------------------------------------------------------------------------------------------------------------
  for(int i =0; i<k; i++){

    float x1 = x0 + r*cos(theta*i *PI/180);
    float y1 = y0 + r*sin(theta*i *PI/180);
    
   x[i] = x1;           //正k角形のx座標を格納。
   y[i] = y1;          //正k角形のy座標を格納。
    
  }
  
 //-------------------------------------------------------------------------------------------------------------------------
 //正k角形の描画
 //-------------------------------------------------------------------------------------------------------------------------
  
  noFill();               //図形は塗りつぶししない。
  stroke(0);          //線の色は黒
  beginShape();   //各頂点を結ぶ。
  
  for(int i=0; i<k;i++){
    
  vertex(x[i] ,y[i]);
  
  }
  
  endShape(CLOSE); //多角形を閉じた図形にする。
  
 //-------------------------------------------------------------------------------------------------------------------------
 //各頂点に対し、その頂点を中心とする正k角形を描画。(再帰)
 //-------------------------------------------------------------------------------------------------------------------------
 
  for(int i=0; i<k;i++){
    
    if(n>1){
      
        drawRegularPolygon(x[i], y[i], int(random(100)%10+3), int(random(50)+1), n-1);  
        //drawRegularPolygon(x[i], y[i], k, r/2, n-1); //デフォルトの設定 
      
      }
    
  }
 //-------------------------------------------------------------------------------------------------------------------------
 
 
}
