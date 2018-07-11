import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

import peasy.*;
PeasyCam CAM;

TriangleMesh mesh;
ToxiclibsSupport gfx;


void setup() {
  size(600, 600, P3D);
  CAM = new PeasyCam(this, 500);
  
  
  VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(100,200,100), 100, 200, 100);  
  IsoSurface surface = new ArrayIsoSurface(volume);
  mesh = new TriangleMesh();
  
  VolumetricBrush brush = new RoundBrush(volume, 1);
  
  for ( int i=0; i < 20; i ++) {
    brush.setSize(i*1.2 + 6);
    float x = cos(i * TWO_PI / 20) * 10;
    float y = sin(i * TWO_PI / 20) * 10;  
    brush.drawAtAbsolutePos(new Vec3D(x,-25+i * 7,y), 1);
  }
  for (int i=4; i < 20; i+=4) {
    brush.setSize(i/1.5+4);
    float x = cos(i * TWO_PI / 20) * (i*1.2+16);
    float y = sin(i * TWO_PI / 20) * (i*1.2+16);
    brush.drawAtAbsolutePos(new Vec3D(x,-25+i * 7,y), 1);

    brush.setSize(i/2+2);
    float x2 = cos(i * TWO_PI / 20) * (i*1.2+18);
    float y2 = sin(i * TWO_PI / 20) * (i*1.2+18);
    brush.drawAtAbsolutePos(new Vec3D(x2,-25+i * 7,y2), -1.4);
  }
  
  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);

  gfx = new ToxiclibsSupport(this);
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

void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "tentacle.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
