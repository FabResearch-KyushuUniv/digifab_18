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
  brushR.setSize(7);
  brushB.setSize(4);
  
  //外円
  Vec3D vec = new Vec3D(0,0,0);
  for(int i =0; i <360; i++) {
    vec.set(cos(radians(i))*80, sin(radians(i))*80,0);
    brushR.drawAtAbsolutePos(vec,1);
  }
  circleMaker(0,0,5,80,1, 4);

  volume.closeSides();
  
  //メッシュを空間に貼る
  surface.reset();
  surface.computeSurfaceMesh(mesh, 2);

  //ToxiclibsSupportオブジェクト"gfx"の初期化
  gfx = new ToxiclibsSupport(this);
  
}



//再帰関数
void circleMaker(float x, float y, float z, float r, int c, float b) {
  c++;
  brushR.setSize(b);
  Vec3D vec0 = new Vec3D(x,y,z);
  Vec3D vec1 = new Vec3D(x,y,z);
  Vec3D vec2 = new Vec3D(x,y,z);
  Vec3D vec3 = new Vec3D(x,y,z);
  Vec3D vec4 = new Vec3D(x,y,z);
  Vec3D vec5 = new Vec3D(x,y,z);
  Vec3D vec6 = new Vec3D(x,y,z);
  Vec3D vec7 = new Vec3D(x,y,z);
  Vec3D vec8 = new Vec3D(x,y,z);

  
  for(int i=0; i<360; i++) {
    vec0.set(cos(radians(i))*r/4.26+x, sin(radians(i))/4.26*r+y, z+2.4);
    brushR.drawAtAbsolutePos(vec0,1);
  }
  println(vec0);
  for(int i=0; i<360; i++) {
    vec1.set(cos(radians(i))*r/4.26+0.5*r+x, sin(radians(i))/4.26*r+y, z+4.8);
    brushR.drawAtAbsolutePos(vec1,1);
  }
  println(vec1);
  for(int i=0; i<360; i++) {
    vec2.set(cos(radians(i))*r/4.26-0.5*r+x, sin(radians(i))/4.26*r+y, z);
    brushR.drawAtAbsolutePos(vec2,1);
  }
  println(vec2);
  for(int i=0; i<360; i++) {
    vec3.set(cos(radians(i))*r/4.26+0.5*r+x, sin(radians(i))/4.26*r+0.5*r+y, z+2.4);
    brushR.drawAtAbsolutePos(vec3,1);
  }
  println(vec3);
  for(int i=0; i<360; i++) {
    vec4.set(cos(radians(i))*r/4.26-0.5*r+x, sin(radians(i))/4.26*r-0.5*r+y, z+2.4);
    brushR.drawAtAbsolutePos(vec4,1);
  }
  println(vec4);
  for(int i=0; i<360; i++) {
    vec5.set(cos(radians(i))*r/4.26+0.5*r+x, sin(radians(i))/4.26*r-0.5*r+y, z+7.2);
    brushR.drawAtAbsolutePos(vec5,1);
  }
  println(vec5);
  for(int i=0; i<360; i++) {
    vec6.set(cos(radians(i))*r/4.26-0.5*r+x, sin(radians(i))/4.26*r+0.5*r+y, z-2.4);
    brushR.drawAtAbsolutePos(vec6,1);
  }
  println(vec6);
  for(int i=0; i<360; i++) {
    vec7.set(cos(radians(i))*r/4.26+x, sin(radians(i))/4.26*r+0.5*r+y, z);
    brushR.drawAtAbsolutePos(vec7,1);
  }
  println(vec7);
  for(int i=0; i<360; i++) {
    vec8.set(cos(radians(i))*r/4.26+x, sin(radians(i))/4.26*r-0.5*r+y, z+4.8);
    brushR.drawAtAbsolutePos(vec8,1);
  }
  println(vec8);
  b = b-1.6;
  if(c <= 2) {
  circleMaker(vec0.x-r/4.26, vec0.y, vec0.z+7, r/4.26, c, b);
  circleMaker(vec1.x-r/4.26, vec1.y, vec1.z+5, r/4.26, c, b);
  circleMaker(vec2.x-r/4.26, vec2.y, vec2.z+5, r/4.26, c, b);
  circleMaker(vec3.x-r/4.26, vec3.y, vec3.z+5, r/4.26, c, b);
  circleMaker(vec4.x-r/4.26, vec4.y, vec4.z+5, r/4.26, c, b);
  circleMaker(vec5.x-r/4.26, vec5.y, vec5.z+5, r/4.26, c, b);
  circleMaker(vec6.x-r/4.26, vec6.y, vec6.z+5, r/4.26, c, b);
  circleMaker(vec7.x-r/4.26, vec7.y, vec7.z+5, r/4.26, c, b);
  circleMaker(vec8.x-r/4.26, vec8.y, vec8.z+5, r/4.26, c, b);
  
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
