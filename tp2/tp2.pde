int estado;
PImage pantalla1;
PImage pantalla2;
PImage pantalla3;
PImage pantalla4;

void setup() {
  size(500, 500);
  textAlign(CENTER, CENTER);
  pantalla1 = loadImage("nube.jpg");
  pantalla2 = loadImage("pantalla1.jpg");
  pantalla3 = loadImage("tubos.jpg");
  pantalla4 = loadImage("pantallafinal.jpg");
  estado = 1;
}

void draw() {
  if (estado == 1) {
    image(pantalla1, 0, 0, width, height);
    if (frameCount == 60 * 5) {
      estado = 2;
    }
  } else if (estado == 2) {
    image(pantalla2, 0, 0, width, height);
    if (frameCount == 60 * 10) {
      estado = 3;
    }
  } else if (estado == 3) {
    image(pantalla3, 0, 0, width, height);
  } else if (estado == 4) {
    image(pantalla4, 0, 0, width, height);
    if (frameCount == 60 * 15) {
      estado = 4;  // Este if no cambia nada, podés eliminarlo si no va a otro estado
    }
  }

  // Mostrar tiempo
  textSize(36);
  text(int(frameCount / 60), 100, 100);
}

void mousePressed() {
  // Programar botón de reinicio si querés
}

void mouseReleased() {
  estado++;
  println(estado);
}

void keyPressed() {
  if (keyCode == LEFT) {
    estado--;
  } else if (keyCode == RIGHT) {
    estado++;
  }
  println(estado);
}
