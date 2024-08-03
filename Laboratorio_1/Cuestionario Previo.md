# Lab. 1: Introducción al diseño digital con HDL y herramientas EDA de síntesis
## Cuestionario Previo

**Pregunta 1:** Investigue las características de las familias TTL bajo las series 74∗xx en particular las
diferencias entre las variantes ∗ ∈ {L, LS y HC}
*Respuesta:* Se entiende como familia TTL a las conexiones lógicas  transistor transistor, si se especifica la serie 74xx, su principal característica es sus utilización en circuitos digitales ya que estos poseen una modulacion estandar, es decir un consumo de energía modulado, velocidad alta y si en los niveles binarios, su nivel bajo va de los 0 a los 0.8 voltios mientras en un nivel alto va de 2 a 5 voltios. Y a si nos centramos en sus variantes:
En el caso del 74Lxx conocido como bajo poder de TTL, este posee un consumo de energía por debajo de la serie estándar, tiene una de la velocidades más baja entre la familia TTL, pero se compensa con su margen en la asimilación del ruido. 
En el caso de 74LSxx conocido como bajo poder Schottky, su consumo de energía similar a la serie estándar, su velocidad se encuentra en un rango mayor a la serie L pero menor a la serie estándar, el nombre de Schottky se debe a su utilización de diodos, los cuales ayudan con la potencia de velocidad sin afectar el consumo de energía. 
Por último la serie 74HCxx por su nombre alta velocidad de CMOS, este posee uno de los consumos más bajo de la familia TTL, debido a la tecnología CMOS en sus circuitos, produciendo una alta velocidad, compatibilidad con otras series de la familia, por lo cual su utilización es ideal en sistemas modernos que requieran una velocidad y presión alta. 

**Pregunta 2:** Investigue las características de la familia CMOS 4000.
*Respuesta:* Algunas características son que se caracterizan por su notable bajo consumo de energía, ya que solo utilizan corriente durante los cambios de estado, lo que los hace muy eficientes. Además, ofrecen una alta inmunidad al ruido, lo cual es crucial para mantener la integridad de las señales en ambientes ruidosos. Pueden operar en un amplio rango de voltajes de alimentación, típicamente entre 3V y 15V, lo que les otorga una gran flexibilidad para diversas aplicaciones. Las entradas de estos circuitos tienen una alta impedancia, lo que minimiza la carga en las señales de entrada y permite conectar múltiples dispositivos sin afectar el rendimiento. También son compatibles con niveles lógicos TTL, lo que facilita su integración con otros tipos de circuitos. Además, estos dispositivos están diseñados para funcionar en un rango de temperaturas muy amplio, desde -55°C hasta +125°C, y cuentan con protección contra descargas electrostáticas, lo que los hace robustos y fiables en condiciones adversas.

**Pregunta 3:**
*Respuesta:*

**Pregunta 4:**  Investigue el significado de los parámetros:
*Respuesta:* 
1. V<sub>IL</sub>: su nombre entrada de voltaje bajo, denota al nivel de voltaje máximo que se deja entrar en un dispositivo para representar una lógica baja. 
2. V<sub>IH</sub>: Entrada alta de voltaje, este parámetro es la entrada  de voltaje máximo para denotar un valor de lógica alta, esta puede ser un voltaje de alimentación.
3. V<sub>OL</sub>: Salida de voltaje bajo, es el voltaje máximo en la salida, representado un cero lógico. 
4. VOH:Salida de voltaje alto, es el voltaje mínimo para que en la salida se entregue un estado lógico alto. 
5. I<sub>IK</sub>: Corriente máxima de lazo cerrado que fluye por el circuito en su entrada, específicamente en las entradas, cuando no se llega a un voltaje adecuado de operación o se tiene un nivel negativo.
6. I<sub>OK</sub>: Corriente máxima de lazo cerrado que fluye por el circuito en su salida, debido a que no se tiene un voltaje de salida dentro del rango permitido, como lo puede ser superior a Vcc o por debajo de GND. 

**Pregunta 5:** Investigue qué son los tiempos de propagación tP D, tP LH y tP HL y los tiempos de transición
tt, tr y tf.
*Respuesta:* Los tiempos de propagación y transición son esenciales para el desempeño de los circuitos CMOS. El tiempo de propagación (tP D) se refiere al tiempo que una señal tarda en viajar desde la entrada hasta la salida de un circuito lógico, generalmente medido al 50% del cambio de voltaje. Dentro de esto, encontramos el tiempo de propagación de bajo a alto (tP LH) y de alto a bajo (tP HL), que son los intervalos que una señal tarda en cambiar de un nivel bajo a uno alto, y viceversa. Estos tiempos se miden al 50% del cambio de voltaje de entrada y salida. Por otro lado, los tiempos de transición, como el tiempo de subida (tr) y el tiempo de bajada (tf), son cruciales para determinar la velocidad de cambio de estado de una señal. El tiempo de subida se mide desde el 10% al 90% del cambio de voltaje, mientras que el tiempo de bajada se mide desde el 90% al 10%. Estos parámetros son fundamentales para diseñar y simular circuitos CMOS que sean tanto eficientes como de alto rendimiento.

**Pregunta 6:**
*Respuesta:*

**Pregunta 7:** Para cada una de las variantes TTL y CMOS especifique en una tabla:
*Respuesta:*
### Rango de tensión eléctrica de alimentación VCC o VDD, VSS. 
| Parámetros | TTL74xx      | TTL74Lxx     | TTL74LSxx    | TTL74HCxx    | CMOS4000       |
|------------|--------------|--------------|--------------|--------------|-----------------|
| VCC (V)    | +4.75 a +5.10| +4.1 a +5    | +4.75 a +5.25| No usa       | No usa          |
| VDD (V)    | No usa       | No usa       | No usa       | +2.2 a +5.78 | +3.2 a +14.8    |
| VSS        | 0 (GND)      | 0 (GND)      | 0 (GND)      | 0 (GND)      | 0 (GND)         |

### Rango de tensiones de entrada y salida. 
| Parámetros | TTL74xx | TTL74Lxx | TTL74LSxx | TTL74HCxx | CMOS4000     |
|------------|---------|----------|-----------|-----------|--------------|
| VIL (V)    | <0.7   | <=0.8    | <0.8     | <0.3     | <=1.7        |
| VIH (V)    | >2.0   | >=2.0    | >2.0     | >=0.7    | >=3.3        |
| VOL (V)    | <=0.4   | <=0.4    | <=0.5     | <=0.4    | <0.5         |
| VOH (V)    | >=2.5   | >2.5     | >2.7     | -0.4     | >=4.5        |
| IIK (A)    | -0.02   | -0.025   | 0.010     | 0.02     | -0.000001 (max)|
| IOK (A)    | -0.025  | 0.025    | ±0.02     | 0.02     | ±0.01        |

### Tiempos de propagación y transmisión. 
| Parámetros        | TTL74xx | TTL74Lxx | TTL74LSxx | TTL74HCxx | CMOS4000 |
|-------------------|---------|----------|-----------|-----------|----------|
| tP D (ns)         | 10-16   | 15-25    | 4-10      | 5-15      | 10-50    |
| tt (ns)           | 10-15   | 15-20    | 4-10      | 5-15      | 10-50    |
| t subida o bajada (ns) | 5-10  | 8-15     | 2-6       | 2-6       | 5-20     |

**Pregunta 8:** Revise la hoja de datos de los circuitos integrados 74∗00,74∗02,74∗04,74∗14, 4001, 4011,
4069 y 40106. Resuma para qué sirve cada uno.

*Respuesta:* El 74xx00 es un IC que contiene cuatro puertas NAND, fundamentales para realizar operaciones lógicas básicas en los circuitos. Por otro lado, el 74xx02 tiene cuatro puertas NOR, que realizan la lógica opuesta a la puerta OR y son esenciales para construir circuitos lógicos. El 74xx04 es un hex inversor con seis puertas NOT, utilizado para invertir señales digitales y facilitar el diseño de circuitos complejos. El 74xx14 es un disparador Schmitt, que mejora la señal al limpiar las entradas ruidosas o lentas gracias a su histéresis. En la familia CMOS, el 4001 incluye cuatro puertas NOR, mientras que el 4011 tiene cuatro puertas NAND, ambos ofreciendo beneficios en términos de eficiencia energética y características CMOS. El 4069 es otro hex inversor, pero en tecnología CMOS, similar al 74xx04. Finalmente, el 40106 es un disparador Schmitt en CMOS, que, al igual que el 74xx14, usa histéresis para manejar mejor las señales ruidosas.

**Pregunta 9:**
*Respuesta:*

**Pregunta 10:** Investigue sobre el concepto y el uso de los circuitos pull-up y pull-down en electrónica digital.
*Respuesta:*
Pull-up: Los circuitos conocidos como pull-up son una configuración en las termianles de los transitores, en este caso en la terminal colector y la linea de la fuente de alimentación se comportan como una resitencia, de manera que se mantiene la señal en el estado lógico alto, es decir un uno lógico para la salida, si la fuente de alimentación se descontecta se comportará como un cero lógico pero es poco recomendado, ya que lo que se pretende es evitar ruido y flutaciones en el voltaje. 
Pull-down: si se desea un cero lógico en la salida, se utiliza la configuración pull-down, la cual esta en la terminal emisor conectada a tierra, de esta forma la señal dara como salida una tension baja cuando no está siendo activamente llevada a un estado alto. 

**Pregunta 11:** Investigue qué es un circuito disparador Schmitt (Schmitt trigger). Revise las características
técnicas del circuito 74∗14.
*Respuesta:* Los disparadores Schmitt, como el 74LS14, juegan un papel crucial en el diseño digital al convertir señales ruidosas o de transición lenta en señales digitales limpias. Estos circuitos usan una característica llamada histéresis, que establece dos niveles de umbral para las transiciones de señal: uno para pasar de bajo a alto y otro para ir de alto a bajo. Esto ayuda a filtrar el ruido y evita que la señal fluctúe innecesariamente. El 74LS14 es un buen ejemplo de este tipo de circuito. El cual fue diseñado para funcionar con un voltaje de 5V, ofrece tiempos de respuesta rápidos y es ideal para aplicaciones que necesitan señales digitales claras y confiables.

**Pregunta 12:**
*Respuesta:*

**Pregunta 13:** Investigue que es el efecto de rebote y típicos circuitos anti-rebote (debouncing circuits)
*Respuesta:* En el caso de un efecto rebote se determina cuando se activa o desativa un interrutor, produciendo una flutación de señales por un periodo de tiempo determinado hasta que dicha señal se estabilice. Si no se evita o se protege el circuito contra este efecto puede proboca lecturas erroneas en la salida o ruido en el sistema. Entre los circuitos anti-rebote podemos encontrar un circuito RC (el más simple), ya que solo necetita de una resitencia y un capacitor para suavizar o delimitar la señal al momento de activarse un interruptor. Para circuitos de mayor nivel se pueden usar un circuito Schmit Trigger, este procesa altas señales en caso de que la flutuación se muy exagerada para el sistema. Y por ultimo en casa de FMS, se utiliza un circuito Flip-Flop tipo D, este almacena la señal del interrutor y elmina el rebote, para luego dar la señal ya estabilizada al sistema. 

**Pregunta 14:** Explique qué es el modelado de comportamiento y de estructura en diseño digital. Brinde
un ejemplo de cada uno.
*Respuesta:* El modelado de comportamiento se enfoca en describir cómo debe funcionar un sistema digital, como en el caso de un contador, donde se especifica que debe contar de 0 a 15. Aquí, no es necesario entrar en detalles sobre los componentes físicos, sino en cómo debe responder el sistema a las señales de entrada. Por otro lado, el modelado de estructura se trata de detallar cómo se ensamblan y conectan los distintos bloques del sistema, como los flip-flops y las puertas lógicas, para construir físicamente el contador. Ambos enfoques son esenciales: el modelado de comportamiento nos ayuda a definir qué queremos que haga el sistema, mientras que el modelado de estructura se encarga de cómo implementar esas funciones en hardware real.

**Pregunta 15:**
*Respuesta:*

**Pregunta 16:** Investigue sobre la tecnología de FPGAs. Describa el funcionamiento de la lógica programable en general, así como los componentes básicos de una.
*Respuesta:* Se conoce como FPGAs, a los sistemas de circuitos integrados que contiene una matriz de bolques lógicos de arquitetura abierta, por lo cual se le permite la configuración, añadir interconexiones programables, memorias e inputs y outputs. Donde resalta su alta programabilidad, ya que se puede programar un número de veces nesesarios hasata alcanzar el estado deseado. Como tambíen permite la modificación si así es requerido. Por ultimo su sistema de interconexiones permite conectar nuevos bloques lógicos o nuevos recuersos adecuados al diseño. Entre sus componentes podemos encontrar sistemas como circuitos Flip-Flop, bloques de entrada y/o salida del sistema, memoria RAM, bloques de multiplicación, relojes, pero se destaca su bloque lógico de configuración conocidos como LUTs, donde se implementa las funciones lógicas de maximo 4 a 5 entradas dependiendo del diseño establecido. Si estudiamos su lógica programable tendremos que esta es establece en el interior del circuito por medio de las estruturas interna de la FPGA, o los anteriormente mencionados LUTs.

**Pregunta 17:** Investigue sobre los proyectos de YOSYS y nextpnr ¿Cuáles son sus funciones como herramientas?
*Respuesta:* En el diseño de FPGAs con VHDL, el proceso generalmente comienza con una herramienta de síntesis como Yosys. Esta herramienta convierte el código VHDL en una netlist de puertas lógicas, que es una representación básica de cómo funcionará el diseño. Luego, se pasa a una herramienta de colocación y enrutamiento, como nextpnr. Aquí es donde se hace el trabajo de ubicar los componentes en la FPGA y conectar todas las señales. La idea es que el diseño no solo funcione bien, sino que también esté optimizado para el hardware específico de la FPGA, asegurando que todo esté bien posicionado y que las conexiones se manejen de manera eficiente.
