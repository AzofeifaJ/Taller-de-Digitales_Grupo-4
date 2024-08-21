## Ejercicio 1. Circuitos digitales discretos.
1. La Figura 1 muestra el diagrama de bloques de un codificador para matrices de 16 teclas.
Este codificador permite extraer un valor de 4 bits en binario natural que representa la
posición de la tecla presionada. En el caso de este laboratorio se diseñarán los bloques
marcados en verde.
![ENDE](https://github.com/user-attachments/assets/a6565e04-d4ea-4d8c-91ac-0d0152d6a226)
2. ¿Qué tipo de bloque combinacional se requiere para cada bloque a implementar? Justifique su respuesta en su diseño. Dise˜ne cada bloque usando ´algebra booleana o mapas de
Karnaugh. Minimice su circuito de tal manera que pueda implementarse con el m´ınimo
núumero de circuitos integrados. Su diseño debe ser simplificado para usar ´unicamente
compuertas NOT, NAND y/o NOR.
3. Implemente sus circuitos en una protoboard junto con un teclado alfanumérico. Para las
conexiones debe basarse en el diagrama de la Figura 1. Para sus pruebas iniciales, haga uso
de botones o un dipswitch en lugar del contador de dos bits y muestre sus salidas en un
grupo de LEDs.

Diseño del Decoder 
Un Decoder tiene N entradas y 2^N salidas. Activa exactamente una de sus salidas dependiendo de la combinación de entradas. En este caso se utilizará un decoder de entradas en bajo, como se muestra en la siguiente tabla de la verdad.

|    IN  |     OUT     |
|--------|-------------|
|  A  B  |  D0 D1 D2 D3|
|--------|-------------|
|  0  0  |  0  1  1  1 |
|  0  1  |  1  0  1  1 |
|  1  0  |  1  1  0  1 |
|  1  1  |  1  1  1  0 |

Sus ecuaciones Booleanas son: D0=~(A+B), D1=~(A+~B), D2=~(~A+B) y D3=~(~A+~B)
Después se implementó en una simulación utilizando el software multisim para comprobar su funcionamiento sólo utilizando 2 NOT y 4 NOR.
![SimuDecoder](https://github.com/user-attachments/assets/bf29fe63-b5bb-4bd6-bacc-782df1aff0a3)

