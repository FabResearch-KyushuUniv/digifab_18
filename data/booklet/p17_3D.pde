import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

import peasy.*;
PeasyCam CAM;


TriangleMesh mesh;
ToxiclibsSupport gfx;
VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(250,250,250), 250, 250, 250);  

//mesh = new TriangleMesh();//add

IsoSurface surface = new ArrayIsoSurface(volume);
VolumetricBrush brushB = new RoundBrush(volume, 1);
VolumetricBrush brushS = new RoundBrush(volume, 1);



void setup() {
  size(600,600,P3D);
  CAM = new PeasyCam(this, 300);
  mesh = new TriangleMesh();
  
  brushS.setSize(2);
  brushB.setSize(4);
  tree(0,0,0,0);

  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);
  gfx = new ToxiclibsSupport(this);    
}


//再帰関数
void tree(float x, float y, float z,int c) {
  c++;
  int i,j;
  float x1,y1,z1;
  float angle=radians(60);
  
  Vec3D vec = new Vec3D(x,y,z);
  //float nx = random(-0.8,0.8);
  //float ny = random(-0.8,0.8);
  
  float nx = random(-0.8,0.8);
  float ny = random(-0.8,0.8);
 

  for (i=0; i < 40; i ++) {
    vec.set(x+nx*i, y+ny*i, z+0.5*i);
    brushS.drawAtAbsolutePos(vec,1);
  }
  
  if (c < 4) {
    for(i=0;i<=c;i++){
    tree(vec.x, vec.y, vec.z, c);
    }
  }
  x1=vec.x;
  y1=vec.y;
  z1=vec.z;
  
   //pushMatrix();
      for(j = 0; j< 4; j++) {//add
      //ブラシの大きさを指定
        brushB.setSize(10);
       brushB.drawAtAbsolutePos(new Vec3D(x1,y1,z1),1);
      }
 // popMatrix();
}
//}

void draw() {
  background(255);
  myLights();
  fill(255);
  noStroke();
  
  gfx.mesh( mesh );
    
  stroke(255, 0, 0);
  line(0, 0, 0, 1000, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 1000, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 1000); 
  
      //  for(j = 0; j< 4; j++) {//add
      ////ブラシの大きさを指定
      // brush.setSize(10);
      // brush.drawAtAbsolutePos(new Vec3D(x1,y1,z1),1);
      //}
}

void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "tree.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
