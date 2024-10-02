###  Ejercicio 3- Interfaz Serial Asíncrona

 Este protocolo se ha utilizado por décadas para la comunicación entre sistemas. En este laboratorio
 estaremos desarrollando una interfaz UART (Universal Asynchronous Receiver/Transmitter). Con
 el bloque aquí desarrollado, la FPGA podrá comunicarse de forma bidireccional con otros sistemas
 de procesamiento (por ejemplo, un computador personal).

1. Para implementar la interfaz UART puede hacer uso de un código encontrado en algún
 repositorio cuya licencia sea libre. La integración y funcionamiento de dicho módulo corre
 por su cuenta.
2. Debe elaborar un set de pruebas para asegurar que dicho módulo UART funciona correcta
mente.
3.  La interfaz UART a desarrollar debe ser capaz de manejar el protocolo serial bidireccional
 a una velocidad de 9600 baudios.
4. Desarrolle un bloque de pruebas apropiado que permita enviar a una computadora personal
 valores introducidos por el teclado desarrollado en el ejercicio 2. Adicionalmente, la prueba
 debe mostrar en los LEDs datos recibidos desde dicha computadora. En la figura 3 se ilustra
 el diagrama de bloques ideal para la prueba en físico. 
5. Debe al menos elaborar una simulación de integración total de todos los bloques que haya
 elaborado: teclado, LEDs y UART.

## Planteamiento del problema
La idea en este problema es implementar el problema 2, demanera que podamos tener una comunicacion entre la computadora y la FPGA, en este caso la tang nano 9k, por lo cual realizamos una busqueda de un protocolo de interfaz serial asíncrona (UART).
Apartir de aqui, suponiendo que la parte dos sirve podemos establecer una serie de pruebas donde por medio del teclado mandamos a la computadora el valor, y este se ve reflejado en la pantalla, y vicerversa si por medio del teclado de la computadora enviar una información a la tarjeta para que de una representación.  
Por otra parte debemos de realizar los calculos para la tasa de baudios, los cuales corresponde a la cantidad de bits tramitidos por sengundo. Como se determino en el enunciado tenenmos una tasa de 9600 baudios, por lo cual si calculamos el tiempo es de: Tiempo de tramision de bits=1/9600=104.17μs. 
Como sabemos el periodo de timepo de una FPGA en nuestro caso la tang nano 9k, es muy superior por lo cual debemos de aplicar una division de frecuencia de 27MHz por lo cual un factor de division es de: Factor de división=27000000/9600=2812.5 

De esta manera aplicamos tres codigos estraidos de un [repositorio de Github](https://github.com/MuhammadMajiid/UART?tab=readme-ov-file) para aplicar una tramnsmiscion, una recepción y una manera bidireccional que es la que deberíamos de aplicar en este problema.
## Codigo  Módulo uart_tx (Transmisor)
![Modulo Tx](https://github.com/AzofeifaJ/Taller-de-Digitales_Grupo-4/blob/main/Laboratorio_2/Imagenes_y_videos/UART_Tx.png)
En este módulo la se tiene una señal bandera de lectura donde esta hace que el dódulo lea la señal de entrada por medio de la revisión de cada cierta cantidad de baudios hata poder leer el número de n bits que se ingresó, una ve finalizado esto se envía una señal de bandera que desactiva la lectura indicando directamente que ya se leyó el dato recibido.
## Módulo uart_rx (Receptor)
[]()
## Módulo UART bidireccional (Integración)
[]()
## Implementación en tarjeta. 
Ya por ultimo esta parte se demostrara como se aplica a la esta comunicacion entre la computadora y la FPGA, de manera que se desarrollo tres pruebas a realizar.
# Envio de comunicacion del teclado a la computadora

# Envio de comunicación del PC al set de luces ledes en la FPGA
