Robot r = new Robot(random(0,400),random(0,400));

void setup(){
  size(400,400);
  
}

void draw(){
  background(0);
  dibujarEscenario();
  

  r.display();
  
  
  
  r.calcX();
  r.calcZ();
  r.calcPesos();
  r.calcSalida();
  r.calcMov();
  
  r.limites();
  
  r.move();
  r.limpiarSalida();
}
