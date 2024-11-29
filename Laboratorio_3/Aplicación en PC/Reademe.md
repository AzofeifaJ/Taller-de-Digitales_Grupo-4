## Descripción general del módulo UART:
Este módulo implementa un transmisor UART (Universal Asynchronous Receiver-Transmitter) básico. La idea es transmitir una serie de datos (en este caso, los caracteres de la palabra "Hello World!") a través de una señal tx que estará conectada a la línea de transmisión UART.

# Entradas y Salidas:
Entrada:

clk: Este es el reloj del sistema que impulsa el módulo. Usaremos este reloj para controlar el tiempo de transmisión.
Salida:

tx: Esta es la línea de transmisión UART, donde se envían los datos. Esta señal tomará valores de 0 y 1, representando los bits que se transmiten a través de UART.
Declaración de Parámetros y Registros:
Estados de la máquina de estados (FSM):

parameter READY = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;
Estos son los cuatro estados que la máquina de estados finitos (FSM) utilizará para manejar la secuencia de la transmisión UART:

READY: Espera hasta que haya datos para transmitir.
START: Inicia la transmisión de un byte con un bit de inicio.
DATA: Envía los 8 bits del byte.
STOP: Envía el bit de parada (alta) y luego pasa al siguiente byte.
Registros internos:

reg [1:0] present_state = READY; // Estado actual
reg [7:0] store;                 // Almacena el byte de datos a transmitir
reg baud_clk = 0;                // Señal de reloj de baudios
integer baud_count = 0;          // Contador para generar la señal baud_clk
integer bit_index = 0;           // Índice para los bits del byte
integer j = 0;                   // Índice para los datos que se van a transmitir
reg [7:0] data [0:12];           // Arreglo de datos a transmitir (13 elementos)
present_state: Registra el estado actual de la máquina de estados.
store: Almacena el byte de datos que se va a transmitir en el estado DATA.
baud_clk: Es la señal que genera el reloj de baudios para controlar la velocidad de transmisión.
baud_count: Cuenta los ciclos de reloj para generar el baud_clk.
bit_index: Mantiene el índice del bit actual que se está transmitiendo dentro de un byte.
j: Controla el índice del byte que se está transmitiendo dentro del arreglo data.
data: Arreglo que contiene los datos (en formato hexadecimal) a ser transmitidos. En este caso, los datos corresponden a la cadena "Hello World!\r\0".

## Inicialización de los Datos:
initial begin
    data[0] = 8'h48; // H
    data[1] = 8'h65; // e
    data[2] = 8'h6C; // l
    data[3] = 8'h6F; // o
    data[4] = 8'h20; // espacio
    data[5] = 8'h57; // W
    data[6] = 8'h6F; // o
    data[7] = 8'h72; // r
    data[8] = 8'h6C; // l
    data[9] = 8'h64; // d
    data[10] = 8'h21; // !
    data[11] = 8'h0D; // \r (carácter de retorno de carro)
    data[12] = 8'h00; // \0 (carácter nulo, fin de la cadena)
end
Aquí, se inicializa el arreglo data con los valores en formato hexadecimal correspondientes a los caracteres de la cadena "Hello World!\r\0". Estos son los datos que se transmitirán secuencialmente.

## Generación del baud_clk:
always @(posedge clk) begin
    if (baud_count == 325) begin
        baud_clk <= 1;
        baud_count <= 0;
    end else begin
        baud_count <= baud_count + 1;
        baud_clk <= 0;
    end
end
El baud_clk es el reloj de baudios que controla la velocidad a la que se transmiten los datos. Cada vez que el contador baud_count alcanza 325 (que es un valor ajustable según la frecuencia del reloj de entrada y la tasa de baudios deseada), se genera un ciclo de baud_clk alto y se reinicia el contador.
Este reloj de baudios se usará para sincronizar la transmisión de cada bit de datos.
Máquina de Estados para la Transmisión:
El siguiente bloque de código implementa la lógica principal del módulo UART. Usamos la señal baud_clk generada previamente para controlar cuándo debe transmitirse cada bit de los datos.

always @(posedge baud_clk) begin
    case (present_state)
        READY: begin
            if (j < 13) begin
                store <= data[j]; // Cargar el próximo dato en el registro "store"
                tx <= 0;           // Enviar el bit de inicio (transmitir '0' para indicar el inicio)
                bit_index <= 0;    // Comenzar con el primer bit del byte
                present_state <= START; // Cambiar al estado START
            end else begin
                tx <= 1;           // Línea en reposo
            end
        end

        START: begin
            present_state <= DATA; // Pasar al estado DATA para transmitir los bits del byte
        end

        DATA: begin
            if (bit_index < 8) begin
                tx <= store[bit_index]; // Enviar el bit correspondiente del byte
                bit_index <= bit_index + 1; // Avanzar al siguiente bit
            end else begin
                tx <= 1; // Enviar el bit de parada (alta)
                present_state <= STOP; // Cambiar al estado STOP
            end
        end

        STOP: begin
            if (j < 12) begin
                j <= j + 1; // Avanzar al siguiente byte
                present_state <= READY; // Regresar al estado READY para comenzar con el siguiente byte
            end else begin
                j <= 0; // Reiniciar el contador de datos
                present_state <= READY; // Finalizar la transmisión
            end
        end
    endcase
end
Explicación de los estados:
READY:

En este estado, el módulo espera que haya datos disponibles. Si j < 13 (es decir, no hemos terminado de enviar todos los datos), se carga el siguiente byte en el registro store y se prepara para iniciar la transmisión con un bit de inicio (tx <= 0).
Después de cargar el byte, el estado cambia a START.
START:

En este estado, se coloca el bit de inicio y luego se pasa al estado DATA para comenzar a enviar los bits del byte.
DATA:

Aquí, se transmiten los 8 bits del byte almacenado en store. El índice bit_index va de 0 a 7, y en cada ciclo de baud_clk, el siguiente bit del byte se coloca en tx.
Una vez que se han transmitido los 8 bits, se coloca el bit de parada (tx <= 1), y el estado cambia a STOP.
STOP:

En este estado, después de enviar el byte, se avanza al siguiente byte en el arreglo data (incrementando j). Si todos los datos han sido transmitidos, se reinicia el contador j y el proceso termina.
Resumen del flujo de la transmisión:
El módulo comienza esperando datos en el estado READY.
En el estado START, coloca el bit de inicio (tx <= 0).
Luego, en el estado DATA, transmite los bits del byte uno a uno.
Después de transmitir todos los bits del byte, se coloca el bit de parada y el estado cambia a STOP.
Si aún hay más datos por transmitir, el módulo vuelve al estado READY para cargar el siguiente byte y comienza el proceso nuevamente.
Este proceso se repite hasta que todos los bytes en el arreglo data hayan sido transmitidos.

