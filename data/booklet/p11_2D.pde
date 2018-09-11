import processing.svg.PGraphicsSVG;


void setup(){
  size(600,600);
  noFill();
  background(255);
  beginRecord(SVG, "test.svg");

   drawline1(50,50,100,100,3);
   drawline2(400,50,50,400,4);
   drawline3(100,400,500,500,1);
   drawline4(400,100,500,500,1);

circleR(250,250,250,3);

  endRecord();
}


void circleR(float x, float y, float r,int n){
triangle(x, y, r, x, y, r);
  if(n>1){
    float newR = r/2;
    circleR(x+newR,y,newR,n-1);
    circleR(x-newR,y,newR,n-1);
    circleR(x,y+newR,newR,n-1);
    circleR(x,y-newR,newR,n-1);
  }
}

 void drawline1(int x, int y,int w, int h, int n){

   line(x,y,w,h);
   int x2 =2*x;
   int y2 =2*y;
   int w2=2*w;
   int h2=2*h;
   
   if(n>1){
   drawline1(x2,y,w,h,n-1);
   drawline1(x,y2,w,h,n-1);
   drawline1(x,y,w2,h,n-1);
   drawline1(x,y,w,h2,n-1);
 
   }}

 
void drawline2(int x, int y,int w, int h, int n){

   line(x,y,w,h);
   int x2 =(5/4)*x;
   int y2 =(2)*y;
   int w2=(2)*w;
   int h2=(5/4)*h;
   
   if(n>1){
   drawline2(x2,y,w,h,n-1);
   drawline2(x,y2,w,h,n-1);
   drawline2(x,y,w2,h,n-1);
   drawline2(x,y,w,h2,n-1);

  }
 }
 
 
 void drawline3(int x, int y,int w, int h, int n){

   line(x,y,w,h);
   int x2 =(1/3)*x;
   int y2 =(1/10)*y;
   int w2=(1/10)*w;
   int h2=(1/10)*h;
   
   if(n>1){
   drawline3(x2,y,w,h,n-1);
   drawline3(x,y2,w,h,n-1);
   drawline3(x,y,w2,h,n-1);
   drawline3(x,y,w,h2,n-1);

  }
 }
 
 
 void drawline4(int x, int y,int w, int h, int n){

   line(x,y,w,h);
   int x2 =(1/10)*x;
   int y2 =(1/3)*y;
   int w2=(1/10)*w;
   int h2=(1/10)*h;
   
   if(n>1){
   drawline4(x2,y,w,h,n-1);
   drawline4(x,y2,w,h,n-1);
   drawline4(x,y,w2,h,n-1);
   drawline4(x,y,w,h2,n-1);

  }
 }
 
