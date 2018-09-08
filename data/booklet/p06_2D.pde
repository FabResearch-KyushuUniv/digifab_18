
//import processing.svg.PGraphicsSVG;

//beginRecord(SVG, "MyFractal.svg");

//int i, j;

void setup(){
 size(700, 700);
 background(0);
 
 rectMode(CENTER);
 
 makeSquare(350, 350, 200, 5);

}

void makeSquare(float x, float y, float a, int n){
  noStroke();
  fill(255);
  rect(x, y, a, a);
  if(1<n){
    fill(0);
    float a2 = a/3;
    makeSquare(x-(a2*3), y-(a2*3), a2, n-1);
    makeSquare(x, y-(a2*3), a2, n-1);
    makeSquare(x+(a2*3), y-(a2*3), a2, n-1);
    makeSquare(x-(a2*3), y, a2, n-1);
    makeSquare(x+(a2*3), y, a2, n-1);
    makeSquare(x-(a2*3), y+(a2*3), a2, n-1);
    makeSquare(x, y+(a2*3), a2, n-1);
    makeSquare(x+(a2*3), y+(a2*3), a2, n-1);
    
    //for(i=-1; i<=1; i++){
    //  for(j=-1; j<=1; j++){
    //    makeSquare(x+(i*(a2*3)), y+(j*(a2*3)), a2, n-1);
    //  }
    //}
  }
}

//endRecord();
