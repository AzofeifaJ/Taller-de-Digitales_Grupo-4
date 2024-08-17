## Testbench para el codigo de prueba. 
//////////////////////////////////////////////////////////////////////////////////
// Tecnologico de Costa Rica
//Taller_Digitales_problema2 
// Javier Suarez Sarmiento.
// Grupo 4
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module Complemento_a2_tb;

    // Parámetros de prueba
    logic clk;
    logic rst;
    logic [3:0] interruptor;
    logic [3:0] leds;
    logic [3:0] numero;

    // Instancia del módulo a probar
    Complemento_a2 uut (
        .clk(clk),
        .rst(rst),
        .interruptor(interruptor),
        .leds(leds),
        .numero(numero)
    );

    // Generar el reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Periodo de reloj de 10 ns
    end

    // Proceso de prueba
    initial begin
        // Inicializar
        rst = 0;
        #30;
        interruptor = 0;

        // Activar reset
        rst = 1;
        #50;

        // Contar desde 0 hasta 15
        for (int i = 0; i < 16; i++) begin
            interruptor = i;
            #10; // Esperar un ciclo de reloj
            // Mostrar la salida
            $display("Normal Number: %0d (0x%X), Complemento a 2: %0d (0x%X)",numero,numero, leds, leds);
        end

        // Finalizar la simulación
        $finish;
    end

endmodule