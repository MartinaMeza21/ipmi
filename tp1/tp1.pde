// IPMI comisión 2
 // esto es un comentario :)
 // hola soy un editor de texto para codigo de processing
 
 // 1) crear una variable de la imagen (espacio en memoria RAM)
 PImage camara1;
 
 void setup(){  //se ejecuta una sola vez al iniciar el programa
   //funcion(param1, param2, ...);
   size( 800, 400 );  //tamano de la ventana
   background( 255 ); //color del fondo  
   
   // 2) cargar la imagen de la carpeta data
   camara1= loadImage("camara.jpg");
 }
 
 void draw(){  //se ejecuta de forma ciclica X veces por segundo (FPS> Frames Per Second)
   background( 255 ); //color del fondo  
 
   // 3) mostrar la imagen
   image( camara1, 0, 0, 400, 400 );  // se deforma la resolucion y posiblemente el aspecto 
   
   //hacer mi dibujo del lado derecho de la ventana
   strokeWeight( 1 );
     fill(95,91,91);
   rect( 1+400, 290, 400, 400,10  );
   fill(191,191,191);
   rect( 116+400, 135, 200, 180, 10 );
   fill(131,129,129);
   rect( 116+400, 135, 40, 180, 10 );
     fill( 206, 206, 204, 50 );  
   circle( 220+400, 234, 40);
   fill(0);
   circle( 220+400, 234, 30);
  fill(0);
   rect( 159+400, 140, 155, 70,10  );
     fill(0);
   rect( 195+400, 294, 40, 10,10 );
    fill(155);
   rect( 200+400, 294, 30, 5,10 );
     fill(224,224,224);
   rect( 260+400, 150, 50, 50,10  );
      fill(245,245,245);
   rect( 210+400, 150, 40, 50,10  );
       fill( 240, 240, 255);  
         rect( 200+400, 145, 55, 55,10  );
        fill(245,245,245);
   rect( 210+400, 150, 40, 40,10  );
    fill(113,113,113);
   circle( 190+400, 160, 20);
    fill(113,113,113);
   circle( 190+400, 180, 20);
 
 
 
 
 
 
 
   // linea divsoria de la pantalla en dos
   strokeWeight( 10 );
   line( 400, 0, 400, 400 );
   
   //imprimo en consola las variables X e Y del mouse
   println( mouseX + " / " + mouseY );
 }
