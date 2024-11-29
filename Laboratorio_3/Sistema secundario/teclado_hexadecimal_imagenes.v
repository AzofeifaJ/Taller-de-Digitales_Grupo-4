
module teclado_hexadecimal (
    input wire clk,
    input wire reset,
    input wire [3:0] columnas,
    output wire [3:0] filas,
    output wire tx
);
    wire [1:0] contador;
    wire [3:0] columnas_estables;
    wire [1:0] valor_tecla;
    reg [7:0] data_uart;

    // Instanciar módulos
    contador_2bits contador_inst (
        .clk(clk),
        .reset(reset),
        .contador(contador)
    );

    divisor_reloj divisor_inst (
        .clk(clk),
        .reset(reset),
        .clk_div(clk_div)
    );

    encoder_4to2 encoder_inst (
        .columnas(columnas_estables),
        .salida(valor_tecla)
    );

    sincronizador_antirebote antirebote_inst (
        .clk(clk_div),
        .reset(reset),
        .columnas(columnas),
        .columnas_estables(columnas_estables)
    );

    // Generar filas
    assign filas = (contador == 2'b00) ? 4'b1110 :
                   (contador == 2'b01) ? 4'b1101 :
                   (contador == 2'b10) ? 4'b1011 :
                                         4'b0111;

    // Asignación de códigos UART para selección de imágenes
    always @(*) begin
        case (valor_tecla)
            2'b00: data_uart = 8'h01; // Imagen 1
            2'b01: data_uart = 8'h02; // Imagen 2
            2'b10: data_uart = 8'h03; // Imagen 3
            default: data_uart = 8'h00; // Ninguna imagen
        endcase
    end

    // Instancia de UART para transmitir el código de la imagen seleccionada
    uart_tx uart_inst (
        .clk(clk_div),
        .tx(tx)
    );

endmodule
