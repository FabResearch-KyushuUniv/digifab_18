int numVertices = 6;      // 円状に複製する数
int weight = 3;           // 線の太さ
color bgColor, fillColor; // 背景色と線の色

void setup(){
  // 加算合成するためレンダラはP2Dで
  size(1000, 1000, P2D);
  // 線を滑らかに
  smooth(8);
  // 色指定はHSB
  colorMode(HSB, 360, 100, 100, 100);
  // 加算合成
  blendMode(ADD);
  bgColor = color(210, 80, 5);
  fillColor = color(0, 80, 40);
  background(bgColor);
  //size(600,600); //背景白にする
  //background(255);
}

void draw(){
  // 原点を画面中心に
  translate(width/2, height/2);
  
  // マウス座標の位置調整
  int mouseX2 = mouseX-width/2;
  int mouseY2 = mouseY-height/2;
  int pmouseX2 = pmouseX-width/2;
  int pmouseY2 = pmouseY-height/2;
  
  // マウスを押してるときだけ描画する
  if(mousePressed){
    // 描画フレーム数に応じて色変化
    stroke(frameCount%361, 80, 50, 50);
    strokeWeight(weight);
    // 円状にnumVerticesの数だけ複製
    for(float i = 0; i < 360; i += 360.0/numVertices){
      // 角度をラジアンに
      float angle = radians(i);
      pushMatrix();
      // 回転
      rotate(angle);
      // マウスの動き通りに描画される線
      line(mouseX2, mouseY2, pmouseX2, pmouseY2);
      // x軸に反転して描画される線
      line(-mouseX2, mouseY2, -pmouseX2, pmouseY2);
      popMatrix();
    }
  }
}

void keyPressed(){
  // 円状に複製する数の増減
  if(key == 'q') numVertices = constrain(--numVertices, 2, 20);
  if(key == 'w') numVertices = constrain(++numVertices, 2, 20);
  // 線の太さの増減
  if(key == 'e') weight = constrain(--weight, 1, 20);
  if(key == 'r') weight = constrain(++weight, 1, 20);
  // 背景初期化
  if(key == ' ') background(bgColor);
  // 画像出力
  if(key == 's') saveFrame("draw2.jpg");
}
