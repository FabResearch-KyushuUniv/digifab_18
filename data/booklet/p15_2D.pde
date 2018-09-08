import processing.svg.PGraphicsSVG;


float rr = 5;
void setup(){
  size(500,500);
  background(255);
  stroke(255,0,0);
  strokeWeight(1);
  noFill();
  beginRecord(SVG,"fibonatch5.svg");

}
void draw(){
  fibonatch(250+rr,250,rr,rr,2);//図形を描
  fibonatch(250-rr,250,rr,rr,4);
  fibonatch(250,250+rr,rr,rr,3);//図形を描
  fibonatch(250,250-rr,rr,rr,5);
  circleR(250,250,150,2);
}

void mousePressed() {
  endRecord();
  exit();
} 


void fibonatch(float x, float y, float r1, float r2, int n){
  float x2,y2,r3,r4;
  r1 = r2;
  r2 = r1 + r2;
  arc(x,y,r2,r2,radians(0+(n%4)*90),radians(360+(n%4)*90));
      
  
  
  if(n>=1){
    if(n%4==1){
      r3 = r2 + r1;
      x2 = x + r2;
      y2 = y - r2;
      //arc(x2,y2,r3,r3,radians(0+((n-1)%4)*90),radians(90+((n-1)%4)*90));
          if(n%4==1){
      y2 = y2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
      
    }
    if(n%4==2){
      
      x2 = x2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==3){
      
      y2 = y2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==0){
      x2 = x2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
      
      
      y = y - (r2/2);
      fibonatch(x,y,r1,r2,n-1);
      
    }
    if(n%4==2){
      r3 = r2 + r1;
      x2 = x + r2;
      y2 = y + r2;
      //arc(x2,y2,r3,r3,radians(0+((n-1)%4)*90),radians(90+((n-1)%4)*90));
          if(n%4==1){
      y2 = y2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
      
    }
    if(n%4==2){
      x2 = x2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==3){

      y2 = y2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==0){
      x2 = x2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }  
      x = x + (r2/2);
      fibonatch(x,y,r1,r2,n-1);
    }
    if(n%4==3){
      r3 = r2 + r1;
      x2 = x - r2;
      y2 = y + r2;
      //arc(x2,y2,r3,r3,radians(0+((n-1)%4)*90),radians(90+((n-1)%4)*90));
          if(n%4==1){

      y2 = y2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
      
    }
    if(n%4==2){
      x2 = x2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==3){
      y2 = y2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==0){

      x2 = x2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
      
      
      y = y + (r2/2);
      fibonatch(x,y,r1,r2,n-1);
    }
    if(n%4==0){
      r3 = r2 + r1;
      x2 = x - r2;
      y2 = y - r2;
      //arc(x2,y2,r3,r3,radians(0+((n-1)%4)*90),radians(90+((n-1)%4)*90));
          if(n%4==1){
      y2 = y2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
      
    }
    if(n%4==2){

      x2 = x2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==3){

      y2 = y2 + (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
    if(n%4==0){
 
      x2 = x2 - (r3/2);
      //fibonatch(x2,y2,r2,r3,n-1);
    }
       
       
            
      x = x - (r2/2);
      fibonatch(x,y,r1,r2,n-1);
    }
    
  }
}

void circleR(float x, float y, float r,int n){
  ellipse(x,y,r*2,r*2);
  if(n>1){
    float newR = r/2;
    circleR(x+newR,y,newR,n-1);
    circleR(x-newR,y,newR,n-1);
    circleR(x,y+newR,newR,n-1);
    circleR(x,y-newR,newR,n-1);
  }}
