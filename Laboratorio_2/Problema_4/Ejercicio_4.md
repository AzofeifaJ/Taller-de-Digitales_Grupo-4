###  Ejercicio 4- Interfaz Serial Síncrona
El Serial Peripheral Interface (SPI) es un protocolo de comunicación serie, síncrono, basado en
 una arquitectura maestro-esclavo o principal-secundario. Este protocolo se utiliza comúnmente
 para comunicar un juego de dispositivos periféricos (esclavos) con uno central (maestro). En esta
 parte del laboratorio, usted desarrollará una interfaz SPI maestro la cual permitirá comunicar el
 sistema en el FPGA con dispositivos externos, en este caso la pantalla LCD.

1.  Para implementar la interfaz SPI puede hacer uso de un código de un tercero en donde se
 cumplan los mismos requisitos de licencia del ejercicio anterior.
2.  Se debe prestar atención como utilizar el SPI para programar una secuencia de transferencia
 de datos. Elabore una simulación en dónde se compruebe que el módulo SPI escogido cumpla
 el protocolo para un único dispositivo.
3.  Con base a la hoja de datos del controlador ST7789V, elabore un procedimiento de configu
ración para programar la LCD. Puede basarse en alguna biblioteca de Arduino o del ejemplo
 encontrado en https://github.com/sipeed/TangNano-9K-example/tree/main/spi_
 lcd. Se debe documentar cada instrucci´ on del LCD enviada por SPI.
4. Con base a la ilustración de la figura 4, elabore un diseño donde desde el computador se
 escoge dos posibles configuraciones de patrón de color. Cada configuración de color va a
 tomar únicamente dos posibles colores; P1:Rojo y P2:Azul como configuración 1, y P1:Verde
 y P2:Azul como configuración 2 por ejemplo. A partir de estos dos colores se pintará una
 grilla de colores en pantalla ante el accionar del teclado de la laptop. Debe ser posible
 alternar entre cada configuraci´ on una vez inicializada el LCD.
![Figura](https://github.com/AzofeifaJ/Taller-de-Digitales_Grupo-4/blob/main/Laboratorio_2/Imagenes_y_videos/figura.png)

## Planteamiento del problema
Para este caso se investigo como es el código para activar la pantalla que trae la FPGA Tang nano 9k, por lo cual hicimos uso de las practicas del tutorial de LUSHAY Labs, donde se enciende la pantalla con un color. A partir de aquí debemos de implementar el SPI para desarrollar la comunicación entre la computadora y la FPGA.

## Implementación en tarjeta. 
Se debe de establecer una comunicación entre la computadora y la FPGA, la cual por el momento presenta problemas. 


