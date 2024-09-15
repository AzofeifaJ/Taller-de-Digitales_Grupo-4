`timescale 1ns / 1ps

module top(
    input logic clk,        // Entrada de reloj
    input logic rst_n,      // Botón de reinicio activo en bajo
    input logic select,     // Botón select
    input logic EN,         // Señal habilitadora
    output logic [7:0] leds // Salida del contador de 8 bits
);

    logic select_debounce;    // Salida del antirrebote para `select`
    logic select_sync;        // Salida sincronizada del botón `select`

    // Instancia del módulo antirrebote
    Antirebote debounce_inst (
        .clk(clk),                // Señal de reloj
        .boton_pi(select),        // Entrada del botón `select`
        .boton_debounce_o(select_debounce)  // Salida antirrebote
    );

    // Instancia del módulo sincronizador
    sincronizador sync_inst (
        .clk(clk),               // Señal de reloj
        .button_i(select_debounce),  // Entrada del botón `select` antirrebote
        .button_o(select_sync)  // Salida sincronizada con un pulso
    );

    // Instancia del módulo contador
    contador count_inst (
        .clk(clk),               // Señal de reloj
        .rst_n(rst_n),           // Entrada de reinicio activo en bajo
        .EN(EN),                 // Señal habilitadora
        .conta_o(leds)           // Salida del contador
    );

endmodule

module Antirebote #(
    parameter CUENTA_DB = 5
)(
    input logic clk,                 // Señal de reloj
    input logic boton_pi,            // Entrada del botón sin antirrebote
    output logic boton_debounce_o    // Salida del botón con antirrebote
);

    logic [CUENTA_DB-1:0] cuenta = 0;   // Contador para el tiempo de antirrebote
    logic boton_pasado = 1;             // Valor anterior del botón
    logic boton_debounceado;           // Valor estabilizado del botón

    always_ff @(posedge clk) begin
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
    
    assign boton_debounce_o = boton_debounceado;

endmodule


module sincronizador(
    input logic clk,         // Señal de reloj
    input logic button_i,    // Entrada del botón sin sincronizar
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

`timescale 1ns / 1ps

module sincronizador(
    input logic clk,         // Señal de reloj
    input logic button_i,    // Entrada del botón sin sincronizar
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
    input logic clk,         // Señal de reloj
    input logic rst_n,       // Reset activo en bajo
    input logic EN,         // Señal habilitadora activa en alto
    output logic [7:0] conta_o // Salida de conteo de 8 bits
);

    // Define señales internas
    logic [7:0] count_reg; // Registro para almacenar el valor del contador
    logic boton_prev;      // Estado previo del botón
    logic boton_edge;      // Detecta el flanco de subida del botón

    // Sincroniza la entrada del botón
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count_reg <= 8'b0;  // Reinicia el contador cuando el reset está activo en bajo
        end else if (EN && boton_edge) begin
            count_reg <= count_reg + 1;  // Incrementa el contador en el flanco de subida del botón cuando EN está activo
        end
    end

    // Detecta el flanco de subida del botón
    always_ff @(posedge clk) begin
        boton_prev <= EN;
    end

    always_comb begin
        boton_edge = ~boton_prev & EN;
    end

    // Asigna el valor del registro a la salida
    assign conta_o = count_reg;

endmodule