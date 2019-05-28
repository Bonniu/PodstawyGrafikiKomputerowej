PShape imbryk;
PShape kapsula;
int direction = 0;
int kolor = 4;
int x = 0;
int y = 0;
int z = 0;
float e = 0;
float p = 0;
float b = 0;
boolean strzal = false;

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
  fill(r,g,b);
  
  if(kolor==4)
    emissive(255, 255, 0);
  else if(kolor==1)
    emissive(0, 255, 0);
  else if(kolor==2)
    emissive(0, 0, 255);
  else if(kolor==3)
    emissive(0, 255, 255);
  sphere(27);
  fill(255,255,0);
  emissive(0, 0, 0);
  popMatrix();
}

float time = 0.f;
  
void draw()
{
  background(0);
  pointLight(255,255,255,0,0,0); 
  
  if(mouseX<width/2-30)
  {
    x = x-1;
  }
  if(mouseX>width/2+30)
  {
    x = x+1;
  }
  if(mouseY>height/2+30)
  {
    y = y+1;
  }
  if(mouseY<height/2-30)
  {
    y = y-1;
  } 
  
     
     translate(width *.5f, height *.5f);
     
     print(x," ",y," ",z,"\n");
     camera();
     camera(2*x, 2*y+130, -4*z+450,      2*x  ,2*y   ,-4*z  ,             0,0,-1); 
  //--------------------------------------------------------------------------------------------------------
  
  //--------------------------------------------------------------------------------------------------------
  pushMatrix();
  translate(0+4*x,130+4*y,450-4*z);
  rotateY(2*e);                      // obroty kamery
  translate(0-4*x,-130-4*y,-450+4*z);
  
  translate(0+4*x,150+4*y,320-4*z);
  rotateZ(2*p);
  translate(0-4*x,-150-4*y,-320+4*z); 
  
  translate(0+4*x,150+4*y,320-4*z);
  rotateX(2*b);
  translate(0-4*x,-150-4*y,-320+4*z); 
  
  

  rysujGwiazde(255,255,255);
  fill(255,255,255);
  pushMatrix();   // czerwona planeta 
    rotateX(PI/5);
    rotateY(time); //predkosc obrotu dla czerwonej planety
    translate(72, 0); 
    fill(255,0,0);
    pushMatrix();
      lightSpecular(255, 255, 255);
      specular(255, 255, 255);
      sphere(12);
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
  
popMatrix();
  //zadanie 6 dalej ---------------------------------------
  //kierunki ------------------------------------------------------
  
  if(direction == 1) //a
  {
    x = x - 1;
  }
  else if(direction == 2) //w
  {
    y = y - 1;
  }
  else if(direction == 3) //d
  {
    x = x + 1;
  }
  else if(direction == 4) //s
  {
    y = y + 1;
  }
  else if(direction == 5) //ctrl
  {
    z = z + 1;
  }
  else if(direction == 6) //shift
  {
    z = z - 1;
  }
  else if(direction == 7) //e
  {
    e = e + 0.01;
  }
  else if(direction == 8) //q
  {
    e = e - 0.01;
  }
  else if(direction == 9)  //z
  {
    p = p + 0.01;
  }
  else if(direction == 10) //c
  {
    p = p - 0.01;
  }
  else if(direction == 11)  //x
  {
    b = b + 0.01;
  }
  else if(direction == 12) //v
  {
    b = b - 0.01;
  }
  else if(direction == 13) //r
  {
    b = 0;
    p = 0;
    e = 0;
    x = 0;
    y = 0;
    z = 0;
    
  }
  //-----------------------------------------------------------------------------------------------------------
  
   //statek ----------------------------------------------
  directionalLight(255,255,255,-1,0,-1); // swiatlo na statek
  pushMatrix();  
     
    translate(0,150,320); // ustawienie poczatkowe statku
    fill(0,100,100);
    translate(2*x, 2*y, -4*z); // klawiatura
    box(10,5,25);
    fill(255,255,0);
    pushMatrix();
      translate(2,0,12);
      sphere(2);
    popMatrix();
  
    pushMatrix();
      translate(-2,0,12);
      sphere(2);     
    popMatrix();
    
    fill(255,255,255);
    pushMatrix();
      translate(0,-2,0);
      sphere(4);     
    popMatrix();
    
    if (strzal)//(mousePressed) lub spacja
    {
      translate(0,0,0);
      stroke(0, 255, 0);
      strokeWeight(4);
      line(0, 0, 0, 0, 0, -300);
      stroke(0,0,0);
      strokeWeight(0);
    }
  popMatrix();
  

  time += .01f;
}

void keyPressed() 
{ 
  // wcisniete lewo/a gora/w prawo/d dol/s ctrl shift spacja
  if (key == 'a' || key == CODED && keyCode == LEFT)
    direction = 1;
  else if (key == 'w' || key == CODED && keyCode == UP)
    direction = 2;
  else if (key == 'd' || key == CODED && keyCode == RIGHT)
    direction = 3;
  else if (key == 's' || key == CODED && keyCode == DOWN)
    direction = 4;
  else if (key == CODED && keyCode == CONTROL)
    direction = 5;
  else if (key == CODED && keyCode == SHIFT)
    direction = 6;
  else if (key == ' ')
    strzal = true;
  else if (key == 'e')
    direction = 7;
  else if (key == 'q')
    direction = 8;
  else if (key == 'z')
    direction = 9;
  else if (key == 'c')
    direction = 10;
  else if (key == 'x')
    direction = 11;
  else if (key == 'v')
    direction = 12;
  else if (key == 'r')
    direction = 13;
}

void keyReleased() 
{
  // puszczone lewo prawo gora dol ctrl shift spacja
  if (key == 'a' || key == CODED && keyCode == LEFT)
    direction = 0;
  else if (key == 'w' || key == CODED && keyCode == UP)
    direction = 0;
  else if (key == 'd' || key == CODED && keyCode == RIGHT)
    direction = 0;
  else if (key == 's' || key == CODED && keyCode == DOWN)
    direction = 0;
  else if (key == CODED && keyCode == CONTROL)
    direction = 0;
  else if (key == CODED && keyCode == SHIFT)
    direction = 0;
  else if (key == ' ')
    strzal = false;
  else if (key == 'e')
    direction = 0;
  else if (key == 'q')
    direction = 0;
  else if (key == 'z')
    direction = 0;
  else if (key == 'c')
    direction = 0;
  else if (key == 'x')
    direction = 0;
  else if (key == 'v')
    direction = 0;
  else if (key == 'r')
    direction = 0;
} 

void keyTyped()
{
  if (key == '1')
    kolor = 1;
  else if (key == '2')
    kolor = 2;
  else if (key == '3')
    kolor = 3;
  else if (key == '4')
    kolor = 4;
}
