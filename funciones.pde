void dibujarEscenario(){
  
  int tamanoPunto = 10; 
  

  
  // Puntos Cardinales
  fill(200,0,255);
  noStroke();
  ellipse(width/2,0,tamanoPunto,tamanoPunto); // norte
  ellipse(width/2,height,tamanoPunto,tamanoPunto); // sur
  ellipse(0,height/2,tamanoPunto,tamanoPunto);//este
  ellipse(width,height/2,tamanoPunto,tamanoPunto); //oeste
  
  // Arbol
  fill(0,200,0);
  noStroke();
  ellipse(width/2,height/2,tamanoPunto,tamanoPunto);
}
