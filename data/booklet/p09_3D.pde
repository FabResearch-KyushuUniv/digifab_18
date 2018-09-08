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
  VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(300,300,300), 300, 300, 300);
  
  //IsoSurfaceオブジェクト"surface"の宣言と初期化
  IsoSurface surface = new ArrayIsoSurface(volume);
  
  //TriangleMeshオブジェクト"mesh"の初期化
  mesh = new TriangleMesh();
  
  //VolumetricBrushオブジェクト"brush"の宣言と初期化。
  //BoxBrushとRoundBrushがある。
  VolumetricBrush brush = new RoundBrush(volume, 1);
  //VolumetricBrush brush = new BoxBrush(volume, 1);
  
  //x,y,z軸方向にdrawAtAbsolutePosメソッドを用いて描く
  for(int i = 0; i< 4; i++) {
    //ブラシの大きさを指定
    brush.setSize(20);
    brush.drawAtAbsolutePos(new Vec3D(i*20,0,0),1);
    brush.drawAtAbsolutePos(new Vec3D(0,i*20,0),1);
    brush.drawAtAbsolutePos(new Vec3D(0,0,i*20),1);
     brush.drawAtAbsolutePos(new Vec3D(70,0,i*20),1);
      brush.drawAtAbsolutePos(new Vec3D(0,70,i*20),1);
       brush.drawAtAbsolutePos(new Vec3D(70,70,i*20),1);
           brush.drawAtAbsolutePos(new Vec3D(i*20,70,0),1);
               brush.drawAtAbsolutePos(new Vec3D(i*20,0,70),1);
                   brush.drawAtAbsolutePos(new Vec3D(i*20,70,70),1);
                      brush.drawAtAbsolutePos(new Vec3D(70,i*20,0),1); 
                      brush.drawAtAbsolutePos(new Vec3D(0,i*20,70),1);
                       brush.drawAtAbsolutePos(new Vec3D(70,i*20,70),1);
         brush.drawAtAbsolutePos(new Vec3D(i*20,0,70),1);
    brush.drawAtAbsolutePos(new Vec3D(0,i*20,70),1);
    brush.drawAtAbsolutePos(new Vec3D(0,0,70+i*20),1);
     brush.drawAtAbsolutePos(new Vec3D(70,0,70+i*20),1);
      brush.drawAtAbsolutePos(new Vec3D(0,70,70+i*20),1);
       brush.drawAtAbsolutePos(new Vec3D(70,70,70+i*20),1);
           brush.drawAtAbsolutePos(new Vec3D(i*20,70,70),1);
               brush.drawAtAbsolutePos(new Vec3D(i*20,0,140),1);
                   brush.drawAtAbsolutePos(new Vec3D(i*20,70,140),1);
                      brush.drawAtAbsolutePos(new Vec3D(70,i*20,70),1); 
                      brush.drawAtAbsolutePos(new Vec3D(0,i*20,140),1); 
 brush.drawAtAbsolutePos(new Vec3D(70,i*20,70),1);
   brush.drawAtAbsolutePos(new Vec3D(70,i*20,140),1);
  }
  
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
    mesh.saveAsSTL( sketchPath( "Sonodakoki.stl" ));
  }
}


//照明を設定する関数
void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}