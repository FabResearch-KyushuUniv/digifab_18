//ライブラリパッケージtoxiclibsのうち4つをインポート
import toxi.volume.*;
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



void setup() {
  //3Dを描画するため、3つめのパラメータにP3Dを設定
  size(600, 600, P3D);
  
  //マウスでぐりぐりするためのカメラ設定
  CAM = new PeasyCam(this, 300);
  
  //VolumetricSpaceオブジェクト"volume"の宣言と初期化。
  //Vec3D(200,200,200)で空間を指定し、200, 200, 200でx,y,z方向にそれぞれ何分割するか指定している。
  VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(200,200,200), 200, 200, 200);
  
  //IsoSurfaceオブジェクト"surface"の宣言と初期化
  IsoSurface surface = new ArrayIsoSurface(volume);
  
  //TriangleMeshオブジェクト"mesh"の初期化
  mesh = new TriangleMesh();
  
  //VolumetricBrushオブジェクト"brush"の宣言と初期化。
  //BoxBrushとRoundBrushがある。
  VolumetricBrush brush = new RoundBrush(volume, 1);
  //VolumetricBrush brush = new BoxBrush(volume, 1);
  
  float n = 2;
  float k = 3;
  
  //x,y,z軸方向にdrawAtAbsolutePosメソッドを用いて描く
  for(float i = 0; i < 1200; i++) {
    float radian = radians(i*0.3*k);
    float radius = 80*sin(n*radian/k);
    float x = radius*cos(radian);
    float y = radius*sin(radian);
    //float z = abs(sin(radians(i*18)));
    float z = abs(50*sin(radians(i*3/5)));
    
    //ブラシの大きさを指定
    brush.setSize(2);
    brush.drawAtAbsolutePos(new Vec3D(x,y,z),1);
  }
  
  brush.setSize(30);
  brush.drawAtAbsolutePos(new Vec3D(0,0,35),1);
  
  //VolumetricBrush brush2 = new BoxBrush(volume, 1);
  //brush2.setSize(50);
  //brush2.drawAtAbsolutePos(new Vec3D(0,0,70),1);
  
  //VolumetricSpaceを超えて描かれた場合に塞ぐ
  volume.closeSides();
  
  //メッシュを空間に貼る
  surface.reset();
  surface.computeSurfaceMesh(mesh, .1);

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
  noStroke();
  
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




void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "brush.stl" ));
  }
}


//照明を設定する関数
void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
