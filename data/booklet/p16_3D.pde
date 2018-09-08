import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;


import peasy.*;
PeasyCam CAM;


TriangleMesh mesh;
ToxiclibsSupport gfx;
VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(200, 200, 200), 200, 200, 200);
  
IsoSurface surface = new ArrayIsoSurface(volume);
VolumetricBrush brushR = new RoundBrush(volume, 1);  //丸筆
VolumetricBrush brushB = new BoxBrush(volume, 1);  //角筆
  
int counter = 0;


void setup() {
  size(600, 600, P3D);
  CAM = new PeasyCam(this, 300);
  mesh = new TriangleMesh();

  //ブラシの大きさを指定
  brushR.setSize(4);
  brushB.setSize(4);
  
  //外円
  Vec3D vec = new Vec3D(0,0,0);
  for(int i =0; i <360; i++) {
    vec.set(cos(radians(i))*80, sin(radians(i))*80,0);
    brushR.drawAtAbsolutePos(vec,1);
  }
  circleMaker(0,0,0,80,3);

  volume.closeSides();
  
  //メッシュを空間に貼る
  surface.reset();
  surface.computeSurfaceMesh(mesh, 2);

  //ToxiclibsSupportオブジェクト"gfx"の初期化
  gfx = new ToxiclibsSupport(this);
  
}



//再帰関数
void circleMaker(float x, float y, float z, float r, int c) {
  c++;
  brushR.setSize(3);
  Vec3D vec1 = new Vec3D(x,y,z);
  Vec3D vec2 = new Vec3D(x,y,z);
  Vec3D vec3 = new Vec3D(x,y,z);
  Vec3D vec4 = new Vec3D(x,y,z);
  
  for(int i=0; i<360; i++) {
    vec1.set(cos(radians(i))*0.7*r+0.3*r, sin(radians(i))*0.7*r, 0);
    //vec1.set(cos(radians(i))*0.5*r+0.5*r, sin(radians(i))*0.5*r, sin(radians(i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec1,1);
  }
  for(int i=0; i<360; i++) {
    vec2.set(cos(radians(i))*0.7*r-0.3*r, sin(radians(i))*0.7*r, 0);
    //vec2.set(cos(radians(i))*0.5*r-0.5*r, sin(radians(i))*0.5*r, sin(radians(-i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec2,1);
  }
  for(int i=0; i<360; i++) {
    vec3.set(cos(radians(i))*0.5*r, sin(radians(i))*0.5*r+0.5*r, cos(radians(i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec3,1);
  }
  for(int i=0; i<360; i++) {
    vec4.set(cos(radians(i))*0.5*r, sin(radians(i))*0.5*r-0.5*r, -cos(radians(i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec4,1);
  }
  
  if(c <= 5) {
  circleMaker(vec1.x, vec1.y, vec1.z, 0.5*r, c);
  circleMaker(vec2.x, vec2.y, vec2.z, 0.5*r, c);
  circleMaker(vec3.x, vec3.y, vec3.z, 0.5*r, c);
  circleMaker(vec4.x, vec4.y, vec4.z, 0.5*r, c);
  }
}


void draw() {
  //背景色を白に
  background(255);
  
  //陰影をつける
  myLights();
  
  //線色を黒に指定
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

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}


void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "brush.stl" ));
  }
}
