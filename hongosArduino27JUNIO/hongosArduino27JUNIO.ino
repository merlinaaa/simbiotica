#include <CapacitiveSensor.h>

// (sender, receiver) 
CapacitiveSensor notaDO(8, 2);   // DO  
CapacitiveSensor notaRE(8, 3);   // RE
CapacitiveSensor notaMI(8, 4);   // MI
CapacitiveSensor notaFA(8, 5);   // FA
CapacitiveSensor notaSOL(8, 6);  // SOL

void setup() {
  Serial.begin(9600);
}

void loop() {
  if (notaDO.capacitiveSensor(30) > 10)  Serial.write('A');  // DO
  if (notaRE.capacitiveSensor(30) > 10)  Serial.write('B');  // RE
  if (notaMI.capacitiveSensor(30) > 10)  Serial.write('C');  // MI
  if (notaFA.capacitiveSensor(30) > 10)  Serial.write('D');  // FA
  if (notaSOL.capacitiveSensor(30) > 10) Serial.write('E');  // SOL

  delay(10); // Cada cuanto se lee el sensor, en este caso cada 10milisegundos.
  /*En caso de que se escuche un corte o se note que el audio termina y vuelve a iniciar,
  es probable que sea porque la lectura reactiva la orden de reproducir el audio
  antes de que el audio termine. Es decir, el audio dura más que el delay entre
  lectura y lectura. En todo caso esto lo tiene que corregir area SONIDO:
  que los audios arranquen y terminen en el mismo volumen, sin modulación ni transiciones
  ni nada. No sé si es algo que pasa rn pero en caso de que suceda esa es la solución. 
  Bue escribia un montónnnn!! atte: Mer <3 */
}
