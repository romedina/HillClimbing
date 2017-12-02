Robot r = new Robot(random(0,400),random(0,400));

void setup(){
  size(400,400);
  background(0);
}

void draw(){
  dibujarEscenario();

  r.display();
  r.calcSalida();
  r.calcMov();
  r.move();
}
