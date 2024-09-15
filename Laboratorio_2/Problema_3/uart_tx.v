module uart_tx (
    input wire clk,              // Reloj principal del sistema
    input wire rst,              // Reset
    input wire [7:0] data_in,    // Dato a transmitir
    input wire tx_start,         // Señal para iniciar la transmisión
    output reg tx,               // Línea TX (hacia afuera)
    output reg tx_busy           // Señal que indica si está ocupado transmitiendo
);

    parameter BAUD_RATE = 9600;
    parameter CLK_FREQ = 27000000;
    localparam BIT_PERIOD = CLK_FREQ / BAUD_RATE;  // Cálculo del periodo de cada bit

    reg [12:0] baud_counter;     // Contador para la tasa de baudios
    reg [3:0] bit_index;         // Índice del bit en transmisión
    reg [9:0] tx_shift_reg;      // Registro de desplazamiento para el dato a transmitir

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1'b1;          // Línea TX inactiva
            tx_busy <= 1'b0;
            baud_counter <= 0;
            bit_index <= 0;
        end else if (tx_start && !tx_busy) begin
            // Iniciar transmisión
            tx_busy <= 1'b1;
            tx_shift_reg <= {1'b1, data_in, 1'b0};  // Bit de parada + datos + bit de inicio
            bit_index <= 0;
            baud_counter <= 0;
        end else if (tx_busy) begin
            if (baud_counter < BIT_PERIOD - 1) begin
                baud_counter <= baud_counter + 1;
            end else begin
                baud_counter <= 0;
                tx <= tx_shift_reg[0];      // Transmitir el bit actual
                tx_shift_reg <= {1'b0, tx_shift_reg[9:1]};  // Desplazar el registro
                bit_index <= bit_index + 1;

                if (bit_index == 9) begin
                    tx_busy <= 1'b0;  // Finalizar la transmisión
                    tx <= 1'b1;       // Línea TX vuelve a estado inactivo
                end
            end
        end
    end
endmodule
