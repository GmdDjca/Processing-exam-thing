int pX=300;      //   punto de mira coordenadas
int pY=300;
int gX, gY;      //   coordenadas del objetivo
int p=0;         //   puntos del juego
int v = 0;   //vidas de cada alien
PImage objetivo, mira, fondo;

boolean ignoreMouse;
void setup () {
  PFont meme;
  meme = loadFont("Monospaced.plain-48.vlw");
  textFont(meme, 20);

  size(900,600);
  objetivo = loadImage("alien.png");
  mira     = loadImage("puntodemira.png");
  fondo    = loadImage("fondomarciano.jpg");
  new_objetivo();
}


void draw(){
  pX = mouseX;
  pY = mouseY;
  image (fondo, 0,0);
  
  gX++;  // el objetivo sube
  
  if(gX== 0) new_objetivo();
  
  if(gX>pX && gX<pX+20)
  if(gY>pY && gY<pY+20)
  if(mouseButton == LEFT && mousePressed && ignoreMouse == false) {
    if (ignoreMouse == true) return;
    if (v > 0) { v--; } 
    if (v == 0) {
         p++;
         new_objetivo();
         ignoreMouse = true;
         return;}
  } 
  
  image (objetivo, gX-30, gY-30+(int(random(-10,10))) );
  image (mira, pX-20, pY-20);
  //teclado();
  
  text ("Aliens killed: "+p, 10,30);    // marcador
  text ("Current alien's life: "+v, 10,60);
  
  int crono = int (millis()/1000);
  if (crono >= 40) {
  fill(0);
  text("GA,MER OVER AAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", 10, 100);
  noLoop();
  return;
}               //termina el juego
  text ("Tiempo: "+ (40-crono), width-130,20);
  if (!mousePressed) ignoreMouse = false;
  if (mousePressed) ignoreMouse = true;
}

void new_objetivo(){
  gX = 0;
  gY = 20+int(random (height-40));
  v = 3;
}

/*  INNECESARIO: ahora se controla con el ratón
void teclado(){
  if(keyPressed){
    if (keyCode == RIGHT) pX = pX + 3;
    if (keyCode == LEFT)  pX = pX - 3;
    if (keyCode == UP)    pY = pY - 3;
    if (keyCode == DOWN)  pY = pY + 3;
  }
  
  if (pX < 0)     pX=0;
  if (pX > width) pX=width -40;
  if (pY < 0)     pY=0;
  if (pY > height -20) pY = height -40;
}*/
