import processing.svg.PGraphicsSVG;
PShape s;
int vertex_num = 80;
int R = 200;
float x;
float y; 
void setup() {
  size(1000, 1000);
  s = createShape();
  s.beginShape();
  s.translate(width/2, height/2);
  for (int i = 0; i < vertex_num; i++) {
    x = R * cos(radians(360.0/vertex_num * i));
    y = R * sin(radians(360.0/vertex_num * i));
    s.vertex(x, y);
  }
  s.endShape(CLOSE);
}

void draw() {
  background(255);
  renderCircle();
  if(keyPressed) {
    if(key == 's') {
      println("save");
      beginRecord(SVG, "PApplet.svg");
      renderCircle();
      endRecord();
    }
  }
}

void renderCircle() {
  for (int i = 0; i < s.getVertexCount(); i++) {
    PVector v = s.getVertex(i);
    v.x += random(-1, 1);
    v.y += random(-1, 1);
    s.setVertex(i, v);
  }
  shape(s);
}
