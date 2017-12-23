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
    stroke(255);
    fill(255,30);
    ellipse(pos.x,pos.y,1,1);
    
    for(int i = 0; i < ruido.length;i++){
      ruido[i] = random(-2,2); 
    }
    
  }
  
  int contNow = 1;
  int contBef = 0;
  float[] memZ = new float[3]; 
  
  void calcZ() {
    
    if(contNow < 2 ){
      contNow++ ;
    }else{
      contNow = -1;
      contNow++;
    }
    
    if(contBef < 2 ){
      contBef++ ;
    }else{
      contBef = -1;
      contBef++;
    }
    
    z_now = pos.dist(pino);
    
    memZ[contNow] = z_now;
    
    z_before = memZ[contBef];
    z_now = memZ[contNow];
   
    
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
         delta[j][i] = (z_now - z_before) * y[j] * x[i] ;
         //println(delta[j][i]);
      }
    }
           
  }
  
  
  
  void calcSalida(){    
    
    for(int j = 0; j < s.length; j++){
      for(int i = 0; i < x.length; i++){
         s[j] += w[j][i] * x[i];
      }
      if( (s[j] + ruido[j]) > 0){
        
         println("s[" + j + "]"+s[j]);
         y[j] = 1;
       }else{
         y[j] = 0;  
       }
    }
    
  }
  
  void limpiarSalida(){
    for(int i = 0; i < s.length;i++){
      s[i] = 0;
    }
  }
  
  
  
  void calcMov(){
    
    
    if(y[0] == 1){ // muevo norte
     norte =new  PVector(0,-1);
     //mov = norte;
     
    }
    if(y[1] == 1){ // muevo sur
      sur = new PVector(0,1);
      //mov = sur;
     
    }
    if(y[2] == 1){ // muevo este
      este = new PVector(-1,0);
     //mov = este;
    }
    if(y[3] == 1){ // muevo oeste
      oeste = new PVector(1,0);
     //mov = oeste;
    }
    
    norte.add(sur);
    norte.add(este);
    norte.add(oeste);
    norte.normalize();
    
    mov = norte;
    
  }
  
  void limites(){
    if(pos.x > width){
      pos.x = 0;
    }
    if(pos.x < 0){
      pos.x = width;
    }
    
    if(pos.y > height){
      pos.y = 0;
    }
    
    if(pos.y < 0){
      pos.y = height;
    }
  }
  
  
  void move(){
    pos.add(mov);
  }
  
}
