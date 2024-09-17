module topf(
    input  logic clk,        // Entrada de reloj
    input  logic rst_n,      // Botón de reinicio activo en bajo
    input  logic select,     // Botón select
    input  logic EN,         // Señal habilitadora (si se requiere)
    output logic [7:0] leds  // Salida del contador de 8 bits
);

    logic select_debounce;    // Señal antirrebote para `select`
    logic select_sync;        // Señal sincronizada del botón `select`
    logic enable_div;         // Señal de habilitación generada por el divisor de reloj

    // Instancia del módulo antirrebote
    Antirebote debounce_inst (
        .clk(clk),
        .boton_pi(select),
        .rst_n(rst_n),
        .boton_debounce_o(select_debounce)
    );

    // Instancia del módulo sincronizador
    sincronizador sync_inst (
        .clk(clk),
        .button_i(select_debounce),
        .button_o(select_sync)
    );

    // Instancia del módulo contador
    contador count_inst (
        .clk(clk),
        .rst_n(rst_n),
        .select_sync(select_sync),
        .conta_o(leds)
    );

    // Instancia del módulo divisor de reloj
    clock_divider #(
        .DIVISOR(10000)
    ) clock_div_inst (
        .clk(clk),
        .rst_n(rst_n),
        .enable_o(enable_div)
    );

endmodule

module clock_divider #(
    parameter int DIVISOR = 10000  // Valor del divisor
)(
    input  logic clk,         // Señal de reloj
    input  logic rst_n,       // Señal de reinicio activo en bajo
    output logic enable_o     // Señal de habilitación de salida
);

    logic [$clog2(DIVISOR)-1:0] cuenta;  // Contador ajustado al valor del divisor
    logic estado;                        // Estado de la señal de salida

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cuenta <= 0;
            estado <= 0;
        end else begin
            cuenta <= cuenta + 1;
            if (cuenta == DIVISOR-1) begin
                estado <= ~estado;
                cuenta <= 0;
            end
        end
    end

    assign enable_o = estado;

endmodule

module Antirebote #(
    parameter int CUENTA_DB = 5  // Tamaño del contador
)(
    input  logic clk,                 // Señal de reloj
    input  logic boton_pi,            // Entrada del botón sin antirrebote
    input  logic rst_n,               // Señal de reinicio activo en bajo
    output logic boton_debounce_o     // Salida del botón con antirrebote
);

    logic [CUENTA_DB-1:0] cuenta;     // Contador para el antirrebote
    logic boton_pasado;               // Valor anterior del botón
    logic boton_debounceado;          // Valor estabilizado del botón

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cuenta <= 0;
            boton_pasado <= 1'b1;
            boton_debounceado <= 1'b1;
        end else begin
            if (boton_pi != boton_pasado) begin
                cuenta <= cuenta + 1;
                if (cuenta == (2**CUENTA_DB)-1) begin
                    boton_pasado <= boton_pi;
                    boton_debounceado <= boton_pi;
                end
            end else begin
                cuenta <= 0;
                boton_debounceado <= boton_pasado;
            end
        end
    end

    assign boton_debounce_o = boton_debounceado;

endmodule

module sincronizador(
    input  logic clk,        // Señal de reloj
    input  logic button_i,   // Entrada del botón sin sincronizar
    output logic button_o    // Salida sincronizada con pulso
);

    logic button_prev;  // Estado previo sincronizado del botón

    always_ff @(posedge clk) begin
        button_prev <= button_i;
    end

    always_comb begin
        button_o = (button_prev == 1'b0 && button_i == 1'b1) ? 1'b1 : 1'b0;
    end

endmodule

module contador (
    input  logic clk,         // Señal de reloj
    input  logic rst_n,       // Reset activo en bajo
    input  logic select_sync, // Señal sincronizada
    output logic [7:0] conta_o // Salida de conteo de 8 bits
);

    logic [7:0] count_reg;  // Registro del contador

    // Incrementa el contador en el flanco de subida del select_sync
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count_reg <= 8'b0;  // Reinicia el contador en reset
        end else if (select_sync) begin
            count_reg <= count_reg + 1;  // Incrementa en el flanco de subida
        end
    end

    // Asigna el valor del registro a la salida
    assign conta_o = count_reg;

endmodule
