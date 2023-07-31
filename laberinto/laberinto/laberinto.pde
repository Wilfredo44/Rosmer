PImage laberintoImg;
int jugadorX, jugadorY;
int w = 20; // Tamaño de la celda del laberinto

void setup() {
  size(600, 400);
  laberintoImg = loadImage("imagen.png");
  laberintoImg.resize(width, height); // Ajustar el tamaño de la imagen al tamaño de la pantalla
  jugadorX = 30; // Posición inicial del jugador en píxeles
  jugadorY = 30;
}

void draw() {
  background(255);
  image(laberintoImg, 0, 0);
  dibujarJugador(jugadorX, jugadorY);
}

void dibujarJugador(int x, int y) {
  fill(255, 0, 0);
  ellipse(x, y, w*0.8, w*0.8);
}

void keyPressed() {
  int nextX = jugadorX;
  int nextY = jugadorY;
  
  // Detectar las teclas presionadas
  if (key == 'w' || key == 'W') {
    nextY -= w; // Mover hacia arriba
  } else if (key == 's' || key == 'S') {
    nextY += w; // Mover hacia abajo
  } else if (key == 'a' || key == 'A') {
    nextX -= w; // Mover hacia la izquierda
  } else if (key == 'd' || key == 'D') {
    nextX += w; // Mover hacia la derecha
  }
  
  // Verificar si el próximo movimiento es válido (no choca con una pared)
  if (esMovimientoValido(nextX, nextY)) {
    jugadorX = nextX;
    jugadorY = nextY;
  }
}

boolean esMovimientoValido(int x, int y) {
  // Verificar si el jugador se encuentra dentro de los límites de la imagen
  if (x < 0 || x >= width || y < 0 || y >= height) {
    return false;
  }
  
  // Obtener el color del píxel en la posición del jugador
  color pixelColor = laberintoImg.get(x, y);
  
  // Verificar si el color del píxel es un camino (blanco)
  return brightness(pixelColor) > 200;
}
