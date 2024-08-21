`timescale 1ns / 1ps

module top(
    input clk,                      // Reloj de entrada
    input [3:0] porcentajeEncendido, // Ciclo de trabajo (valor entre 0 y 15)
    output reg  led                  // Salida PWM para controlar el LED
);

    reg [23:0] contador = 0;        // Contador de 27 bits para contar ciclos
    reg [23:0] limite_pwm;          // Valor límite para el ciclo de trabajo
    
    // Calcula el valor límite para el ciclo de trabajo basado en porcentajeEncendido
    always @* begin
        limite_pwm = porcentajeEncendido * 6250000; 
    end
    
    // Generación de la señal PWM
    always @(posedge clk) begin
        contador <= contador + 1;
       
        if (contador < limite_pwm)
            led <= 1;               // LED encendido
        else
            led <= 0;               // LED apagado

        if (contador >= 100000000)   // Reinicia el contador cuando llega a 1 segundo
            contador <= 0;
    end

endmodule

