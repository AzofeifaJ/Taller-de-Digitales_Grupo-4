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
Para este caso se transimite, de acuerdo al problema 3 9600 bps, por lo cual el receptor va a recibir un inicio con el MSB en cero, de acuerdo que apartir de aquí recibimos la cantidad de bits que queremos transmitir esto de acuerdo a la lógica de la UART_RX y la UART_TX ya que hay se hibridad se puede transmitir o enviar desde la tang nano 9k al computador o viceversa. Pero en este caso lo que queremos es que se transimita a la pantalla LCD, para que está cambie de color entre azul y verde la presionar una tecla del teclado. De manera que sea la computadora la que decida como debe ser lo que transmite la Tang Nano 9k. Por ultimo al implemtar el sistema de sincronización y antirebote del problema 1, este tendra una duracion de 104.6 us entre cada disparo de pulso, demanera que haci se evite señales contaminadas a las señales dadas por la computador y recibidas por la tarjeta. 

## Pruebas 
Para esta aparto se realizo una prueba utilizando la herramienta de Vivado, por medio de un testbench para conocer como actua el codigo en la FPGA. 
![Figura](C:\Users\chisc\Downloads\GitHub\Laboratorio-1_Taller-de-Digitales_Grupo-4\Laboratorio_2\Imagenes_y_videos\tesbecnch codigo externo.png)
Como se puede denotar las pruebas al incio al contener un codigo fuente externo nos presento muchas salidas y otras donde el propio progrma no determinanba como demeria de ser la señal por lo cual se tuvo que reeditar el codigo para obtener una señal en el testbech más clara del problema. 
![figura](tb actualizado.png)
Como se puede apresiar en este codigo podemos de terminar el como funciona la interesación de la pantalla con la FPGA y calramente como este actua con la computadora a través de un SPI. De manera que tenemos más claro como continuar con el problema 4. 


## Implementación en tarjeta. 
Se debe de establecer una comunicación entre la computadora y la FPGA, la cual por el momento presenta problemas. 

En esta parte establecimos lo dos colores azul y verde en la pantalla para ya defienir como se debe de interactuar con ellos. 

En esta parte establecimos una comunicación directa entre la computadora y la FPGA para que varie los colores de la pantalla para este caso podemos ver que la tarjeta dectetaba otro color el rojo, por lo cual daba el color azul seguido de una pantalla negra la cual segun el codiogo deberia se la verde y una pantalla rojo, por lo cual la interación esta correcta pero se debe de determinar los colores para que no se sobreponga otros. 
Por ultimo se intento establecer que por medio del teclado se cambiaran los colores pero en este caso solo se tiene una pantalla blanca donde no hay cambio de estos. 

