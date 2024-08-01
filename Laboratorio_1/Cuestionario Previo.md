# Lab. 1: Introducción al diseño digital con HDL y herramientas EDA de síntesis
## Cuestionario Previo

**Pregunta 1:** Investigue las características de las familias TTL bajo las series 74∗xx en particular las
diferencias entre las variantes ∗ ∈ {L, LS y HC}
*Respuesta:* Se entiende como familia TTL a las conexiones lógicas  transistor transistor, si se especifica la serie 74xx, su principal característica es sus utilización en circuitos digitales ya que estos poseen una modulacion estandar, es decir un consumo de energía modulado, velocidad alta y si en los niveles binarios, su nivel bajo va de los 0 a los 0.8 voltios mientras en un nivel alto va de 2 a 5 voltios. Y a si nos centramos en sus variantes:
En el caso del 74Lxx conocido como bajo poder de TTL, este posee un consumo de energía por debajo de la serie estándar, tiene una de la velocidades más baja entre la familia TTL, pero se compensa con su margen en la asimilación del ruido. 
En el caso de 74LSxx conocido como bajo poder Schottky, su consumo de energía similar a la serie estándar, su velocidad se encuentra en un rango mayor a la serie L pero menor a la serie estándar, el nombre de Schottky se debe a su utilización de diodos, los cuales ayudan con la potencia de velocidad sin afectar el consumo de energía. 
Por último la serie 74HCxx por su nombre alta velocidad de CMOS, este posee uno de los consumos más bajo de la familia TTL, debido a la tecnología CMOS en sus circuitos, produciendo una alta velocidad, compatibilidad con otras series de la familia, por lo cual su utilización es ideal en sistemas modernos que requieran una velocidad y presión alta. 

**Pregunta 2:**
*Respuesta:*

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

**Pregunta 5:**
*Respuesta:*

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

**Pregunta 8:**
*Respuesta:*

**Pregunta 9:**
*Respuesta:*

**Pregunta 10:** Investigue sobre el concepto y el uso de los circuitos pull-up y pull-down en electrónica digital.
*Respuesta:*
Pull-up: Los circuitos conocidos como pull-up son una configuración en las termianles de los transitores, en este caso en la terminal colector y la linea de la fuente de alimentación se comportan como una resitencia, de manera que se mantiene la señal en el estado lógico alto, es decir un uno lógico para la salida, si la fuente de alimentación se descontecta se comportará como un cero lógico pero es poco recomendado, ya que lo que se pretende es evitar ruido y flutaciones en el voltaje. 
Pull-down: si se desea un cero lógico en la salida, se utiliza la configuración pull-down, la cual esta en la terminal emisor conectada a tierra, de esta forma la señal dara como salida una tension baja cuando no está siendo activamente llevada a un estado alto. 

**Pregunta 11:**
*Respuesta:*

**Pregunta 12:**
*Respuesta:*

**Pregunta 13:** Investigue que es el efecto de rebote y típicos circuitos anti-rebote (debouncing circuits)
*Respuesta:* En el caso de un efecto rebote se determina cuando se activa o desativa un interrutor, produciendo una flutación de señales por un periodo de tiempo determinado hasta que dicha señal se estabilice. Si no se evita o se protege el circuito contra este efecto puede proboca lecturas erroneas en la salida o ruido en el sistema. Entre los circuitos anti-rebote podemos encontrar un circuito RC (el más simple), ya que solo necetita de una resitencia y un capacitor para suavizar o delimitar la señal al momento de activarse un interruptor. Para circuitos de mayor nivel se pueden usar un circuito Schmit Trigger, este procesa altas señales en caso de que la flutuación se muy exagerada para el sistema. Y por ultimo en casa de FMS, se utiliza un circuito Flip-Flop tipo D, este almacena la señal del interrutor y elmina el rebote, para luego dar la señal ya estabilizada al sistema. 

**Pregunta 14:**
*Respuesta:*

**Pregunta 15:**
*Respuesta:*

**Pregunta 16:** Investigue sobre la tecnología de FPGAs. Describa el funcionamiento de la lógica programable en general, así como los componentes básicos de una.
*Respuesta:* Se conoce como FPGAs, a los sistemas de circuitos integrados que contiene una matriz de bolques lógicos de arquitetura abierta, por lo cual se le permite la configuración, añadir interconexiones programables, memorias e inputs y outputs. Donde resalta su alta programabilidad, ya que se puede programar un número de veces nesesarios hasata alcanzar el estado deseado. Como tambíen permite la modificación si así es requerido. Por ultimo su sistema de interconexiones permite conectar nuevos bloques lógicos o nuevos recuersos adecuados al diseño. Entre sus componentes podemos encontrar sistemas como circuitos Flip-Flop, bloques de entrada y/o salida del sistema, memoria RAM, bloques de multiplicación, relojes, pero se destaca su bloque lógico de configuración conocidos como LUTs, donde se implementa las funciones lógicas de maximo 4 a 5 entradas dependiendo del diseño establecido. Si estudiamos su lógica programable tendremos que esta es establece en el interior del circuito por medio de las estruturas interna de la FPGA, o los anteriormente mencionados LUTs.

**Pregunta 17:**
*Respuesta:*