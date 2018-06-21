
void setup(){
  size(500,500);
  noFill();
  circleR(250,250,200,6);
}

void circleR(float x, float y, float r,int n){
  ellipse(x,y,r*2,r*2);
  if(n>1){
    float newR = r/2;
    circleR(x+newR,y,newR,n-1);
    circleR(x-newR,y,newR,n-1);
    circleR(x,y+newR,newR,n-1);
    circleR(x,y-newR,newR,n-1);
  }
}
