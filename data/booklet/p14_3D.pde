//ライブラリパッケージtoxiclibsのうち4つをインポート
import toxi.volume.*; //こいつをインポートすることで１つながりの3Dモデルして処理できる
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*; 

//マウスでぐりぐりするためのライブラリ
import peasy.*;
PeasyCam CAM;

//TriangleMeshオブジェクト"mesh"の宣言
TriangleMesh mesh;

//draw関数で描画するためのToxiclibsSupportオブジェクト"gfx"の宣言
ToxiclibsSupport gfx;

//VolumetricSpaceオブジェクト"volume"の宣言と初期化。
  //Vec3D(200,200,200)で空間を指定し、200, 200, 200でx,y,z方向にそれぞれ何分割するか指定している。
 VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(200,200,200), 200, 200, 200);
 
 //VolumetricBrushオブジェクト"brush"の宣言と初期化。
  //BoxBrushとRoundBrushがある。
  VolumetricBrush brush = new RoundBrush(volume, 1); //球のブラシ
  //VolumetricBrush brush = new BoxBrush(volume, 1); //ボックスのブラシ


void setup() {
  //3Dを描画するため、3つめのパラメータにP3Dを設定
  size(600, 600, P3D);
  
  //マウスでぐりぐりするためのカメラ設定
  CAM = new PeasyCam(this, 300);
  
  
  //IsoSurfaceオブジェクト"surface"の宣言と初期化
  //分割したモデルの表面に面を張る
  IsoSurface surface = new ArrayIsoSurface(volume);
  
  //TriangleMeshオブジェクト"mesh"の初期化
  //張った面に三角メッシュを乗せる
  mesh = new TriangleMesh();
  
//ここに描画する図形を書き込む-----------------------------------------------------------------------------------------------------------------------
 
 //最初に原点に球を1つ描画する
 
   float x0 = 0;
   float y0 = 0;
   float z0 = 0;
   
   //球の半径
   float r_0 = 30;
    brush.setSize(r_0); //ブラシの大きさの指定
    brush.drawAtAbsolutePos(new Vec3D(x0,y0,z0),1);
  
  //再帰回数
  int n = 3;
  
   make_cone(40,30,x0,y0,z0,n);
   //make_cube(50,30,x0,y0,z0,n);
      
 //ここまでに描画する図形を書き込む-----------------------------------------------------------------------------------------------------------------------
 
  //VolumetricSpaceを超えて描かれた場合に塞ぐ
  volume.closeSides();
  
  //メッシュを空間に貼る
  surface.reset();
  surface.computeSurfaceMesh(mesh, .1); //バラバラのメッシュをつなぎ合わせてくれる

  //ToxiclibsSupportオブジェクト"gfx"の初期化
  gfx = new ToxiclibsSupport(this);
}




void draw() {
  //背景色を白に
  background(255);
  
  //陰影をつける
  myLights();
  
  //線指定
  //stroke(0);
  noStroke(); //こっちの方が処理は軽い
  
  //物体を描画
  gfx.mesh(mesh);
  
  //座標軸を描画
  stroke(255, 0, 0);
  line(0, 0, 0, 1000, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 1000, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 1000); 
}


void make_cone(float r, int b,float x, float y, float z, int n){
  
  //４つの頂点の座標を作成
   float x1 = x-((sqrt(6)*r)/3);
   float y1 = y-(r/3);
   float z1 = z-(sqrt(2)/3)*r ;
   
   float x2 = x+(sqrt(6)*r)/3;
   float y2 = y -(r/3);
   float z2 = z-(sqrt(2)/3)* r;
   
   float x3 = x+0;
   float y3 = y-(r/3);
   float z3 = z+((sqrt(2)*2)/3)*r;
   
   float x4 = x+0;
   float y4 = y+r;
   float z4 = z+0;
 
    //ブラシの大きさの指定
    brush.setSize(b);  
    
    //三角錐の頂点に球を配置
    brush.drawAtAbsolutePos(new Vec3D(x1, y1, z1),1); 
    
    brush.drawAtAbsolutePos(new Vec3D(x2,y2, z2),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x3, y3, z3),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x4, y4, z4),1);
  
  //再帰描画
  if(n>1){
    
    r = r /2;
    b = b /2;
    
    make_cone(r,b,x1,y1,z1,n-1);
    make_cone(r,b,x2,y2,z2,n-1);
    make_cone(r,b,x3,y3,z3,n-1);
    make_cone(r,b,x4,y4,z4,n-1);
    
  }
}

void make_cube(float r, int b,float x, float y, float z, int n){
  
  //8つの頂点の座標を作成
   float x1 = x+(-r/(sqrt(2)));
   float y1 = y+(-r/(sqrt(2)));
   float z1 = z+(-r/(sqrt(2))) ;
   
   float x2 = x+(sqrt(2)*r);
   float y2 = y-(r/(sqrt(2)));
   float z2 = z-(r/(sqrt(2)));
   
   float x3 = x+(sqrt(2)*r);
   float y3 = y-(r/(sqrt(2)));
   float z3 = z+(sqrt(2)*r);
   
   float x4 = x+(-r/(sqrt(2)));
   float y4 = y+(-r/(sqrt(2)));
   float z4 = z+(sqrt(2)*r);
   
   float x5 = x+(-r/(sqrt(2)));
   float y5 = y+(sqrt(2)*r);
   float z5 = z+(-r/(sqrt(2))) ;
   
   float x6 = x+(sqrt(2)*r);
   float y6 = y+(sqrt(2)*r);
   float z6 = z-(r/(sqrt(2)));
   
   float x7 = x+(sqrt(2)*r);
   float y7 = y+(sqrt(2)*r);
   float z7 = z+(sqrt(2)*r);
   
   float x8 = x+(-r/(sqrt(2)));
   float y8 = y+(sqrt(2)*r);
   float z8 = z+(sqrt(2)*r);
   
   //ブラシの大きさの指定
    brush.setSize(b);  
    
    //立方体の頂点に球を配置
    brush.drawAtAbsolutePos(new Vec3D(x1, y1, z1),1); 
    
    brush.drawAtAbsolutePos(new Vec3D(x2,y2, z2),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x3, y3, z3),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x4, y4, z4),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x5, y5, z5),1); 
    
    brush.drawAtAbsolutePos(new Vec3D(x6,y6, z6),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x7, y7, z7),1);
    
    brush.drawAtAbsolutePos(new Vec3D(x8, y8, z8),1);
    
    //再帰描画
  if(n>1){
    
    r = r /2;
    b = b /2;
    
    make_cube(r,b,x1,y1,z1,n-1);
    make_cube(r,b,x2,y2,z2,n-1);
    make_cube(r,b,x3,y3,z3,n-1);
    make_cube(r,b,x4,y4,z4,n-1);
    make_cube(r,b,x5,y5,z5,n-1);
    make_cube(r,b,x6,y6,z6,n-1);
    make_cube(r,b,x7,y7,z7,n-1);
    make_cube(r,b,x8,y8,z8,n-1);
    
  }
}



void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "saiki.stl" )); //3Dオブジェクトの書き出し
  }
}


//照明を設定する関数
void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
