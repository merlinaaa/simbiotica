//ACTUALIZACIÓN 28 DE JUNIO

import ddf.minim.*;
import processing.serial.*;

Minim minim;
AudioPlayer do_, re, mi, fa, sol;
Serial arduino;

void setup() {
  size(400, 200);
  minim = new Minim(this);
//SONIDOS PARA LA MELODIA//
/*  do_ = minim.loadFile("DO.mp3");
  re  = minim.loadFile("RE.mp3");
  mi  = minim.loadFile("MI.mp3");
  fa  = minim.loadFile("FA.mp3"); 
  sol = minim.loadFile("SOL.mp3"); */
  
  ///          PERCUSIÓN       ///
  do_ = minim.loadFile("percu1.m4a");
  re  = minim.loadFile("percu2tambores.m4a");
  mi  = minim.loadFile("percu3.m4a");
  fa  = minim.loadFile("percu4.m4a"); 
  sol = minim.loadFile("percu5.m4a");

  arduino = new Serial(this, Serial.list()[0], 9600);
}


void serialEvent(Serial p) {
  int letra = p.read(); // TOMA UN SOLO CARACTER EN VEZ DEL STRING QUE VENIA LEYENDO

  if (letra == 'A') reproducir(do_);
  if (letra == 'B') reproducir(re);
  if (letra == 'C') reproducir(mi);
  if (letra == 'D') reproducir(fa); 
  if (letra == 'E') reproducir(sol);
}

//MELODIA
//LA NOTA SUENA *SIEMPRE* MIENTRAS SE TOQUE EL SENSOR ////
/*void reproducir(AudioPlayer sonido) {
  if (sonido != null) {
    if (sonido.isPlaying()) sonido.rewind();
    sonido.play();
  }
} */



/////// OPCIONAL 2 ///////
//PERCUSIÓN//
//Se toca el sensor indefinidamente, pero el archivo de audio suena una sola vez.
//Para que se reinicie, hay que sacar el dedo y volver a tocar.
void reproducir(AudioPlayer sonido) {
  if (sonido != null && !sonido.isPlaying()) {
    sonido.play();
  }
}
