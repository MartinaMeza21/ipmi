int estado;
PImage pantalla1, pantalla2, pantalla3, pantalla4;

int tiempoInicio;
int duracionPantalla = 240; // 4 segundos (60 FPS * 4)

// Variables para animaciones
float xNube;          // Pantalla 1
float yPantalla2;     // Pantalla 2
float dirY;           // Dirección del movimiento vertical

float zoomPantalla3;  // Pantalla 3
float dirZoom;        // Dirección del zoom

float rotacionFinal;  // Pantalla 4

// Texto animado
float yTexto;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);

  // Cargar imágenes
  pantalla1 = loadImage("pantalla.jpg");
  pantalla2 = loadImage("pantalla1.jpg");
  pantalla3 = loadImage("sol.jpg");
  pantalla4 = loadImage("pantallafinal.jpg");

  estado = 1;
  iniciarAnimaciones();
}

void draw() {
  background(0);

  if (estado == 1) {
    xNube -= 1;
    if (xNube < -width) xNube = 0;

    image(pantalla1, xNube, 0, width, height);
    image(pantalla1, xNube + width, 0, width, height);

    mostrarTexto("Plants vs Zombies es un juego\n donde defiendes tu casa con plantas.");
    cambiarEstadoAutomaticamente(2);

  } else if (estado == 2) {
    // Imagen que sube y baja suavemente
    yPantalla2 += dirY;
    if (yPantalla2 > 20 || yPantalla2 < -20) {
      dirY *= -1;
    }

    image(pantalla2, 0, yPantalla2, width, height);

    mostrarTexto("Cada planta tiene poderes distintos\n para frenar la invasión zombie.");
    cambiarEstadoAutomaticamente(3);

  } else if (estado == 3) {
    // Zoom 
    zoomPantalla3 += dirZoom;
    if (zoomPantalla3 > 1.2 || zoomPantalla3 < 1.0) {
      dirZoom *= -1;
    }

    imageMode(CENTER);
    image(pantalla3, width / 2, height / 2, width * zoomPantalla3, height * zoomPantalla3);
    imageMode(CORNER);

    mostrarTexto("Debes recolectar soles\n para plantar tus defensas.");
    cambiarEstadoAutomaticamente(4);

  } else if (estado == 4) {
    // Rotación de la imagen final
    rotacionFinal += 0.01;

    pushMatrix();
    translate(width / 2, height / 2);
    rotate(rotacionFinal);
    imageMode(CENTER);
    image(pantalla4, 0, 0, width, height);
    popMatrix();
    imageMode(CORNER);

    mostrarTexto("¡Gana el que resiste a todos\n los zombies y salva su jardín!");

    mostrarBotonReiniciar();
  }

  // Mostrar el tiempo transcurrido
  fill(255);
  textSize(16);
  text("Tiempo: " + int((frameCount - tiempoInicio) / 60) + "s", width - 80, 30);
}

// ================= FUNCIONES =================

// Texto animado que sube desde abajo
void mostrarTexto(String mensaje) {
  fill(255);
  textSize(24);

  if (yTexto > height / 2) {
    yTexto -= 2;
  }

  text(mensaje, width / 2, yTexto);
}

// Cambiar de estado automáticamente si pasa el tiempo
void cambiarEstadoAutomaticamente(int siguiente) {
  if (frameCount - tiempoInicio > duracionPantalla) {
    estado = siguiente;
    iniciarAnimaciones();
  }
}

// Reiniciar variables cuando empieza una nueva pantalla
void iniciarAnimaciones() {
  tiempoInicio = frameCount;

  // Pantalla 1
  xNube = 0;

  // Pantalla 2
  yPantalla2 = 0;
  dirY = 1;

  // Pantalla 3
  zoomPantalla3 = 1.0;
  dirZoom = 0.005;

  // Pantalla 4
  rotacionFinal = 0;

  // Texto
  yTexto = height + 50;
}

// Mostrar botón de reinicio
void mostrarBotonReiniciar() {
  fill(255, 0, 0);
  rect(width / 2 - 80, height - 80, 160, 40);
  fill(255);
  textSize(20);
  text("Reiniciar", width / 2, height - 60);
}

// Reiniciar si se hace clic en el botón
void mousePressed() {
  if (estado == 4) {
    if (mouseX > width / 2 - 80 && mouseX < width / 2 + 80 &&
        mouseY > height - 80 && mouseY < height - 40) {
      estado = 1;
      iniciarAnimaciones();
    }
  }
}
