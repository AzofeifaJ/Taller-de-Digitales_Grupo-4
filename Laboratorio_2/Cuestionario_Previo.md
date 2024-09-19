### Cuestionario Previo Laboratorio 2
 ## 1. Investigue sobre el funcionamiento de máquinas de estado finitos. Explique la diferencia entre una máquina de Moore y una de Mealy, y muestre la diferencia por medio de diagramas de estados y señales.
 Respuesta: Una maquina de finitos son modelos matemáticos que representa sustemas con un número finitios de estados. Utilizados en el diseño de sistemas digitales como pseudocodigo antes de generear los circuitos. [1] Su estructura básica se compone de un estado donde se crean las condiciones del sitema, las transiciones que son los caminos entre estados, entradas, salidas del sistema y en muchos casos un estado inicial default como lo puede ser un reset para evitar bucles infinitos en ele sistema. Se clasifican en dos Maquinas de Moore y Maquinas de Mealy.
 En el caso de una maquina de Moore las salidas dependen unicamente del estado actual, es decir que la salida está asociada con cada estado individual y se realiza un cambio hasta pasar por la transicion al siguiente estado.
 Para la máquina de Mealy las salidas depende tanto del estado actual como  delas entradas. Se puede realiza un cambio en la respuesta de una entraad sin necesidad de que el sistema haga una transiscion a un siguiente estado. 
 # Ejemplos de diagrama de bloque de una máquina Moore
 ![Maquina de MOORE](https://github.com/AzofeifaJ/Taller-de-Digitales_Grupo-4/blob/main/Laboratorio_2/Imagenes_y_videos/Ejemplo%20maquna%20de%20MOORE.png)
 # Ejemplos de diagrama de bloques de una máquina Mealy
 ![Maquina de MEALY](https://github.com/AzofeifaJ/Taller-de-Digitales_Grupo-4/blob/main/Laboratorio_2/Imagenes_y_videos/Ejemplo%20maquina%20de%20MEALY.png)


 ## 2. Explique los conceptos de setup time y hold time. ¿Qué importancia tienen en el diseño de sistemas digitales?
 Respuesta: En circuitos digitales siempre se tiene un periodo para cada elemento deseado a realizar, en muchos casos este periodo se da a través de un reloj, circuitos como los flip-flops deben de tener dos conceptos para evitar que las tareas se realizacen de forma aleatoria o que se sobreponga una tarea 1 a una tarea 2. Estos conceptos son los setup time, el tiempo para configuracion y un tiempo de espera o en ingles hold time, estos conceptos son cruciales para garantizar el funcionamiento correcto del sistema. Claro esta que se diferencia del reloj ya que estos son temporales durante un estado del flip-flop, dando un tiempo para que capture y almacene datos más precisos y exactos. 
 Si nos vamos más especificos a los conceptos para el Setup es el intervalo de tiempo durante el cual la señal de entrada debe permanescer estable antes de que se poduzca el flaco alto del reloj, este periodo se utiliza en circuitos como los flip-flop para capturar datos en sus entradas. De ahí recae la importancia ya que este periodo debe ser adecuado para garantizar que el circuito lee y almacena la entrada recibida antes de pasar a otro estado. Este periodo se debe calcaular de acuerdo al periodo del reloj de manera que no quede muy cercano al flanco de cambio de este. 
 Para el caso de Hold Time este periodo de tiempo donde la señal de entrada debe permanecer estable despues de realizar un cambio, se da durante el flaco bajo del reloj de manera que le da el tiempo al setup de capturar la información y almacenarla. Su importancia va desde asegurar que el circuito recoleta el dato de manera correcta, demanera que genera una estabilidad de datos y evita la aparición de errores. Claro está si los tiempos no son calculados correctamente estas violaciones de presión y exactitud se puede precentar. [2]


 ## 3. Explique los conceptos de tiempos de propagación y tiempos de contaminación en circuitos combinacionales. Investigue sobre la ruta crítica y cómo esta afecta en el diseño de sistemas digitales complejos; por ejemplo, un procesador con pipeline. Investigue su relación con la frecuencia máxima de operación de un circuito.
 Respuesta: Primero definimos que son los tiempos de propagación este es conocido como un Delay de tiempo, es el periodo de tiempo que tarda en transitar una señal de entrada hasta la salida de un estado, como lo puede ser un componente combinacional. Este retraso entre la salida y entrada se va aumentado al agregar estados en el sistema, variando la velocidades del circuito en su operación. Para el caso de los tiempos de contaminación este se refieren al tiempo minímo requerido para que una señal de salida comience a variar después de que se da la variación en la señal de entrada, es decir corresponde a el periodo que tarda en dectetar la señal de salida un cambio en la entrada. Este periodo se debe de monitoriar ya que el no tener un control sobre este periodo puede dar una inestabilidad del sistema, se recomienda un periodo bajo para asegurar que el circuito pueda respoinder a los cambios de estado sin mucho tiempo de propagación en la salida.
 Por otra parte la Ruta crítica se define como la secuencia más larga de elementos combinacionales a través de los cuales debe de pasar o propagarse una señal desde la entrada hasta alguna de sus salidas en el sistema. Esta ruta es una de las más largas en tiempos que debe realizar el circuito, su importancia recae en que está determina la frecuencia máxima del circuito puede operar, según el reloj del sistema, donde se este debe ser menor frecuencia que la maxima, para una establización de señales antes del siguiente flanco del reloj.Este concepto también nos da una forma de conocer como podemos optimizar el sistema, de manera que se reduce el tiempo en la ruta haciendo que se mejore el rendimiento de este. 
 Si tomamos un ejemplo con un procesador con Pipeline, el cual es una arquitetura que permite la ejecución del múltiples instruciones/tareas en un mismo periodo de reloj en el sistema por medio de distintas etapas de procesamiento. Por lo cual su relacion con la frecuencia máxima es ideal ya que se optimizamos el sistema demanera que se redusca la frecuencia este podra realizar las diferente rutas de instruciones de manera más rapida aceleradon las salidas del circuito. Y también al tener una ruta critica más corta evitara el conflito entre las diferentes tareas, ya que dentro de la arquitetura estas tendran un tiempo de porpagacion que permite al procesar ejecutarse dentro de los tiempos antes de ser afectado por el reloj como vimos en la pregunta 2. 

 ## 4. Investigue sobre las mejores prácticas para la asignación de relojes y división de frecuencia en FPGAs. En este apartado hagá enfasis en el uso de las entradas habilitadoras de reloj (clock enables) presentes en las celdas de la FPGA, para lograr tener tiempos de ejecución diferentes a lo largo del sistema mientras se utiliza un solo reloj.
 Respuesta: Para asignar a los relojes de manera que respecte las divisiones de la frecuencias en FPGAs, se deben de realizar en el disño del circuito de manera que se tenga una optimización máxima de este ya que nesesitamos que el sistema sea lo más eficiente y para llegar a los periodos de  tiempo. Está mejoras van de la mano del reloj dentro del conceto de clock enables [3], los cuales se encargan de que los modulos digitales tenga un control sobre sus instruciones en cada flanco del reloj evitando el consumo de energía inesesario. Dentro de las mejoras que podemos hacer es el uso de un reloj globla, directo a la FPGA para distribur señales del mismo reloj pero a diferentes paretes del diseño, estas redes por asi llamarlas minimizan el retardo y asegura que el reloj tenga un cordinacion entre todas las terminales sin introducir retrasos. La frecuencia también se pude tratar por medio de contadores y divisores que generen señales de relog con frecuencias más bajas a partir de una señal de reloj de alta frecuencia. Utilizado en circuitos de secuencias de varias etapas. Los divisares son para determinar frecuencias adecuadas en las terminales ya que en un sistema complejo no se trabaja todas las etapas con una misma frecuencia sino que esta varia, esto ayuda a evitar problemas en las instruciones ya que las frecuencias llegan en su rango directo a las terminales. Por ultimo también se puede implementar el habilitadores de reloj para estas permite activar o desaticar el reloj global en bloques especificos dentro de una FPGA. De manera que se controlan las operaciones de los módulos dentro del sistema, evitando consumo inesesario y tener un control especifico en las diferentes etapas del circuito. 
 # Ejemplo en un codgio de system verilog
 always_ff @(posedge clk) begin
    if (clk_enable) begin
        // Lógica del módulo
        data_out <= data_in + 1;
    end
end
Podemos ver que recibimos una señal de reloj global, una señal de habilitacion de reloj para control de ejecucion donde por medio de un bloque always se ejecuta una lógica secuencial a corde al flanco deseado. El flanco deseado en este caso ejecuta la instrución solo si clk_enable esta en valor alto. De lo contrario permanece en el estado. 
 

## 5. Investigue sobre el fenómeno de rebotes y ruido en pulsadores e interruptores. Defina qué técnicas digitales (circuitos) se utilizan para cancelar este fenómeno. Además, investigue sobre los problemas de metastabilidad cuando se tienen entradas asíncronas en circuitos digitales. Finalmente, presente circuitos que permitan la sincronización de entradas como pulsadores e interruptores.
 Respuesta: El rebote y el ruido en pulsadores e interruptores son problemas comunes en sistemas digitales. Cuando se presiona un pulsador, los contactos mecánicos no se estabilizan de inmediato, generando múltiples transiciones antes de alcanzar un estado estable, lo que se conoce como rebote. Además, el ruido, causado por interferencias electromagnéticas o fluctuaciones eléctricas, puede producir falsos cambios en la señal, afectando la precisión del sistema. [6]

Para mitigar estos problemas, existen varias técnicas. Una solución común es el debouncing por software, donde se espera un breve período (10-20 ms) después de detectar un cambio en la señal antes de confirmarlo. Esto asegura que la señal se estabilice y evita la detección de múltiples transiciones no deseadas. En cuanto al debouncing por hardware, se puede utilizar una red RC (resistencia y capacitor) para suavizar los cambios rápidos o un flip-flop que almacena el último estado estable de la señal, ignorando los rebotes. Otra opción es el uso de Schmitt Triggers, que requieren un cambio más significativo en la señal para alterarla, eliminando pequeñas fluctuaciones y asegurando una señal más limpia. [6]

Los problemas de metastabilidad ocurren cuando una señal asíncrona, como la de un pulsador, se introduce en un sistema digital sincronizado. Si la señal cambia cerca del borde de una transición de reloj, puede quedar en un estado inestable, lo que genera comportamientos impredecibles. Para evitar la metastabilidad, se emplean flip-flops en serie: el primero captura la señal asíncrona, mientras que el segundo la estabiliza antes de que sea procesada. En aplicaciones más críticas, se pueden usar tres flip-flops para garantizar una mayor estabilidad de la señal. [6]


Circuito de sincronizador simple [7]:![syncroreco](https://github.com/user-attachments/assets/76a8c2ec-7f65-404e-b18f-4355791f092c)




Circuito de sincronizador multi-cycle [7]: ![syncromulti](https://github.com/user-attachments/assets/1a3e011f-f0b2-4a23-8053-e675970c0feb)




Circuito de sincronizador en cascada [7]: ![syncrocascade](https://github.com/user-attachments/assets/7536f3eb-eae9-4d0f-a2b3-428472077423)



 ## 6. Investigue sobre la especificación de la interfaz SPI. Preste atención a los aspectos necesarios para poder diseñar un controlador maestro de SPI, adem´ as de los diferentes modos de SPI.
 Respuesta: La interfaz SPI (Serial Peripheral Interface) es un protocolo de comunicación comúnmente usado en sistemas digitales que permite al maestro intercambiar datos con dispositivos esclavos. En el diseño de un controlador maestro SPI, es esencial entender varios aspectos clave. [8]

SPI utiliza las señales SCLK (Serial Clock), MOSI (Master Out Slave In), MISO (Master In Slave Out) y SS/CS (Slave Select/Chip Select). El maestro genera el reloj (SCLK) que sincroniza la transferencia de datos, envía datos al esclavo a través de MOSI, recibe datos del esclavo a través de MISO, y selecciona el esclavo activo usando SS/CS. [8]

El reloj (SCLK) es fundamental para la comunicación, y su frecuencia debe ser compatible con los dispositivos esclavos. Además, el maestro debe gestionar la selección del esclavo usando la señal SS/CS para habilitar el dispositivo con el que quiere comunicarse. [8]

SPI opera en cuatro modos, determinados por la polaridad del reloj (CPOL) y la fase del reloj (CPHA) [8]:

-Modo 0: El reloj es bajo cuando está inactivo y los datos se muestrean en el flanco de subida del reloj.
-Modo 1: El reloj es bajo cuando está inactivo y los datos se muestrean en el flanco de bajada del reloj.
-Modo 2: El reloj es alto cuando está inactivo y los datos se muestrean en el flanco de bajada del reloj.
-Modo 3: El reloj es alto cuando está inactivo y los datos se muestrean en el flanco de subida del reloj.

Para diseñar un controlador maestro SPI, es importante manejar correctamente la generación del reloj, la selección del esclavo y la transferencia de datos. También se debe configurar el modo SPI apropiado para asegurar la compatibilidad con los dispositivos esclavos.
 
 ## 7. Investigue sobre la comunicación serie UART. Preste atención a las diferentes características de configuración necesarias para la comunicación serie mediante UART (por ejemplo, baud rate, paridad, etc). Además, investigue cómo puede utilizar puertos seriales en su computadora, considerando el sistema operativo que utilice.
 Respuesta: UART  hace referencia a un protocolo de comunicación serial que se utiliza para enviar y recibir datos entre dos dispositivos. UN dato diferenciador de este es que no requiere de un reloj para poder sincronizar la comunicación entre los dispositivos.
- Baud Rate: La velocidad de transmisión de datos.
Configuración: Ambos dispositivos deben tener la misma configuración de baud rate para poder comunicarse correctamente.
- Paridad: Un método de detección de errores.
Bits de Datos: La cantidad de bits en cada carácter de datos.
Bits de Parada: Bits adicionales enviados al final de cada byte para indicar el final del dato.
- Control de Flujo: Mecanismos para controlar el flujo de datos y evitar la pérdida de datos. En estos hay 2 vias: LA primera utiliza líneas adicionales como RTS (Request to Send) y CTS (Clear to Send) que es por medio del harware.Y la segunda utiliza caracteres especiales para controlar el flujo, como XON/XOFF. [4]
 Uso del puerto serial en Linux.
Los puertos seriales se representan como archivos de dispositivos, generalmente en /dev/ttyS* (para puertos seriales reales) o /dev/ttyUSB* (para dispositivos USB seriales). Para la configuración se utilizan comandos como stty para configurar los parámetros de la UART y herramientas como screen o minicom para abrir una comunicación serial. [5]


 ## 8. Investigue el funcionamiento básico del controlador ST7789V de la pantalla LCD RGB de la tang nano 9k. La hoja de datos será entregado por el profesor del curso.
 Respuesta: El controlador está diseñado para manejar pantallas de 240x320 píxeles y soporta RGB de 18 bits. El controlador permite dibujar píxeles, líneas, y formas directamente en la memoria de la pantalla. El usuario puede definir un área de ventana en la pantalla para actualizar solo esa región, lo que optimiza el rendimiento y minimiza el uso de ancho de banda usando el puerto SPI. [9]


 ### Bibliografía
 1. M. Alavi, S. Aliaga, and M. Murga, "Máquinas de Estado Finito," *Revista de Investigación Estudiantil Iluminate*, vol. 8, pp. 41, 2016.
 2. Cadence PCB, "What is Setup and Hold Time," *Cadence Design Systems*, 2023. [Online]. Available: https://resources.pcb.cadence.com/blog/what-is-setup-and-hold-time. [Accessed: 04-Sep-2024].
 3. Intel Corporation, "Clock Enables on Logic," *Intel Corporation*, 2024. [Online]. Available: https://www.intel.com/content/www/us/en/docs/programmable/683174/24-1/clock-enables-on-logic.html. [Accessed: 04-Sep-2024].
 4. Texas Instruments, TMS320C6000 Chip Support Library API Reference Guide, SPRUGP1, Apr. 2010. [Online]. Available: https://www.ti.com/lit/ug/sprugp1/sprugp1.pdf. [Accessed: Sept. 06, 2024].
 5. TechNexion, Using UART from a Linux Shell, Sept. 2021. [Online]. Available: https://developer.technexion.com/docs/using-uart-from-a-linux-shell. [Accessed: Sept. 06, 2024].
 6. Tocci, R. J., & Widmer, N. S. (1994). Digital Systems: Principles and Applications. Prentice Hall.
 7. Wakerly, J. F. (1990). Digital design: Principles and practices. Prentice-Hall International.
 8. Digital Design and Computer Architecture. (2022). Elsevier. https://doi.org/10.1016/c2019-0-00213-0
 9. Sitronix, ST7789V Datasheet, [Online]. Available: https://www.alldatasheet.com/datasheet-pdf/view/1132511/SITRONIX/ST7789V.html. [Accessed: Sept. 06, 2024].
