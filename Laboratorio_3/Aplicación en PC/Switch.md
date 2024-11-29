### Descripción Módulo top_module:

## Entradas y salidas:
sw: 4 bits de entrada (de un conjunto de interruptores o switches).
a_to_g: 7 bits de salida que controlan los segmentos del display de 7 segmentos.
an: 8 bits de salida que indican qué dígitos están activos en el display (en este caso, solo uno de los dígitos está activo).
dp: Salida que controla el punto decimal del display, pero en este caso está asignado a 1 (lo que indica que no se usa).

# Asignaciones:
an = 8'b11111110: Se configura el display para que solo el primer dígito (el de más a la derecha) sea activo. En este caso, se utiliza un valor de 8 bits donde el bit correspondiente al dígito que se activa es 0 (para que el dígito se encienda) y los demás son 1.
dp = 1: El punto decimal del display de 7 segmentos está desactivado (por lo tanto, dp es 1).
Instanciación del módulo hex7seg:
El valor de sw (que es un número de 4 bits) se pasa como entrada al módulo hex7seg, y el resultado (la representación de 7 segmentos) se asigna a la salida a_to_g.
Módulo hex7seg:

## Entrada y salida:
x: Entrada de 4 bits que representa el número a mostrar en el display.
a_to_g: Salida de 7 bits que controla los 7 segmentos del display.
Lógica de conversión:
Utiliza una estructura case para convertir el valor de 4 bits (x) en una secuencia de 7 bits que corresponde a los segmentos del display de 7 segmentos. En un display de 7 segmentos, los bits representan los segmentos a a g (de arriba a abajo, de izquierda a derecha).
Cada número (del 0 al 9) y las letras hexadecimales (del A al F) tienen un patrón específico de encendido y apagado de segmentos, representado como un valor de 7 bits.
La asignación de cada valor hexadecimal a los 7 segmentos sigue el estándar de mapeo para displays de 7 segmentos.
Detalles de la conversión de los números:
Cada número hexadecimal (0-9, A-F) tiene su propio patrón de 7 segmentos en el display. A continuación, te muestro cómo se representa cada valor:

0: 7'b0000001 → Todos los segmentos encendidos excepto el segmento 'g'.
1: 7'b1001111 → Solo los segmentos 'b' y 'c' están encendidos.
2: 7'b0010010 → Se encienden los segmentos 'a', 'b', 'd', 'e', y 'g'.
3: 7'b0000110 → Se encienden los segmentos 'a', 'b', 'c', 'd', y 'g'.
4: 7'b1001100 → Se encienden los segmentos 'b', 'c', 'f', 'g'.
5: 7'b0100100 → Se encienden los segmentos 'a', 'c', 'd', 'f', 'g'.
6: 7'b0100000 → Se encienden los segmentos 'a', 'c', 'd', 'e', 'f', 'g'.
7: 7'b0001111 → Se encienden los segmentos 'a', 'b', 'c'.
8: 7'b0000000 → Todos los segmentos encendidos.
9: 7'b0000100 → Se encienden todos los segmentos excepto 'e'.
A: 7'b0001000 → Se encienden los segmentos 'a', 'b', 'c', 'e', 'f', 'g'.
B: 7'b1100000 → Se encienden los segmentos 'c', 'd', 'e', 'f', 'g'.
C: 7'b0110001 → Se encienden los segmentos 'a', 'd', 'e', 'f'.
D: 7'b1000010 → Se encienden los segmentos 'b', 'c', 'd', 'e', 'g'.
E: 7'b0110000 → Se encienden los segmentos 'a', 'd', 'e', 'f', 'g'.
F: 7'b0111000 → Se encienden los segmentos 'a', 'e', 'f', 'g'.

### Flujo del Sistema:
El valor de los interruptores (sw, que es un valor de 4 bits) se pasa al módulo hex7seg.
El módulo hex7seg interpreta el valor de sw y determina qué segmentos deben encenderse, generando una señal de 7 bits (a_to_g) que controla los segmentos del display.
El valor de a_to_g se envía al display de 7 segmentos, mostrando el número correspondiente.
Solo el primer dígito del display de 7 segmentos está activo, porque el valor de an es 8'b11111110, donde el bit correspondiente a los dígitos está a 0 para encenderlo.