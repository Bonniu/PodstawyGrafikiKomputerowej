void setup() {
  size(560, 480, P3D);
}

void draw()
{
  background(0);
  beginShape(TRIANGLES);
    fill(0,255,255);
    vertex(150, 100);
    vertex(100, 200);
    vertex(200, 200);
  endShape();
  beginShape(QUADS);
    fill(0,0,255);
    vertex(350, 100);
    vertex(450, 100);
    vertex(450, 200);
    vertex(350, 200);
  endShape();
  beginShape(QUADS);
    fill(255,255,255);
    vertex(125, 300);
    fill(0,0,255);
    vertex(175, 300);
    fill(0,255,0);
    vertex(175, 400);
    fill(255,0,0);
    vertex(125, 400);
  endShape();
  beginShape(QUADS);
    fill(255,255,255);
    vertex(350, 300);
    fill(0,0,255);
    vertex(450, 300);
    fill(0,255,0);
    vertex(450, 400);
    fill(255,0,0);
    vertex(350, 400);
  endShape();
}
