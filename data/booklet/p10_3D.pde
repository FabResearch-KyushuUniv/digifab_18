import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

import peasy.*;
PeasyCam CAM;
TriangleMesh mesh;

ToxiclibsSupport gfx;
VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(250, 250, 250), 250, 250, 250);  

IsoSurface surface = new ArrayIsoSurface(volume);
VolumetricBrush brush = new RoundBrush(volume, 1);

void setup() {
  size(600, 600, P3D);
  CAM = new PeasyCam(this, 300);
  mesh = new TriangleMesh();

  brush.setSize(2);
  Hexagon(0, 0, 0, 1, 0);

  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);
  gfx = new ToxiclibsSupport(this);
}

void Hexagon(float x, float y, float z, float r, int c) {
  c++;
  Vec3D vec=new Vec3D(x, y, z);
  float[]cos={cos(0), cos(PI/3), cos(2*PI/3), cos(PI), cos(4*PI/3), cos(5*PI/3)};
  float[]sin={sin(0), sin(PI/3), sin(2*PI/3), sin(PI), sin(4*PI/3), sin(5*PI/3)};

  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      for (int g=0; g<30; g++) {
        vec.set(x+cos[j]*sin[i]*g*r, y+sin[i]*sin[j]*g*r, z+cos[i]*g*r);
        brush.drawAtAbsolutePos(vec, 1);
        if (c<2) {
          float newR=2*r/3;
          Hexagon(vec.x, vec.y, vec.z, newR, c);
        }
      }
    }
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

void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "my.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
