void setup(){ 
 size(500, 500);
 noFill();
 circleR(250,250,200,3);
}

void circleR(float x, float y, float r,int n){
  ellipse(x,y,r*2,r*2);
  if(n>1){
   float newR = r/2; 
   float angle = PI/4;
   circleR(x+newR*cos(angle),y+newR*sin(angle),newR,n-1);
   circleR(x-newR*cos(angle),y-newR*sin(angle),newR,n-1);
   }
if(n>1){
    float newR = r/2; 
    float angle = PI/4;
    circleR(x-newR*cos(angle),y+newR*sin(angle),newR,n-1);
    circleR(x+newR*cos(angle),y-newR*sin(angle),newR,n-1);
}
}
