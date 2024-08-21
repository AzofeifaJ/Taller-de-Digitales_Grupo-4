`timescale 1ns / 1ps
module simple_pwm(
    input logic clk,                      // Reloj de entrada
    input logic [3:0] porcentajeEncendido, // Ciclo de trabajo (valor entre 0 y 15)
    output logic pwm_out                  // Salida PWM
);
    logic [26:0] contador = 0;            // Definimos un contador que pueda almacenar los 100M de ciclos
    logic [26:0] limite_pwm;              // Valor límite para el ciclo de trabajo
        // Calcula el valor límite para el ciclo de trabajo basado en porcentajeEncendido
    always_comb begin
        limite_pwm = (porcentajeEncendido * 6250000); 
    end
    always_ff @(posedge clk) begin// Contamos un ciclo
       contador <= contador + 1;
       // Si el contador es menor al porcentaje de lo que se quiere que encienda el LED,  
       // se enciende el LED, de lo contrario, se apaga el LED. 
  
        // Comparación para determinar el estado del PWM
        if (contador < limite_pwm)// Además, se realiza un ajuste de escala del contador para poder hacer la comparación 
            pwm_out <= 1;
        else
            pwm_out <= 0;

        if (contador >= 100000000)// Reiniciamos el contador cuando llegamos a 1 segundo
            contador <= 0;
    end

endmodule

