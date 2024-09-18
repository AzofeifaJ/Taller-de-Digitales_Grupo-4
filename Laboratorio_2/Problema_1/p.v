module top
(
    input clk,          // Señal de reloj
    input btn_change,   // Botón para generar el número aleatorio
    output [3:0] led    // Salida de LEDs (4 bits para números entre 0 y 15)
);

reg [3:0] random_num = 4'b0001;  // Registro para el número aleatorio de 4 bits
reg btn_change_sync = 0;         // Registro para sincronizar el botón
reg btn_change_last = 0;         // Registro para detectar flanco de subida

// LFSR: Generador de números pseudoaleatorios
always @(posedge clk) begin
    btn_change_sync <= btn_change;   // Sincroniza el botón con el reloj
end

always @(posedge clk) begin
    btn_change_last <= btn_change_sync;  // Guarda el último estado del botón
    if (btn_change_sync && !btn_change_last) begin
        // LFSR de 4 bits: genera nuevos números pseudoaleatorios en cada flanco de subida del botón
        random_num <= {random_num[2:0], random_num[3] ^ random_num[2]};
    end
end

// Asigna el valor del número aleatorio a los LEDs
assign led = random_num;

endmodule

