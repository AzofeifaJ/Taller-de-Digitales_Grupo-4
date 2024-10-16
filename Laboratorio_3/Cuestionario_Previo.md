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

**Pregunta 4:**  Investigue sobre el uso de memorias RAM y ROM en FPGA. Tanto memorias internas como
 externas en la FPGA.


# Referencias para la investigación previa.
[1]	“RISC-V, código abierto para transformar radicalmente la industria de los chips,” MIT Technology Review, 01-Jan-1970. [Online]. Available: https://www.technologyreview.es/s/15050/risc-v-codigo-abierto-para-transformar-radicalmente-la-industria-de-los-chips. [Accessed: 16-Oct-2024].
[2]	Isaac, “RISC-V: toda la información de la arquitectura,” Profesional Review, 22-Apr-2022. [Online]. Available: https://www.profesionalreview.com/2022/04/22/risc-v/. [Accessed: 16-Oct-2024].
[3]	C. G. Valenzuela, “Qué es RISC-V y por qué promete revolucionar el sector de los procesadores,” Computer Hoy, 11-May-2024. [Online]. Available: https://computerhoy.20minutos.es/tecnologia/risc-v-promete-revolucionar-sector-procesadores-1384044. [Accessed: 16-Oct-2024].
[4]	ComputerHoy.com, “¿qué es RISC-V?” [Online]. Available: https://www.youtube.com/watch?v=wg3j35gQ71k. [Accessed: 16-Oct-2024].
[5]	R. Sene and RISC-V Community News, “RISC-V international RISC-V: The open standard RISC instruction set architecture,” Riscv.org. [Online]. Available: https://riscv.org/. [Accessed: 16-Oct-2024].

# Referencias para la aplicacion practica del proyecto. 