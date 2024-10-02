module sincronizador_antirebote (
    input wire clk,              // Reloj
    input wire rst,              // Reset
    input wire key_input,        // Entrada de la tecla
    output reg key_stable,       // Señal de tecla estable
    output reg inhibit           // Inhibición del contador durante rebote
);

    reg [15:0] debounce_count;  // Contador para el tiempo de rebote
    reg key_last;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            debounce_count <= 16'b0;
            key_stable <= 1'b0;
            key_last <= 1'b0;
            inhibit <= 1'b1;  // Inhibe al inicio
        end else begin
            if (key_input == key_last) begin
                if (debounce_count == 16'hFFFF) begin
                    key_stable <= key_input;  // La señal es estable
                    inhibit <= 1'b0;          // El contador no está inhibido
                end else begin
                    debounce_count <= debounce_count + 1'b1;
                end
            end else begin
                debounce_count <= 16'b0;
                inhibit <= 1'b1;  // Inhibe durante el rebote
            end
            key_last <= key_input;
        end
    end
endmodule
