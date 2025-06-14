//https://youtu.be/C4uba3uF-JE

PImage ref;
int cantidad = 5; // filas y columnas
int franjas = 8;
boolean onda = true;

color c1 = color(0);           // negro
color c2 = color(255);         // blanco
color c3 = color(255, 0, 255); // fucsia
color c4 = color(0, 255, 0);   // verde

void setup() {
  size(800, 400);
  ref = loadImage("diseno.png"); // asegurate de tener la imagen en la carpeta del sketch
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(255);
  image(ref, 0, 0, 400, 400); // imagen de referencia a la izquierda

  float tam = 400.0 / cantidad;

  for (int i = 0; i < cantidad; i++) {
    for (int j = 0; j < cantidad; j++) {
      float x = 400 + j * tam;
      float y = i * tam;

      float offset = 0;

      if (onda) {
        offset = calcularOffset(i); 
        if (j % 2 == 0) {
          x += offset;
        } else {
          x -= offset;
        }
      }

      float cx = x + tam / 2;
      float cy = y + tam / 2;
      dibujarCuadrados(cx, cy, tam); 
    }
  }
}

float calcularOffset(int fila) {
  return sin(radians(fila * 30 + frameCount * 2)) * 6;
}

void dibujarCuadrados(float cx, float cy, float tam) {
  pushMatrix();
  translate(cx, cy);
  float paso = tam / franjas;

  for (int i = franjas; i > 0; i--) {
    float s = i * paso;

    if (i % 4 == 0) fill(c1);
    else if (i % 4 == 1) fill(c2);
    else if (i % 4 == 2) fill(c3);
    else fill(c4);

    rect(0, 0, s, s);
  }

  popMatrix();
}

void keyPressed() {
  if (keyCode == UP && cantidad < 10) cantidad++;
  else if (keyCode == DOWN && cantidad > 1) cantidad--;
  else if (key == 'w') onda = !onda;
  else if (key == 'r') resetear();
  else if (key == 'p') cambiarColores();
}

void mousePressed() {
  franjas = int(map(mouseX, 400, width, 4, 20));
}

void resetear() {
  cantidad = 5;
  franjas = 8;
  onda = true;

  c1 = color(0);
  c2 = color(255);
  c3 = color(255, 0, 255);
  c4 = color(0, 255, 0);
}

void cambiarColores() {
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  c4 = color(random(255), random(255), random(255));
}
