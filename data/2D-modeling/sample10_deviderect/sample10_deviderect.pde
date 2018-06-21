
void setup(){
  size(800,800);
  noFill();
  background(255);
  drawrect(50,50,500,500,5);
}

void drawrect(int x, int y, int w, int h, int n){
  rect(x,y,w,h);
  int x2 = x+int(random(w));
  line(x2,y,x2,y+h);
  int y2 = y+int(random(h));
  line(x,y2,x2,y2);
  int y3 = y+int(random(h));
  line(x2,y3,x+w,y3);
  int neww1 = x2-x;
  int neww2 = w-neww1;
  int newh1 = y2-y;
  int newh2 = y3-y;
  if(n>1){
  drawrect(x,y,neww1,newh1,n-1);
  drawrect(x,y2,neww1,h-newh1,n-1);
  drawrect(x2,y,neww2,newh2,n-1);
  drawrect(x2,y3,neww2,h-newh2,n-1);
  }
}
