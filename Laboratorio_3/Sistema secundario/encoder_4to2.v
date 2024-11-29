
module encoder_4to2 (
    input wire [3:0] columnas,
    output reg [1:0] salida
);
    always @(*) begin
        case (columnas)
            4'b1110: salida = 2'b00;
            4'b1101: salida = 2'b01;
            4'b1011: salida = 2'b10;
            4'b0111: salida = 2'b11;
            default: salida = 2'b00;
        endcase
    end
endmodule
