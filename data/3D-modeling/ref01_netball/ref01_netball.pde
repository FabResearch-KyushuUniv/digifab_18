import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.volume.*;
import toxi.processing.*;

import peasy.*;
PeasyCam cam;

int VOXEL_RES=64;
int VOXEL_STROKE_WEIGHT=7;
int SPHERE_RES=8;
int SMOOTH_ITER=7;
 
ToxiclibsSupport gfx;
WETriangleMesh mesh;


void setup() {
  size(700, 700, P3D);
  cam = new PeasyCam(this,400);

  WETriangleMesh tmp=new WETriangleMesh().addMesh(new Sphere(160).toMesh(SPHERE_RES));
  mesh=MeshLatticeBuilder.build(tmp, VOXEL_RES, VOXEL_STROKE_WEIGHT);

 for(int i=0; i<SMOOTH_ITER; i++) {
    new LaplacianSmooth().filter(mesh,1);
  }
  
  gfx = new ToxiclibsSupport(this);
}
 

void draw() {
  background(255);
  myLights();
  stroke(0);
  gfx.mesh(mesh);
}


void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "net.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
