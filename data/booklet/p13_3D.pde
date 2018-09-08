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
VolumetricBrush brush = new RoundBrush(volume, 30);


void setup() {
  size(600,600,P3D);
  CAM = new PeasyCam(this, 300);
  mesh = new TriangleMesh();
  fibonatch(0,0,1,5,0);//左足
  fibonatch2(10,0,1,5,-40);//左腕
  fibonatch3(0,0,1,5,35);//頭
  fibonatch4(0,0,1,5,0);//右足
  fibonatch5(10,0,1,5,-40);//右腕
  fibonatch6(0,0,1,5,35);//頭

  //中心
  //cube(0,0,0,10,0);

  volume.closeSides();
  surface.reset();
  surface.computeSurfaceMesh(mesh, .5);
  gfx = new ToxiclibsSupport(this);
}


//再帰関数

void fibonatch(float x, float y, float r, int n, int angle){
  float r1;
  Vec3D vec1 = new Vec3D(x,y,0);
  brush.setSize(r);
  vec1.set(x,y,0);
  brush.drawAtAbsolutePos(vec1,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch(x,y,r,n-1,angle);
   
  }  
}
void fibonatch2(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec2 = new Vec3D(x,y,0);
  brush.setSize(r*1.05);
  vec2.set(x,y,25);
  brush.drawAtAbsolutePos(vec2,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch2(x,y,r,n-1,angle);
   
  }  
}
void fibonatch3(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec2 = new Vec3D(0,x,y);
  brush.setSize(r);
  vec2.set(0,-x,y);
  brush.drawAtAbsolutePos(vec2,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch3(x,y,r,n-1,angle);
   
  }  
}
void fibonatch4(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec1 = new Vec3D(x,y,0);
  brush.setSize(r);
  vec1.set(-x,y,0);
  brush.drawAtAbsolutePos(vec1,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch4(x,y,r,n-1,angle);
   
  }  
}
void fibonatch5(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec2 = new Vec3D(x,y,0);
  brush.setSize(r);
  vec2.set(-x,y,25);
  brush.drawAtAbsolutePos(vec2,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch5(x,y,r,n-1,angle);
   
  }  
}
void fibonatch6(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec3 = new Vec3D(0,x,y);
  brush.setSize(r*1.05);
  vec3.set(0,-x,y);
  brush.drawAtAbsolutePos(vec3,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch6(x,y,r,n-1,angle);
   
  }  
}
void fibonatch7(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec1 = new Vec3D(x,y,0);
  brush.setSize(r*1.05);
  vec1.set(x,y,0);
  brush.drawAtAbsolutePos(vec1,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch7(x,-y,r,n-1,angle);
   
  }  
}
void fibonatch8(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec2 = new Vec3D(y,0,x);
  brush.setSize(r*1.05);
  vec2.set(x,0,y);
  brush.drawAtAbsolutePos(vec2,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch8(x,-y,r,n-1,angle);
   
  }  
}
void fibonatch9(float x, float y, float r, float n, int angle){
  float r1;
  Vec3D vec2 = new Vec3D(0,x,y);
  brush.setSize(r*1.05);
  vec2.set(0,x,y);
  brush.drawAtAbsolutePos(vec2,1);
  if(n>=1){
      r1 = r;
      r = r + r1;
      angle = angle + 15;
      float theta = radians(angle);
      x = x + r*cos(theta);
      y = y + r*sin(theta);
      fibonatch9(x,-y,r,n-1,angle);
   
  }  
}
//void cube(float x, float y, float z, float b, int c) {
//  c++;
//  Vec3D vec1 = new Vec3D(x,y,z);
//  Vec3D vec2 = new Vec3D(x,y,z);
//  Vec3D vec3 = new Vec3D(x,y,z);
//  Vec3D vec4 = new Vec3D(x,y,z);
//  //Vec3D vec5 = new Vec3D(x,y,z);
//  //Vec3D vec6 = new Vec3D(x,y,z);

//  for ( int i=0; i < 50; i ++) {
//    brush.setSize(b);
//    vec1.set(x+0.1*i*b,y,z);
//    brush.drawAtAbsolutePos(vec1, 1);
//  }
//  for ( int i=0; i < 50; i ++) {
//    brush.setSize(b);
//    vec2.set(x,y+0.1*i*b,z);
//    brush.drawAtAbsolutePos(vec2, 1);
//  }
//  for ( int i=0; i < 50; i ++) {
//    brush.setSize(b);
//    vec3.set(x,y,z+0.1*i*b);
//    brush.drawAtAbsolutePos(vec3, 1);
//  }
//  for ( int i=0; i < 50; i ++) {
//    brush.setSize(b);
//    vec4.set(x-0.1*i*b,y,z-0.5*b);
//    brush.drawAtAbsolutePos(vec4, 1);
//  }
//  for ( int i=0; i < 50; i ++) {
//    brush.setSize(b);
//    //vec5.set(x,y-0.1*i*b,z-0.5*b);
//    //brush.drawAtAbsolutePos(vec5, 1);
//  }
//  for ( int i=0; i < 50; i ++) {
//    brush.setSize(b);
//    //vec6.set(x,y,z-0.1*i*b);
//    //brush.drawAtAbsolutePos(vec6, 1);
//  }
//  if (c < 4) {
//    cube(vec1.x, vec1.y, vec1.z,0.5*b, c);
//    cube(vec2.x, vec2.y, vec2.z,0.5*b, c);
//    cube(vec3.x, vec3.y, vec3.z,0.5*b, c);
//    cube(vec4.x, vec4.y, vec4.z,0.5*b, c);
//    //cube(vec5.x, vec5.y, vec5.z,0.5*b, c);
//    //cube(vec6.x, vec6.y, vec6.z,0.5*b, c);
//  }
//}





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
    mesh.saveAsSTL( sketchPath( "fibo.stl" ));
  }
}

void myLights() {
  directionalLight(240, 240, 240, 0.25, 0.25, 1);
  directionalLight(240, 240, 240, 0, 0, -1);
  lightSpecular(240, 240, 240);
  shininess(1);
}
