import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

import peasy.*;
PeasyCam CAM;


TriangleMesh mesh;
ToxiclibsSupport gfx;
VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(200,200,200), 200, 200, 200);

IsoSurface surface = new ArrayIsoSurface(volume);
VolumetricBrush brushR = new RoundBrush(volume, 1);  //丸筆
VolumetricBrush brushB = new BoxBrush(volume, 1);  //角筆

//再帰を制御するためのカウンター
int counter = 0;


void setup() {
  size(600, 600, P3D);
  CAM = new PeasyCam(this, 300);
  mesh = new TriangleMesh();
  
  //ブラシの大きさを指定
  brushR.setSize(4);
  brushB.setSize(4);
  
  //支柱
  Vec3D vec = new Vec3D(0,0,0);
  for(int i=0; i<10; i++) {
    vec.set(vec.x, vec.y, vec.z + 1);
    brushR.drawAtAbsolutePos(vec,1);
  }
  truss(0,0,10, 4, counter);

  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);
  gfx = new ToxiclibsSupport(this);
}


//再帰関数
void truss(float x, float y, float z, int b, int c) {
  c++;
  brushR.setSize(b);
  Vec3D vec1 = new Vec3D(x,y,z);
  Vec3D vec2 = new Vec3D(x,y,z);
  Vec3D vec3 = new Vec3D(x,y,z);
  Vec3D vec4 = new Vec3D(x,y,z);
  
  for(int i=0; i<200; i++) {
    vec1.set(vec1.x + 0.1, vec1.y + 0.1, vec1.z + 0.1);
    brushR.drawAtAbsolutePos(vec1,1);
  }
  
  for(int i=0; i<200; i++) {
    vec2.set(vec2.x - 0.1, vec2.y + 0.1, vec2.z + 0.1);
    brushR.drawAtAbsolutePos(vec2,1);
  }
  
  for(int i=0; i<200; i++) {
    vec3.set(vec3.x + 0.1, vec3.y - 0.1, vec3.z + 0.1);
    brushR.drawAtAbsolutePos(vec3,1);
  }
  
  for(int i=0; i<200; i++) {
    vec4.set(vec4.x - 0.1, vec4.y - 0.1, vec4.z + 0.1);
    brushR.drawAtAbsolutePos(vec4,1);
  }
  
  if(c <= 3) {
    truss(vec1.x, vec1.y, vec1.z, b-1, c);
    truss(vec2.x, vec2.y, vec2.z, b-1, c);
    truss(vec3.x, vec3.y, vec3.z, b-1, c);
    truss(vec4.x, vec4.y, vec4.z, b-1, c);
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



void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "truss.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
