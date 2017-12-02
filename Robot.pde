class Robot{
  
  PVector pos;
  PVector mov;
  
  PVector norte;
  PVector sur;
  PVector este;
  PVector oeste;
  PVector pino;
  
  int xm; // moviemiento en X
  int ym; // movimiento en Y
  
  
  // Variables del modelo
  int[] y = new int[4];
  float[] x = new float[4];
  float[][] w = new float[4][4];
  float[] ruido = new float[4];
  float[] s = new float [4];
  float z_now;
  float z_next;
  float z_before;
  
  
  Robot(float _x,float _y){
    
    // Yo
    pos = new PVector(_x,_y);
    mov = new PVector(0,0);
    
    //Puntos Cardinales
    norte = new PVector(width/2,0);
    sur = new PVector(width/2,height);
    este = new PVector(0,height/2);
    oeste = new PVector(width,height/2);
    pino = new PVector(width/2, height/2);
    
    z_now = 1 / pos.dist(pino);
    
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){
        w[i][j] = random(0,1);
      } 
      ruido[i] = random(-1,1);    
    }
  
  }
  
  void display(){
    stroke(255,100);
    fill(255,30);
    ellipse(pos.x,pos.y,1,1);
  }
  
  
  void calcZ() {
    z_now = pos.dist(pino);
  }
  
  void calcX(){
    x[0] = 1 / pos.dist(norte);
    x[1] = 1 / pos.dist(sur);
    x[2] = 1 / pos.dist(este);
    x[3] = 1 / pos.dist(oeste);
  }
  
  void calcPesos(){
    float[][] delta = new float[4][4];
    
    for(int j = 0; j < 4; j++){
      for(int i = 0; i < 4; i++){
         delta[j][i] = (z_now - z_before) * y[j] * x[j]  ;
      }
    }
           
  }
  
  
  void calcSalida(){
    for(int j = 0; j < s.length; j++){
      for(int i = 0; i < x.length; i++){
         s[j] += w[i][j] * x[i];
      }
      if( (s[j] + ruido[j]) > 0){
         y[j] = 1;
       }else{
         y[j] = 0;  
       }
    }
  }
  
  
  
  void calcMov(){
    
    /* Revisar Sintaxis porque marca error
    if(y[0] == 1){ // muevo norte
       mov = norte.sub(pos);
      mov.normalize(); 
    }
    
    if(y[1] == 1){ // muevo sur
      mov = sur.sub(pos);
      mov.normalize(); 
    }
    
    if (y[2] == 1){ // muevo este
      mov = este.sub(pos);
      mov.normalize(); 
    }
    
    if (y[3] == 1){ // muevo oeste
      mov = oeste.sub(pos);
      mov.normalize(); 
    }*/
    
  }
  
  
  void move(){
    
    pos.add(mov);
  }
  
}
