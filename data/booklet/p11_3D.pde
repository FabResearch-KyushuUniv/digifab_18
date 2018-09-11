import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import peasy.*;
PeasyCam CAM;
TriangleMesh mesh;
ToxiclibsSupport gfx;
TriangleMesh sphere_mesh;
TriangleMesh box_mesh;


void setup() {
  size(600, 600, P3D);
  CAM = new PeasyCam(this, 300); 
  VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(200,200,200), 200, 200, 200);
  IsoSurface surface = new ArrayIsoSurface(volume);
  mesh = new TriangleMesh();
  VolumetricBrush brushsp = new RoundBrush(volume, 1);
  VolumetricBrush brush = new BoxBrush(volume, 1);
  gfx = new ToxiclibsSupport(this);
  brushsp.setSize(44);
  brushsp.drawAtAbsolutePos(new Vec3D(0,0,0),1);
  
  

  for(int x = 0; x< 3; x++) {
      for(int y = 0; y< 3; y++) {
          for(int z = 0; z< 3; z++) {
    brush.setSize(20);
    brush.drawAtAbsolutePos(new Vec3D(x*30-30,y*30-30,z*30-30),1);
  }
      }
  }
  
  

  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .1);
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
    mesh.saveAsSTL( sketchPath( "saitonaoyuki3Dprocessing.stl" ));
  }
}


void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
