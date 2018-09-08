import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

import peasy.*;
PeasyCam cam;

TriangleMesh mesh;
ToxiclibsSupport gfx;
VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(200,200,200),200,200,200);

IsoSurface surface = new ArrayIsoSurface(volume);
VolumetricBrush brush = new BoxBrush(volume, 10);


void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 300);
  mesh = new TriangleMesh();
  
  cube(0,0,0,200/3,3);
  
  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);
  gfx = new ToxiclibsSupport(this);
}


int i;
Vec3D vec = new Vec3D(0,0,0);

void cube(float x, float y, float z, float a, int n){
  cubeX(x, y, z, a, n); 
  cubeY(x, y, z, a, n); 
  cubeZ(x, y, z, a, n); 
}

void cubeX(float x, float y, float z, float a, int n){
  brush.setSize(a);
  for(i = -100; i<=100; i++){
    vec.set(i, y, z);
    brush.drawAtAbsolutePos(vec, 1);
  } 
  
  if(n>1){
    cubeX(x, y-a, z-a, a/3, n-1);
    cubeX(x, y-a, z, a/3, n-1);
    cubeX(x, y-a, z+a, a/3, n-1);
    cubeX(x, y, z-a, a/3, n-1);
    cubeX(x, y, z+a, a/3, n-1);
    cubeX(x, y+a, z-a, a/3, n-1);
    cubeX(x, y+a, z, a/3, n-1);
    cubeX(x, y+a, z+a, a/3, n-1);
  }
}
void cubeY(float x, float y, float z, float a, int n){
  brush.setSize(a);
  for(i = -100; i<=100; i++){
    vec.set(x, i, z);
    brush.drawAtAbsolutePos(vec, 1);
  }
  
  if(n>1){
    cubeY(x-a, y, z-a, a/3, n-1);
    cubeY(x-a, y, z, a/3, n-1);
    cubeY(x-a, y, z+a, a/3, n-1);
    cubeY(x, y, z-a, a/3, n-1);
    cubeY(x, y, z+a, a/3, n-1);
    cubeY(x+a, y, z-a, a/3, n-1);
    cubeY(x+a, y, z, a/3, n-1);
    cubeY(x+a, y, z+a, a/3, n-1);
  }
}
void cubeZ(float x, float y, float z, float a, int n){
  brush.setSize(a);
  for(i = -100; i<=100; i++){
    vec.set(x, y, i);
    brush.drawAtAbsolutePos(vec, 1);
  }
  
  if(n>1){
    cubeZ(x-a, y-a, z, a/3, n-1);
    cubeZ(x-a, y, z, a/3, n-1);
    cubeZ(x-a, y+a, z, a/3, n-1);
    cubeZ(x, y-a, z, a/3, n-1);
    cubeZ(x, y+a, z, a/3, n-1);
    cubeZ(x+a, y-a, z, a/3, n-1);
    cubeZ(x+a, y, z, a/3, n-1);
    cubeZ(x+a, y+a, z, a/3, n-1);
  }
}


void draw(){
  background(255);
  myLights();
  noStroke();
  
  gfx.mesh(mesh);
  
  stroke(255,0,0);
  line(0,0,0,1000,0,0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 1000, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 1000); 
}

void keyPressed(){
  if (key == 's'){
    mesh.saveAsSTL( sketchPath("sqfr3d.stl"));    
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
