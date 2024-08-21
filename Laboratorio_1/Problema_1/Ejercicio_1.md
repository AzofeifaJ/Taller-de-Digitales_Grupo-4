### Ejercicio 1. Circuitos digitales discretos.
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

# Diseño del Decoder 
Un Decoder tiene N entradas y 2^N salidas. Activa exactamente una de sus salidas dependiendo de la combinación de entradas. En este caso se utilizará un decoder de salidas en bajo, como se muestra en la siguiente tabla de la verdad.

|    IN  |     OUT     |
|--------|-------------|
|  A  B  |  D0 D1 D2 D3|
|--------|-------------|
|  0  0  |  0   1   1   1 |
|  0  1  |  1   0   1   1 |
|  1  0  |  1   1   0   1 |
|  1  1  |  1   1   1   0 |

Sus ecuaciones Booleanas son: D0=!(A+B), D1=!(A+!B), D2=!(!A+B) y D3=!(!A+!B)
Después se implementó en una simulación utilizando el software multisim para comprobar su funcionamiento sólo utilizando 2 NOT y 4 NOR.
![SimuDecoder](https://github.com/user-attachments/assets/bf29fe63-b5bb-4bd6-bacc-782df1aff0a3)

# Diseño del Encoder 
Un Encoder tiene 2^N entradas y N salidas. Cada entrada representa un valor diferente, y solo una de las entradas está activa en un momento dado. Las salidas binarizan la entrada activa en un código binario de 2 bits, en este caso es de entradas en bajo, como se muestra en la siguiente tabla de la verdad.

|       IN       |  OUT  |
|----------------|-------|
|  D0 D1 D2 D3   |  A  B |
|----------------|-------|
|  0   1   1   1 | 0  0  |
|  1   0   1   1 | 0  1  |
|  1   1   0   1 | 1  0  |
|  1   1   1   0 | 1  1  |

Sus ecuaciones Booleanas son: A=!(D2)+!(D3) y B=!(D1)+!(D3)
Después se implementó en una simulación utilizando el software multisim para comprobar su funcionamiento sólo utilizando 4 NOT y 2 NOR.
![SimuEncoder](https://github.com/user-attachments/assets/049ed2cd-472d-4c33-b8bd-d7643270bc88)
Por último se implementó de forma física en la protoborad.
![Imagen de WhatsApp 2024-08-20 a las 22 07 31_6af4861f](https://github.com/user-attachments/assets/f75d93d9-85ef-46e0-9484-c10100ed86fc)

