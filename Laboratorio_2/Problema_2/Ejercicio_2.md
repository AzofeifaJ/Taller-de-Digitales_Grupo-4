###   Ejercicio 2- Interfaz para teclado hexadecimal
La Figura 2 muestra un diagrama básico de una interfaz para un teclado hexadecimal. En el
 laboratorio 1 se desarrollaron los bloques combinacionales presentes en el sub-cuadro protoboard.
 En este laboratorio se completará la interfaz por medio de bloques implementados en la FPGA.
 El objetivo de esta interfaz es determinar que presionó una tecla y que la salida muestre el valor
 de la etiqueta en el teclado (e.g., si presion´o la tecla con la letra A, la salida debe ser el valor
 hexadecimal Ah)
 ![Captura de pantalla 2024-10-01 171330](https://github.com/user-attachments/assets/8654f870-8f90-4ca7-b785-eb6e64f8aace)
 1. Analice la función que cumple cada uno de los bloques presentes en la interfaz (contador de
 2 bits, divisor de reloj, codificador de tecla, y sincronizador y antirebote ). Preste especial atención a la temporización de las señales y el flujo de estas desde la entrada hasta la salida
 del módulo
2. Incluya en su diseño y diagrama de bloques el siguiente contador de pruebas, el cual le
 será dado. El bloque está sincronizado con el reloj por medio de la entrada clk. Además,
 hace uso de un reset rst activo en bajo. Una señal habilitadora activa en alto, EN,
 permite realizar un incremento cada vez que se da un flanco positivo en esta señal. Una
 señal con rebotes puede causar conteos indeseados.
3.  A partir del análisis anterior, defina las tablas de verdad, diagramas de estado y diagramas
 temporales requeridos para resolver cada bloque. Sugerencia: usar esta herramienta para
 los diagramas de tiempo
4.  Defina un módulo, de mayor nivel de jerárquía, que combine de forma estructural cada
 subloque para formar la interfaz dentro de la FPGA. Seleccione uno de los puertos del
 pin header en su tarjeta FPGA para conectar las señales hacia y desde la protoboard que
 contiene el teclado y otros bloques combinacionales.
5.  Desarrolle y ejecute una prueba de validación a nivel de simulación de la interfaz completa.
 Usted debe implementar un escenario d´ onde se simule el rebote de una de las teclas.
 6.   Implemente el sistema en la tarjeta FPGA. Recuerde que debe agregar hardware adicional
 para demostrar el funcionamiento (LEDs y/o display de 7 segmentos).

## Planteamiento del problema
El problema plantea la necesidad de desarrollar un sistema para gestionar un teclado hexadecimal en una FPGA, donde se deben escanear filas y columnas de manera eficiente para detectar qué tecla ha sido presionada. El sistema también debe eliminar los rebotes que se producen al pulsar una tecla, evitando lecturas erróneas y garantizando una salida estable en formato hexadecimal. Para lograr esto, es esencial dividir la señal de reloj original, demasiado rápida para un escaneo eficaz, y utilizar un contador para activar cada fila del teclado de forma secuencial. Además, el sistema debe convertir las señales de las columnas en un código binario y generar la salida hexadecimal correspondiente, asegurando que la detección de teclas sea precisa, incluso después de un posible reset del sistema.
# Diagrama de bloques para el ejercicio 2
