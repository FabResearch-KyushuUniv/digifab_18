//円を拡大する
int x = 0;
int y = 0;

void setup() {
  size(600,600);
  background(255);
}

void draw() {
  noStroke();
  fill(0,0,255);
  ellipse(width/2,height/2,x,y);
  x+=1;
  y+=1;
}


////円を縮小する
//int x = 400;
//int y = 400;

//void setup() {
//  size(600,600);
//  background(255);
//}

//void draw() {
//  /*-背景を上塗り-*/
//  fill(255);
//  rect(0, 0, width, height);
//  /*--------------*/
//  noStroke();
//  fill(0,0,255);
//  ellipse(width/2,height/2,x,y);
//  x-=1;
//  y-=1;
//}