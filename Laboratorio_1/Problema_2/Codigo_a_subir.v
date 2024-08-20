module top (
    input wire clk,                // Entrada de reloj
    input wire [3:0] numero, // Entrada del número (0 a 15)
    output reg [3:0] leds         // Salida del complemento a 2
);
always @(*) begin
   leds = ~numero - 1;                    // Asignar el valor de complemento a leds
end
endmodule