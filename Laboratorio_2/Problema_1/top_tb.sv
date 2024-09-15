`timescale 1ns / 1ps

module top_tb;

    // Señales de prueba
    logic clk;
    logic rst_n;  // Reset activo en bajo
    logic select;
    logic EN;     // Señal habilitadora
    logic [7:0] leds; // Ajustado a 8 bits para coincidir con el módulo

    // Instanciar el módulo a probar
    top uut (
        .clk(clk),
        .rst_n(rst_n),
        .select(select),
        .EN(EN),
        .leds(leds)
    );

    // Generar el reloj (periodo de 5 ns)
    initial begin
        clk = 0;
        forever #2.5 clk = ~clk;  // El reloj cambia cada 2.5 ns (5 ns periodo)
    end

    // Generar la señal de botón con fluctuaciones y estabilización
    initial begin
        select = 0;
        EN = 0; // Inicialmente deshabilitado

        // Secuencia de presiones del botón
        repeat (5) begin
            // Ruido antes de presionar el botón
            #20; // Esperar antes de iniciar la secuencia de botón
            
            // Activar habilitador
            EN = 1;
            #5; // Activar EN por un breve periodo

            // Simular el ruido del botón con fluctuaciones
            repeat (10) begin
                #5 select = $random % 2; // Cambios aleatorios entre 0 y 1
            end

            // Establecer el botón en 1 durante un período de 15 ns
            #5 select = 1;
            #10; // Mantener el botón en 1 durante 10 ns

            // Ruido durante el tiempo estable
            repeat (6) begin
                #2 select = $random % 2; // Cambios aleatorios durante el tiempo estable
            end

            // Establecer el botón en 0 durante un período de 15 ns
            #5 select = 0;
            #10; // Mantener el botón en 0 durante 10 ns

            // Ruido durante el tiempo estable
            repeat (6) begin
                #2 select = $random % 2; // Cambios aleatorios durante el tiempo estable
            end

            // Deshabilitar habilitador
            EN = 0;
            #50; // Esperar antes de la siguiente presión
        end

        // Finalizar la simulación
        $finish;
    end

    // Proceso de inicialización y reseteo
    initial begin
        rst_n = 1;
        #10;
        rst_n = 0;
        #10;
        rst_n = 1;
    end

endmodule