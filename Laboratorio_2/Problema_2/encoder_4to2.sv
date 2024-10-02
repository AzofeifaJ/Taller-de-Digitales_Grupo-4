module encoder_4to2_low_inputs (
    input wire [3:0] in,  // Entradas activas bajas desde las columnas del teclado
    output reg [1:0] out  // Salida de 2 bits codificada
);

    always @(*) begin
        case (in)  // Las entradas son activas bajas, por lo que detectamos el 0 en cada columna
            4'b1110: out = 2'b00;  // Columna 0 activa (baja)
            4'b1101: out = 2'b01;  // Columna 1 activa (baja)
            4'b1011: out = 2'b10;  // Columna 2 activa (baja)
            4'b0111: out = 2'b11;  // Columna 3 activa (baja)
            default: out = 2'b00;  // Caso por defecto (sin teclas presionadas)
        endcase
    end
endmodule
