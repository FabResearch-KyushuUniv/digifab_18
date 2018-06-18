//SVG用のライブラリをインポート
import processing.svg.PGraphicsSVG;

beginRecord(SVG, "PApplet.svg");
size(600, 600);
stroke(0);
noFill();
ellipse(width/2, height/2, 100, 100);
endRecord();