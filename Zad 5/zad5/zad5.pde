PShape imbryk;
PShape kapsula;

void setup() {
  size(1280, 720, OPENGL);
  noStroke();
  imbryk = loadShape("teapot.obj");
  kapsula = loadShape("capsule.obj");
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
  emissive(255, 255, 0);
  sphere(27);
  fill(255,255,0);
  emissive(0, 0, 0);
  popMatrix();
}

float time = 0.f;
  /*
  float r = 0;
float g = 0;
float b = 0;          // slonce gasi sie i zapala
int mn=1;  
boolean flaga=true; */
void draw()
{
  background(0);
  /*
  if(r>=255 || b>=255 || g>=255)
  {
    flaga=false;
    r = 254;
    g = 254;
    b = 254;
  }
   
  if(r<=0 || g<=0 || g<=0)
  {
    flaga=true;
  }
  if(flaga)
    mn=1;
  else
   mn=-1;
  
  r = r+mn;
  g = g+mn;
  b = b+mn;
 
    pointLight(r,g,b,width*0.5f, height*0.5f,0);                                     // slonce gasi sie i zapala
  
     pushMatrix();
  translate(width * 0.5f, height *0.5f);
  fill(r,g,b);
  emissive(r, g, 0);
  sphere(27);
  fill(255,255,0);
  emissive(0, 0, 0);
  popMatrix();
    
    
    */
 // lights();
  pointLight(255,255,255,width*0.5f, height*0.5f,0); // slonce gasi sie i zapala
  rysujGwiazde(255,255,255);
  translate(width *.5f, height *.5f);
  fill(255,255,255);
  
 // rotate(time);  //predkosc poczatkowa dla wzs
 
  pushMatrix();   // czerwona planeta 
    rotateX(PI/5);
    rotateY(time); //predkosc obrotu dla czerwonej planety
    translate(72, 0); 
    fill(255,0,0);
    pushMatrix();
      lightSpecular(255, 255, 255);
      specular(255, 255, 255);
      sphere(12);
      /*
      pushMatrix();
        stroke(255,0,0);
        line(-200,-200,-200,200,200,200); // os obrotu
        noStroke();
      popMatrix();
     */
    popMatrix();    
    pushMatrix(); // z szarym box ksiezycem
      rotate(time);
      translate(30, 0);
      fill(100,100,100);
      box(6);
    popMatrix();
  popMatrix(); // ------------------
    
    
  pushMatrix();   // planeta kapsula
    rotateX(PI/4);
    rotateY(3*time);
    translate(132, 0);
    /*
    pushMatrix();
        stroke(255,100,0);
        line(-200,-200,-200,200,200,200); // os obrotu
        noStroke();
    popMatrix();
    */
    fill(0,0,255);
    pushMatrix();
      scale(15);
      rotateZ(3*time);
      shape(kapsula);
    popMatrix();
    pushMatrix(); // z bialym kwadratowym ksiezycem
      rotate(-6*time);
      translate(30, 0);
      fill(255,255,255);
      box(4);
    popMatrix();
  popMatrix(); // ------------------
  
   pushMatrix();   // rozowa planeta
    rotateX(PI/2);
    rotate(-2*time);
    translate(300, 0);
    fill(255,0,255);
    pushMatrix();
      sphere(50); 
      /*
      pushMatrix();
        stroke(255,0,255);
        line(-200,-200,-200,200,200,200); // os obrotu
        noStroke();
      popMatrix();
      */
    popMatrix();
    pushMatrix(); // z czerwonym box ksiezycem
      rotateY(PI/3);
      rotate(-6*time);
      translate(68, 0);
      fill(255,0,0);
      pushMatrix();
        rotate(13*time);
        box(10);
      popMatrix();
    popMatrix();
    pushMatrix(); // z turkusowym box ksiezycem
      rotate(20*time);
      translate(81, 0);
      fill(0,255,255);
      box(15);    
      popMatrix();
    pushMatrix(); // z pomaranczowym ksiezycem
      rotateX(PI/2);
      rotate(-0.9*time);
      translate(99, 0);
      fill(255,165,0);
      pushMatrix();
        rotate(time*6);
        scale (10);
        shape(imbryk);
      popMatrix();    
    popMatrix();
  popMatrix(); // ------------------
  
  pushMatrix();   // planeta zielona
    rotateY(PI/3);
    rotate(-1*time);
    translate(450, 0);
    fill(0,255,0);
    pushMatrix();
      rotate(time*7.1);
      spotLight(255, 255, 255, 0, 15, 0, 0, 1, 0, PI/4, 600);
      sphere(15);
      /*
      pushMatrix();
        stroke(0,255,0);
        line(-200,-200,-200,200,200,200);  // os obrotu
        noStroke();
      popMatrix();
      */
    popMatrix();
    pushMatrix(); // z szarym ksiezycem
      rotate(2*time);
      translate(30, 0);
      fill(88, 117, 127);
      box(10);
    popMatrix();
    pushMatrix(); // z brazowym ksiezycem
      rotate(-0.9*time);
      translate(60, 0);
      fill(92, 26, 34);
      lightSpecular(255,0,0);
      specular(255,0,0);
      sphere(12);
      lightSpecular(0,0,0);
    popMatrix();
  popMatrix(); // ------------------
  /*
  pushMatrix();
    translate(0,0,-600);
    fill(100,100,100);
    box(2000,2000,2);
  popMatrix(); 
  */
  time += .01f;
}
