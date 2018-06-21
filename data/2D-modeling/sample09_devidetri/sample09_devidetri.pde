void setup(){
  size(1200,1200);
  background(255);
  devidetri(300,0,0,600,600,600,5);
}

void devidetri(int x,float y,int x1,float y1,int x2,float y2,float n){
  triangle(x,y,x1,y1,x2,y2);
  float PI1 = atan((y1-y)/(x-x1));
  //int x3 = int(random(x1,x));
  int x3 = (x-x1)/2+x1;
  float y3 = y1-((x3-x1)*tan(PI1));
  float PI2 = atan((y2-y)/(x2-x));
  //int x4 = int(random(x,x2));
  int x4 = (x2-x)/2+x;
  float y4 = y2-((x2-x4)*tan(PI2));
  //int x5 = int(random(x1,x2));
  int x5 = (x2-x1)/2+x1;
  float y5 = y1;
  line(x3,y3,x4,y4);
  line(x3,y3,x5,y5);
  line(x4,y4,x5,y5);
  //println(deg,deg1,x3,y3,x4,y4,x5,y5);
  if(n>1){
   devidetri(x,y,x3,y3,x4,y4,n-1);
   devidetri(x3,y3,x1,y1,x5,y5,n-1);
   devidetri(x4,y4,x5,y5,x2,y2,n-1);
  }
}
