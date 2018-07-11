//ライブラリパッケージtoxiclibsのうち3つをインポート
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

//マウスでぐりぐりするためのライブラリ
import peasy.*;
PeasyCam cam;

//TriangleMeshオブジェクト"sphere_mesh"の宣言
TriangleMesh sphere_mesh;

//draw関数で描画するためのToxiclibsSupportオブジェクト"gfx"の宣言
ToxiclibsSupport gfx;



void setup() {
  //3Dを描画するため、3つめのパラメータにP3Dを設定
  size(600, 600, P3D);
  
  //マウスでぐりぐりするためのカメラ設定
  cam = new PeasyCam(this, 1000);
  
  //Sphereオブジェクト"sphere01"の宣言と初期化
  Sphere sphere01 = new Sphere(150);
  
  //TriangleMeshオブジェクト"sphere_mesh"の初期化
  sphere_mesh = new TriangleMesh();
  
  //球体をメッシュに変換
  sphere01.toMesh(sphere_mesh, 10);
  
  //ToxiclibsSupportオブジェクト"gfx"の初期化
  gfx = new ToxiclibsSupport(this);
}



void draw() {
  //背景色を白に
  background(255);
  
  //陰影をつける
  myLights();
  
  //線色を黒に指定
  stroke(0);
  //noStroke();
  
  //物体を描画
  gfx.mesh(sphere_mesh);
  
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
    sphere_mesh.saveAsSTL(sketchPath("sphere.stl"));
  }
}


//照明を設定する関数
void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
