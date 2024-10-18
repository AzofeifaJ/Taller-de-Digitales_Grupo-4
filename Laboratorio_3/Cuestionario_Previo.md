# Lab. 3: Microcontrolador
## Cuestionario Previo

**Pregunta 1:**  Investigue sobre la arquitectura RISC-V. Preste especial atención a las instrucciones que
 forman parte del conjunto básico de instrucciones para números enteros de 32 bits, RV32I.
### ¿Que es la arquitectura RISC-v?
Es un conjunto de normas de diseños, como Bluetooth para los chips de ordenador. Esto se conoce como estándar abierto. Lo 
cual es puede participar en el desarrollo de esos estándares.
En su versión más básica de RISC-V consta de 47 instrucciones, como comandos para sacar un número de la memoria y 
sumar números. Pero también se tiene más bibliotecas de instrucciones, extensiones que permiten agregar funciones como vectores y algoritmos más avanzados como la inteligencia artificial.
Por otra parte se puede establecer que es una nueva evolucion ya que emplea nuevos diseños de ISA. Las cuales actualiza 
las nuevas formas de arquiteturas. 
Donde las instruciones ISA es una especificación detallada de todas las intrucciones desde la aritmetricas 
hasata controles, también pueden ser de varios tipos, más extendidios como CISC o RISC.
Ya por ultimo la arquitectura RISC-V promete revolucionar el sectrode los procesadores, debido a su principal caracteristicas que es su código abierto
por lo cual cuaquier persona puede usarla, verla y adeptarla según sus necesisdades y gusto de la arquiteturas de procesador, pero tiene la vista en empresas como intel
o ARM.
Otros beneficios y aplicaciones de RISC-V, son que posee dispositivos pequeños como wearables y conectados como smartwaches con mucha flexibilidad.
En el campo de microcontrolador se espande a nuevos servidores, superordenadores y centros de datos personalizados. Por lo cual 
es una arquitectura perfecta en todo tipo de campos por su eficiencia, adaptabilidad y seguridad. 
###  Instrucciones que forman parte del conjunto básico de instrucciones para números enteros de 32 bits, RV32I.
Pasamos a la arquitectura de conjunto de instrucciones ISA en código abierto, como se establecio anteriormente por lo cual nos centramos en sus instruciones principales de RV321.
Lo primero que debemos análizar las instrucciones de carga y almacenamiento las cuales son Load y Store, las cuales permiten transderir datos entre la memoria y los registros del procesador,
donde las operaciones aritmétricas y lógicas solo se realizan entre los regitros de memoria. Por lo cual tenemos:
Load donde encotramos ejemplos como lw,lh,lb, entre otros, por lo cual su funciones es carfar un valor desde la memoria a un registro.
Store donde encotramos ejemplos como sw,sh,sb. Que se encarga de guardar los valores de un regitro en la memoria. 
Recordemos que estas instruciones son de 32 bits en memoria, direccionada por un resgitro rs1 en un registro denominado rd.

### Instrucciones aritmetricas y lógicas
También encontramos instrucciones del campo matematicos o de lógica en los registros, donde podemos encontrar intruciones como:
*ADD/SUB:* funciones de suma y resta.
*AND,OR,XOR:* operaciones lógicas entre dos registros. 
*SHIFT:* Operaciones de desplazamiento de bits. 
*Instrucciones de comparaciones:* funciones para comparar dos registros y almacenamiento el resultado en un registro. 
*Instrucciones de control de flujo:* permite la manipulación de flujo de ejecución del procesador mediante saltos con condicionales o sin ellas. 
Aqui se puede encontrar funciones conocidas como:
*BNE:* salta si dos registros no son iguales.
*JAL:* Salto incodicional que almacenamiento a una dirrección de retorno en un registro.
*Instrucciones de manejo de registro:* Encontramos conocidos como:
*LUI:* Carga una constante de 20 bits en un registro alto.
*AUIPC:* Carga un valor inmediato en el registro después de sumarlo al contador del procesador. 
*Instrucciones de sistema:* estas son las cuales se maneja las interacciones con el sistema operativo de la arquitectura. Encotramos intruciones 
como:
*ECALL:* una llamada al sitema (system call), usada para interactuar con el sistema operativo. 
*EBREAK:* genera una interrupción de depuración.

### Formato de instrucciones
Por ultimo tenemos un conjunto de formatos de instrucciones codificados de manera eficiente en RV321 tenemos:
*R-type:* Operaciones aritmetricas y lógicas.
*I-type:* Operaciones inmediatas o de carga de memoria.
*S-type:* Instruciones de almacenamiento.
*B-type:* Instrucciones de rama.
*U-type:* Instrucciones para valores grandes.
*J-type:* Saltos incodicionales. 

Por lo cuál es un conjunto básico, sabiendo a donde se encuetra esta arquitectura en la actualidad, 
pero podemos ver que las instruciones RV321 es fundamental en RISC-V, proporcionando todas las herramientas
necesarias para la manipulación de datos enteros y control de flujo en sistemas de 32 bits. 
Permitiendo que su simplicidad, eficiencia y flexibilidad de la arquitectura, prmitiendo nuevos diseños y agregando la personalización
de la herramienta ISA ampliando está área y su uso. 

**Pregunta 2:** Investigue que es un toolchain para desarrollo de software empotrado (embedded).

**Pregunta 3:** Investigue como se elabora un mapa de memoria de un procesador.
 Un mapa de memoria se hace con el fin de poder diseñar y entender cómo un procesador interactúa con la memoria en un sistema, éste define ñas direcciones y diferentes bloques de memoria. 
 Para poder crear uno de estos mapas de memoria primeramente debemos definir el tamaño del bus de dirreciones, en este caso será de 32 bits, esto nos dice cuántas direcciones úede acceder el procesador.
 Lo segundo a tener en cuenta es asignar las regiones de memora, en qué rango de direcciones estará la memoria RAM, la memoria ROM y los dispositivos periféricos. Algunos periféricos requieren acceso directo a la memoria, lo que puede implicar reservar ciertas áreas del espacio de direcciones para dichos dispositivos. El acceso a periféricos como puertos de E/S o controladores de gráficos se realiza en ubicaciones específicas del mapa de memoria.
 Tercero, es organizar de manera jerárquica por medio de tablas, para poder indicarel rango de direcciones correspondiente a cada dispoitivo o bloque de memoria.
Tomado de [6]

**Pregunta 4:**  Investigue sobre el uso de memorias RAM y ROM en FPGA. Tanto memorias internas como
 externas en la FPGA.
 1. Memoria RAM interna en FPGA
Las FPGAs incluyen bloques de memoria interna (a menudo denominados "Block RAM" o BRAM), que son bancos de memoria RAM embebidos en el chip de la FPGA. Estas memorias se utilizan para el almacenamiento temporal de datos, buffers, o como memorias de acceso rápido durante la ejecución de aplicaciones.

Características: Las memorias RAM internas suelen ser SRAM (Static RAM), lo que les permite acceso rápido y síncrono a los datos. Son muy útiles para almacenar datos de alta velocidad necesarios en procesamiento paralelo o en aplicaciones que requieren alta eficiencia en el manejo de datos.

Ventajas:

Baja latencia, ya que están embebidas en la FPGA.
Alta velocidad de acceso.
Ideal para aplicaciones donde se necesita un almacenamiento temporal rápido, como en el procesamiento de señales o de imágenes.
Limitaciones:

Tamaño limitado en comparación con las memorias externas, ya que el espacio dentro de la FPGA es finito.

 2. Memoria ROM interna en FPGA
La memoria ROM (Read-Only Memory) interna en las FPGAs se utiliza para almacenar datos permanentes o configuraciones que no cambian durante la operación. En muchas aplicaciones, se utiliza ROM para almacenar tablas de búsqueda (Look-Up Tables, LUTs) o microcódigos.

Características: En las FPGAs, las ROM internas pueden ser implementadas a partir de las LUTs programables o como parte de los bloques de memoria dedicados. La programación de estas memorias se realiza durante la configuración de la FPGA.

Aplicaciones: Ideal para el almacenamiento de datos constantes, como tablas de coeficientes para procesamiento de señales o configuraciones iniciales.

 3. Memoria RAM externa en FPGA
Para aplicaciones que requieren grandes volúmenes de almacenamiento, las FPGAs pueden conectarse a memorias RAM externas, como DRAM (Dynamic RAM) o SRAM externas. Estas memorias se utilizan cuando la cantidad de datos supera la capacidad de los bloques de RAM internos.

Características:

DRAM externa es más lenta que la SRAM interna, pero ofrece mayor capacidad.
Las FPGAs modernas incluyen controladores de memoria dedicados que permiten conectarse a memorias DRAM de alta velocidad (como DDR3 o DDR4), lo que facilita la expansión de la memoria disponible.
Aplicaciones:

Procesamiento de video y gráficos.
Aplicaciones donde se requiere un gran buffer de datos, como redes o grandes matrices de procesamiento.

 4. Memoria ROM externa en FPGA
Las memorias ROM externas, como EEPROM o Flash, se utilizan principalmente para almacenar el archivo de configuración (bitstream) que configura la FPGA durante el encendido. Una vez que la FPGA está configurada, la memoria ROM externa se puede utilizar para almacenar firmware u otros datos necesarios para la operación de la FPGA.

Características:

La ROM externa se utiliza para cargar la configuración inicial de la FPGA (bitstream).
También puede almacenar datos no volátiles o códigos de inicialización.
Aplicaciones:

Configuración y arranque de la FPGA.
Almacenamiento de datos de calibración o configuraciones de usuario.
Tomado de [7]

# Referencias para la investigación previa.
[1]	“RISC-V, código abierto para transformar radicalmente la industria de los chips,” MIT Technology Review, 01-Jan-1970. [Online]. Available: https://www.technologyreview.es/s/15050/risc-v-codigo-abierto-para-transformar-radicalmente-la-industria-de-los-chips. [Accessed: 16-Oct-2024].
[2]	Isaac, “RISC-V: toda la información de la arquitectura,” Profesional Review, 22-Apr-2022. [Online]. Available: https://www.profesionalreview.com/2022/04/22/risc-v/. [Accessed: 16-Oct-2024].
[3]	C. G. Valenzuela, “Qué es RISC-V y por qué promete revolucionar el sector de los procesadores,” Computer Hoy, 11-May-2024. [Online]. Available: https://computerhoy.20minutos.es/tecnologia/risc-v-promete-revolucionar-sector-procesadores-1384044. [Accessed: 16-Oct-2024].
[4]	ComputerHoy.com, “¿qué es RISC-V?” [Online]. Available: https://www.youtube.com/watch?v=wg3j35gQ71k. [Accessed: 16-Oct-2024].
[5]	R. Sene and RISC-V Community News, “RISC-V international RISC-V: The open standard RISC instruction set architecture,” Riscv.org. [Online]. Available: https://riscv.org/. [Accessed: 16-Oct-2024].
[6] J. L. Hennessy y D. A. Patterson, Computer Architecture: A Quantitative Approach, 6th ed., Morgan Kaufmann, 2018.
[7] M. J. Wirthlin, "High-Reliability FPGA-Based Systems: Space, Radiation, and Beyond," Proceedings of the IEEE, vol. 103, no. 3, pp. 379-389, March 2015.







# Referencias para la aplicacion practica del proyecto. 
