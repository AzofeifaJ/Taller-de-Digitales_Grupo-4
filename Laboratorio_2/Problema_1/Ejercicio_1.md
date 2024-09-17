###  Ejercicio 1- Diseño antirebotes y sincronizador
1. Escriba los bloques digitales necesarios, en SystemVerilog, para eliminar rebotes y sincronizar
 entradas provenientes de pulsadores e interruptores. Elabore un diagrama de bloques.
2. Incluya en su diseño y diagrama de bloques el siguiente contador de pruebas, el cual le
 será dado. El bloque está sincronizado con el reloj por medio de la entrada clk. Además,
 hace uso de un reset rst activo en bajo. Una señal habilitadora activa en alto, EN,
 permite realizar un incremento cada vez que se da un flanco positivo en esta señal. Una
 señal con rebotes puede causar conteos indeseados.
3.  Genere pruebas en FPGA con un bloque de pruebas que reciba como entrada uno de los
 pulsadores presentes en la tarjeta y lo use como EN de su circuito contador. La señal
 proveniente del botón debe ser procesada por su bloque sincronizador y anti-rebote.
4. En su bloque (módulo) superior (top) haga uso de los LED incluidos en la tarjeta para
 mostrar la salida de su contador
5. Escriba un testbench para su sistema. Tiene que elaborar una prueba con el escenario de
 un pulso contaminado por rebotes y repetirse varias veces. Asegúrese de realizar las mismas
 simulaciones en post-implementación
 6.  Descargue el diseño a la tarjeta FPGA y verifique su diseño. Asegúrese de asignar apropia
damente las señales.

## Planteamiento del problema
Para este caso se diseño un diagrama de bloques de manera que podamos implementar la señal anti rebote que se puede causar en la salida de los leds de la FPGA. Este diagrama consta de 5 etapas, un boton/pulsador, dos entradas para el resety el sincronizador a partir de un clk (reloj), para mantener un frecuencia de flancos positivos a la hora de ejecutar, todo esto se muestra en el siguiente diagrama.
*Diagrama de bloques para el ejercicio 1*
![Maquina de MOORE](https://github.com/AzofeifaJ/Taller-de-Digitales_Grupo-4/blob/main/Laboratorio_2/Imagenes/Ejemplo%20maquna%20de%20MOORE.png)

### Esplicacion del diagrama
Iniciamos con un puldo a dado por un botón o pulsador de manera que este al no tener las etapas nesesarias si reslizamos una cuenta donde cada flanco de subida que el bptón sea pulsado cambie de numero, mejor dicho que aumente 1 en la cuenta del numero binario, como estamos usando un FPGA Tang Nano 9k tenemos 7 leds, es decir el número tiene un espacio de 7 bits. Ahora si no aplicamos las etapas como vemos en el siguiente video se puede presentar el caso de que al apretar rápido no se de una cuenta correcta en los ledes, de esta forma implementamos una etapa para antirebote que en segmentos de 20 ns espere a que la señal se estabilice antes de hacer el cambio para evitar esos saltos de en la cuenta como se ve en el sigueinte codigo. 
Por ulitmo esto se tiene que hacer con un reloj por lo que debemos sincronizar todo el modulo top, esta sincronización se ve en la etapa de sincronizado como se muestra en el siguiente codigo. 

## Codigo de prubas en vivado.
Antes de subir el archivo a la tarjeta Tang Nano 9k, se debe realizar una prueba, está se realizó en Vivado, dicho codigo está  [](). De manera que comprobamos su funcionamiento a través de un banco de pruebas, este se visualiza en el siguiente codigo  [](), al realizar está prueba se debera ver como si variamos los intervalos del pulsación del botón este mantiene una cuenta perfecta de los 15 nuemeros posibles en su formato binario de manera que el module de anti rebote está funcionando de manera perfecta. 
![]()
## Implementación en tarjeta. 
Ya por ultimo esta parte se demostrara en las demas parte del laboratorio donde se debe de incluir dicho funcionamiento a través de un teclado y como este funcionamiento tambien nos ayudara en la sincronización entre la computadora y la tarjeta como en su vecerversa. 
