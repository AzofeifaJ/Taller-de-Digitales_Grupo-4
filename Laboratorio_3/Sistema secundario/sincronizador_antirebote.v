
module sincronizador_antirebote (
    input wire clk,
    input wire reset,
    input wire [3:0] columnas,
    output reg [3:0] columnas_estables
);
    reg [15:0] contador = 0;
    reg [3:0] columnas_prev = 4'b1111;
    parameter LIMITE = 50000;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            contador <= 0;
            columnas_estables <= 4'b1111;
        end else if (columnas != columnas_prev) begin
            contador <= 0;
        end else if (contador == LIMITE) begin
            columnas_estables <= columnas;
        end else begin
            contador <= contador + 1;
        end
        columnas_prev <= columnas;
    end
endmodule
