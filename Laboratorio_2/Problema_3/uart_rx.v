module uart_rx (
    input wire clk,              // Reloj principal del sistema
    input wire rst,              // Reset
    input wire rx,               // Línea RX (entrada)
    output reg [7:0] data_out,   // Dato recibido
    output reg rx_done           // Señal que indica que la recepción ha finalizado
);

    parameter BAUD_RATE = 9600;
    parameter CLK_FREQ = 27000000;
    localparam BIT_PERIOD = CLK_FREQ / BAUD_RATE;  // Cálculo del periodo de cada bit

    reg [12:0] baud_counter;     // Contador para la tasa de baudios
    reg [3:0] bit_index;         // Índice del bit recibido
    reg [9:0] rx_shift_reg;      // Registro de desplazamiento para los datos recibidos
    reg rx_active;               // Indicador de recepción activa
    reg [1:0] rx_sync;           // Sincronización para evitar metaestabilidad

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rx_done <= 1'b0;
            rx_active <= 1'b0;
            baud_counter <= 0;
            bit_index <= 0;
            rx_sync <= 2'b11;
        end else begin
            rx_sync <= {rx_sync[0], rx};  // Sincronización de la línea RX

            if (!rx_active && !rx_sync[1]) begin
                // Detectar bit de inicio (borde de bajada)
                rx_active <= 1'b1;
                baud_counter <= BIT_PERIOD / 2;  // Alinearse en el centro del bit
                bit_index <= 0;
            end else if (rx_active) begin
                if (baud_counter < BIT_PERIOD - 1) begin
                    baud_counter <= baud_counter + 1;
                end else begin
                    baud_counter <= 0;
                    rx_shift_reg <= {rx_sync[1], rx_shift_reg[9:1]};  // Leer el bit

                    if (bit_index == 9) begin
                        // Bit de parada
                        rx_active <= 1'b0;
                        rx_done <= 1'b1;
                        data_out <= rx_shift_reg[8:1];  // Guardar el dato recibido
                    end else begin
                        bit_index <= bit_index + 1;
                    end
                end
            end
        end
    end
endmodule
