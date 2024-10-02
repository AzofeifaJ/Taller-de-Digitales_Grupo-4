module teclado_hexadecimal (
    input wire clk,              // Señal de reloj
    input wire reset,            // Señal de reset
    input wire [3:0] cols,       // Entradas de las columnas (teclado físico, activas bajas)
    output reg [3:0] hex_out,    // Salida hexadecimal
    output wire [1:0] current_row // Salida de filas activas (hacia el decoder físico)
);

    wire [1:0] col_code;         // Código de la columna detectada
    wire inhibit;                // Señal de inhibición
    wire key_stable;             // Señal de tecla estable
    wire clk_slow;               // Reloj dividido para el barrido
    reg [1:0] row_counter;       // Contador de filas activas

    // Instancia del divisor de reloj
    divisor_reloj divisor (
        .clk_in(clk),
        .reset(reset),
        .clk_out(clk_slow)
    );

    // Instancia del contador de 2 bits para filas
    contador_2bits contador (
        .clk(clk_slow),
        .reset(reset),
        .inhibit(inhibit),
        .q(row_counter)
    );

    // Instancia del encoder con entradas activas bajas
    encoder_4to2_low_inputs encoder (
        .in(cols),
        .out(col_code)
    );

    // Instancia del antirebote
    sincronizador_antirebote debounce (
        .clk(clk),
        .rst(reset),
        .key_input(cols[row_counter]),  // Columna activa (baja)
        .key_stable(key_stable),
        .inhibit(inhibit)
    );

    // Salida de filas activas para el decoder físico
    assign current_row = row_counter;

    // Generación de la salida hexadecimal
    always @(*) begin
        if (key_stable) begin
            case (row_counter)
                2'b00: hex_out = {2'b00, col_code};  // Fila 0
                2'b01: hex_out = {2'b01, col_code};  // Fila 1
                2'b10: hex_out = {2'b10, col_code};  // Fila 2
                2'b11: hex_out = {2'b11, col_code};  // Fila 3
            endcase
        end else begin
            hex_out = 4'b0000;  // No hay tecla presionada
        end
    end
endmodule
