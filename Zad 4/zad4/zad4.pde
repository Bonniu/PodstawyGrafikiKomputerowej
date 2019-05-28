void setup() {
  size(1280, 720, P3D);
  noStroke();
}

void drawCircle(int steps)
{
  beginShape();
  for (int i = 0; i < steps; ++i)
    vertex(cos(TWO_PI * (float)i / float(steps)), sin(TWO_PI * (float)i / float(steps)));
  endShape();
}

void rysujGwiazde(int r, int g, int b)
{
  pushMatrix();
  translate(width * 0.5f, height *0.5f);
  fill(r,g,b);
  scale (30);
  drawCircle(25);
  fill(255,255,255);
  popMatrix();
}

float time = 0.f;

void draw()
{
  background(0);
  rysujGwiazde(255,255,0);
  translate(width *.5f, height *.5f);
  fill(255,255,255);
  
 // rotate(time);  //predkosc poczatkowa dla wzs
  
 
  pushMatrix();   // czerwona planeta
    rotate(time); //predkosc obrotu dla czerwonej planety
    translate(72, 0); 
    fill(255,0,0);
    scale (20);
    drawCircle(25);
    pushMatrix(); // z szarym szsciokatnym ksiezycem
      rotate(time);
      translate(1.5, 0);
      fill(100,100,100);
      scale (0.4f);
      drawCircle(6);
    popMatrix();
  popMatrix(); // ------------------
    
    pushMatrix();  // -- orbita czerwonej
    noFill();
    translate(0,0,-1);
    stroke(255,0,0);
    circle(0, 0, 147);
    translate(0,0,1);
    noStroke(); 
  popMatrix();
    
    
  pushMatrix();   // niebieska planeta
    rotate(2*time);
    translate(132, 0);
    fill(0,0,255);
    scale (14);
    drawCircle(25);
    pushMatrix(); // z bialym kwadratowym ksiezycem
      rotate(-6*time);
      translate(1.5, 0);
      fill(255,255,255);
      scale (0.4f);
      drawCircle(4);
    popMatrix();
  popMatrix(); // ------------------
  
   pushMatrix();  // -- orbita niebieskiej
    noFill();
    translate(0,0,-1);
    stroke(0,0,255);
    circle(0, 0, 264);
    translate(0,0,1);
    noStroke(); 
  popMatrix(); 
  
   pushMatrix();   // rozowa planeta
    rotate(-1.5*time);
    translate(300, 0);
    fill(255,0,255);
    scale (40);
    drawCircle(25);
    pushMatrix(); // z fioletowym pieciokatnym ksiezycem
      rotate(-0.3*time);
      translate(2.85, 0);
      fill(150,100,230);
      scale (0.4f);
      drawCircle(5);
        pushMatrix(); // z zoltym szesciokatnym ksiezycem ksiezyca
        rotate(-3*time);
        translate(2.75, 0);
        fill(255,255,0);
        scale (0.4f);
        drawCircle(6);
      popMatrix();
    popMatrix();
    pushMatrix(); // z turkusowym trojkatnym ksiezycem
      rotate(2*time);
      translate(2, 0);
      fill(0,255,255);
      scale (0.4f);
      drawCircle(3);
    popMatrix();
    pushMatrix(); // z pomaranczowym ksiezycem
      rotate(-0.9*time);
      translate(1.2, 0);
      fill(255,165,0);
      scale (0.1f);
      drawCircle(30);
    popMatrix();
  popMatrix(); // ------------------
  
  pushMatrix();  // -- orbita rozowej
    noFill();
    translate(0,0,-1);
    stroke(255,0,255);
    circle(0, 0, 600);
    translate(0,0,1);
    noStroke(); 
  popMatrix(); 
  
  
  pushMatrix();   // zielona planeta osmiokatna
    rotate(-0.1*time);
    translate(500, 0);
    fill(0,255,0);
    scale (17);
    pushMatrix();
      rotate(time*1.1);
      drawCircle(8);
    popMatrix();
    pushMatrix(); // z szarym ksiezycem
      rotate(2*time);
      translate(4.5, 0);
      fill(88, 117, 127);
      scale (0.4f);
      drawCircle(30);
    popMatrix();
    pushMatrix(); // z brazowym ksiezycem
      rotate(-0.9*time);
      translate(2, 0);
      fill(92, 26, 34);
      scale (0.7f);
      drawCircle(30);
    popMatrix();
  popMatrix(); // ------------------
  
  pushMatrix();  // -- orbita zielonej
    noFill();
    translate(0,0,-1);
    stroke(0,255,0);
    circle(0, 0, 1000);
    translate(0,0,1);
    noStroke(); 
  popMatrix(); 
  
  time += .01f;
}
