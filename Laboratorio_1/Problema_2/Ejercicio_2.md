### Ejercicio 2. Switches, botones y LEDs
1. Diseñe un módulo que reciba como entradas los 4 interruptores hacia los pines de la FPGA que se utilizará en este laboratorio.
2. Las salidas del módulo se mostrarán en los 4 LEDs disponibles en la tarjeta de desarrollo.
3. El bloque a desarrollar debe convertir el código ingresado por los interruptores por el correspondiente a su complemento a 2 hacia los LEDs.
4. Implemente un banco de pruebas (testbench) para validar el funcionamiento de su diseño.
5. Realice una validación de su diseño en la tarjeta con FPGA.
## Codigo de prubas en vivado.
Antes de subir el archivo a la tarjeta Tang Nano 9k, se debe realizar una prueba, está se realizó en Vivado, dicho codigo está  [Codigo_prueba.sv](Laboratorio-1_Taller-de-Digitales_Grupo-4\Laboratorio_1\Problema_2). De manera que comprobamos su funcionamiento a través de un banco de pruebas, este se visualiza en el siguiente codigo  [Codigo_prueba_tb.sv](Laboratorio-1_Taller-de-Digitales_Grupo-4\Laboratorio_1\Problema_2), al realizar está prueba se debera ver una entrada de 4 bits que contiene el interruptor, los cuales van de 0 a F, ya que se trabaja en nomeclatura hexadecimal. De está forma los 4 leds de la tarjeta deberan dar como resultado la cuenta de los números en complemento a 2, es decir acorde a la formula ~(número)+1'b. En la siguiente imagen podemos ver que se cumple los resultados.
## Implementación en tarjeta. 
Ya con el codigo pasado por las pruebas lo pasamos a un programa para subirlo a al tarje Tang Nano 9k, en este caso se utilizó GoWin. El codigo se cambia al siguiente COLOCAR NOMBRE, y se determian que los pines a usar son  COLOCAR NOMBRE. Esto de acuerdo al siguiente diagrama del circuito. COLOCAR NOMBRE.
Al relizar la preuba podemos ver que se cumple lo solicitado en el enunciado.
COLOCAR IMAGEN DE LA TARJETA
