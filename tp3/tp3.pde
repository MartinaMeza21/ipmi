// https://youtu.be/ZUZ1dWuxNmQ

// -------------------------------------------------------------
// DECLARACIÓN DE VARIABLES
// -------------------------------------------------------------

// Declaro una variable de tipo imagen (PImage) para cargar una imagen de referencia
PImage ref;

// Declaro variables para controlar:
// - cantidad → cuántas filas y columnas tendrá la grilla de cuadrados
// - franjas → cuántas franjas (rectángulos concéntricos) tendrá cada cuadrado
// - onda → si está activada o no la animación de movimiento tipo onda
int cantidad = 5;
int franjas = 8;
boolean onda = true;

// Defino 4 colores distintos que se usarán para pintar las franjas
// c1 → negro
// c2 → blanco
// c3 → fucsia
// c4 → verde
color c1 = color(0);
color c2 = color(255);
color c3 = color(255, 0, 255);
color c4 = color(0, 255, 0);

// -------------------------------------------------------------
// FUNCIÓN setup()
// Se ejecuta UNA SOLA VEZ al iniciar el programa
// -------------------------------------------------------------

void setup() {
  size(800, 400);  
  // CUMPLE:
  // Resolución de 800 x 400, tal como exige la consigna.

  ref = loadImage("diseno.png");  
  // CUMPLE:
  // La consigna pide que haya una imagen de referencia en el lado izquierdo.

  rectMode(CENTER); 
  noStroke(); 
}

// -------------------------------------------------------------
// FUNCIÓN draw()
// Se ejecuta en bucle todo el tiempo (60 veces por segundo aprox.)
// -------------------------------------------------------------

void draw() {
  background(255); // Fondo blanco en cada frame

  // Dibuja la imagen de referencia en la mitad izquierda de la ventana
  // (0,0) y de tamaño 400 x 400 píxeles
  image(ref, 0, 0, 400, 400);

  // Calculo el tamaño de cada celda (cuadrado) en la grilla
  // Ejemplo: si cantidad = 5 → tam = 400/5 = 80 px
  // Uso 400.0 en vez de 400 para asegurarme de obtener decimal (float)
  float tam = 400.0 / cantidad;

  // CUMPLE:
  // Uso de estructuras repetitivas (FOR anidados)
  for (int i = 0; i < cantidad; i++) {
    for (int j = 0; j < cantidad; j++) {

      // Calculo posición de cada celda
      float x = 400 + j * tam;
      float y = i * tam;

      float offset = 0; // Inicializo desplazamiento

      // CUMPLE:
      // Uso de condicionales (if) y animación interactiva
      if (onda) {
        offset = calcularOffset(i); 
        // Llamada a función PROPIA que RETORNA un valor (float)

        // Alterno el sentido del desplazamiento según columna par o impar
        if (j % 2 == 0) {
          x += offset;
        } else {
          x -= offset;
        }
      }

      float cx = x + tam / 2;
      float cy = y + tam / 2;

      // CUMPLE:
      // Llamada a función propia con PARÁMETROS que NO retorna valor
      dibujarCuadrados(cx, cy, tam);
    }
  }
}

// -------------------------------------------------------------
// FUNCIÓN calcularOffset(int fila)
// Calcula desplazamiento horizontal para la onda
// CUMPLE:
// - Función propia con parámetro que RETORNA un valor (float)
// - Uso de funciones matemáticas → sin(), radians()
// -------------------------------------------------------------

float calcularOffset(int fila) {
  // Sin() genera un movimiento suave de ida y vuelta.
  // radians() convierte grados a radianes porque Processing trabaja en radianes.
  // frameCount hace que la animación avance con el tiempo.
  return sin(radians(fila * 30 + frameCount * 2)) * 6;
}

// -------------------------------------------------------------
// FUNCIÓN dibujarCuadrados(cx, cy, tam)
// Dibuja cuadrados concéntricos
// CUMPLE:
// - Función propia con parámetros que NO retorna valor
// - Uso de estructuras repetitivas (for)
// - Uso de condicionales (if-else)
// -------------------------------------------------------------

void dibujarCuadrados(float cx, float cy, float tam) {
  pushMatrix(); // Guarda el sistema de coordenadas
  translate(cx, cy); // Traslada el centro de coordenadas

  float paso = tam / franjas;

  // FOR que dibuja franjas desde afuera hacia adentro
  for (int i = franjas; i > 0; i--) {
    float s = i * paso;

    // Uso de condicionales para asignar distintos colores
    if (i % 4 == 0) fill(c1);
    else if (i % 4 == 1) fill(c2);
    else if (i % 4 == 2) fill(c3);
    else fill(c4);

    rect(0, 0, s, s);
  }

  popMatrix(); // Restaura el sistema de coordenadas
}

// -------------------------------------------------------------
// FUNCIÓN keyPressed()
// CUMPLE:
// - Eventos de teclado para modificar variables
// - Interactividad
// - Reiniciar programa
// -------------------------------------------------------------

void keyPressed() {
  if (keyCode == UP && cantidad < 10) cantidad++;
  // Aumenta cantidad de filas y columnas

  else if (keyCode == DOWN && cantidad > 1) cantidad--;
  // Disminuye cantidad de filas y columnas

  else if (key == 'w') onda = !onda;
  // Activa o desactiva el efecto de onda

  else if (key == 'r') resetear();
  // Reinicia todo a valores originales

  else if (key == 'p') cambiarColores();
  // Cambia colores a valores aleatorios
}

// -------------------------------------------------------------
// FUNCIÓN mousePressed()
// CUMPLE:
// - Evento de mouse
// - Uso de función matemática map()
// - Interactividad para modificar variable franjas
// -------------------------------------------------------------

void mousePressed() {
  franjas = int(map(mouseX, 400, width, 4, 20));
  // map() convierte la posición del mouse en un número entre 4 y 20
}

// -------------------------------------------------------------
// FUNCIÓN resetear()
// CUMPLE:
// - Reiniciar variables a su estado original
// -------------------------------------------------------------

void resetear() {
  cantidad = 5;
  franjas = 8;
  onda = true;

  c1 = color(0);
  c2 = color(255);
  c3 = color(255, 0, 255);
  c4 = color(0, 255, 0);
}

// -------------------------------------------------------------
// FUNCIÓN cambiarColores()
// CUMPLE:
// - Uso de función matemática random()
// - Interactividad
// -------------------------------------------------------------

void cambiarColores() {
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  c4 = color(random(255), random(255), random(255));
}
