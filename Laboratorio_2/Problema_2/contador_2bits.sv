module contador_2bits (
    input wire clk,       // Señal de reloj
    input wire reset,     // Señal de reset
    input wire inhibit,   // Inhibe el conteo
    output reg [1:0] q    // Salida de 2 bits
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 2'b00;  // Reinicia el contador
        else if (!inhibit)
            q <= q + 1'b1;  // Incrementa si no está inhibido
    end
endmodule
