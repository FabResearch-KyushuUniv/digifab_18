import toxi.volume.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import peasy.*;
PeasyCam CAM;

TriangleMesh mesh;
ToxiclibsSupport gfx;
VolumetricSpace volume = new VolumetricSpaceArray(new Vec3D(250,250,250), 250, 250, 250);  
IsoSurface surface = new ArrayIsoSurface(volume);
VolumetricBrush brush = new BoxBrush(volume, 10);

void setup() {
  size(600,600,P3D);
  CAM = new PeasyCam(this, 300);
  mesh = new TriangleMesh();
  brush.setSize(10);
  //中心
  cube(0,0,0,5,0);
  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);
  gfx = new ToxiclibsSupport(this);
}

//再帰関数
void cube(float x, float y, float z, float b, int c) {
  c++;
  Vec3D vec1 = new Vec3D(x,y,z);
  Vec3D vec2 = new Vec3D(x,y,z);
  Vec3D vec3 = new Vec3D(x,y,z);
  Vec3D vec4 = new Vec3D(x,y,z);
  Vec3D vec5 = new Vec3D(x,y,z);
  Vec3D vec6 = new Vec3D(x,y,z);

  for ( int i=0; i < 50; i ++) {
    brush.setSize(b);
    vec1.set(x+0.1*i*b,y,z);
    brush.drawAtAbsolutePos(vec1, 1);
  }
  for ( int i=0; i < 25; i ++) {
    brush.setSize(b);
    vec2.set(x,y+0.1*i*b,z);
    brush.drawAtAbsolutePos(vec2, 1);
  }
  for ( int i=0; i < 50; i ++) {
    brush.setSize(b);
    vec3.set(x,y,z+0.1*i*b);
    brush.drawAtAbsolutePos(vec3, 1);
  }
  for ( int i=0; i < 25; i ++) {
    brush.setSize(b);
    vec4.set(x-0.1*i*b,y,z-0.5*b);
    brush.drawAtAbsolutePos(vec4, 1);
  }
  for ( int i=0; i < 50; i ++) {
    brush.setSize(b);
    vec5.set(x,y-0.1*i*b,z-0.5*b);
    brush.drawAtAbsolutePos(vec5, 1);
  }
  for ( int i=0; i < 25; i ++) {
    brush.setSize(b);
    vec6.set(x,y,z-0.1*i*b);
    brush.drawAtAbsolutePos(vec6, 1);
  }
  if (c < 3) {
    cube(vec1.x, vec1.y, vec1.z,2.0*b, c);
    cube(vec2.x, vec2.y, vec2.z,1.0*b, c);
    cube(vec3.x, vec3.y, vec3.z,2.0*b, c);
    cube(vec4.x, vec4.y, vec4.z,1.0*b, c);
    cube(vec5.x, vec5.y, vec5.z,2.0*b, c);
    cube(vec6.x, vec6.y, vec6.z,1.0*b, c);
  }
}

void draw() {
  background(255);
  myLights();
  noStroke();
  
  gfx.mesh( mesh );
    
  stroke(255, 0, 0);
  line(0, 0, 0, 1000, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 1000, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 1000); 
}

void keyPressed() {
  if (key=='s') {
    mesh.saveAsSTL( sketchPath( "cube.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
