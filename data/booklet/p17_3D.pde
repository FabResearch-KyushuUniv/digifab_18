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
  brushR.setSize(4);
  brushB.setSize(4);

  Vec3D vec = new Vec3D(0, 0, 0);
  for (int i =0; i <360; i++) {
    vec.set(cos(radians(i))*80, sin(radians(i))*80, 0);
    brushR.drawAtAbsolutePos(vec, 1);
  }
  circleMaker(0, 0, 0, 80, 3);
  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, 2);
  gfx = new ToxiclibsSupport(this);
}

void circleMaker(float x, float y, float z, float r, int c) {
  c++;
  brushR.setSize(3);
  Vec3D vec1 = new Vec3D(x, y, z);
  Vec3D vec2 = new Vec3D(x, y, z);
  Vec3D vec3 = new Vec3D(x, y, z);
  Vec3D vec4 = new Vec3D(x, y, z);
  for (int i=0; i<360; i++) {
    vec1.set(cos(radians(i))*0.5*r+x+0.5*r, sin(radians(i))*0.5*r+y, sin(radians(i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec1, 1);
  }
  println(vec1);
  for (int i=0; i<360; i++) {
    vec2.set(cos(radians(i))*0.5*r+x-0.5*r, sin(radians(i))*0.5*r-y, sin(radians(-i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec2, 1);
  }
  println(vec2);
  for (int i=0; i<360; i++) {
    vec3.set(cos(radians(i))*0.5*r+x, sin(radians(i))*0.5*r+y+0.5*r, cos(radians(i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec3, 1);
  }
  println(vec3);
  for (int i=0; i<360; i++) {
    vec4.set(cos(radians(i))*0.5*r+x, sin(radians(i))*0.5*r-y-0.5*r, -cos(radians(i+c*180))*0.5*r);
    brushR.drawAtAbsolutePos(vec4, 1);
  }
  println(vec4);  
  if (c <= 4) {
    circleMaker(0.5*r, vec1.y, vec1.z, 0.5*r, c);
    circleMaker(-0.5*r, vec2.y, vec2.z, 0.5*r, c);
    circleMaker(0, 0.5*r, vec3.z, 0.5*r, c);
    circleMaker(0, -0.5*r, vec4.z, 0.5*r, c);
  }
}


void draw() {
  background(255);
  myLights();
  noStroke();
  gfx.mesh(mesh);
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
