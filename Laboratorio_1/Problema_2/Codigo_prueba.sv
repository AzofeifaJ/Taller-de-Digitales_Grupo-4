## Codigo de prueba antes de aplicar a la tarjeta version 1. 
//////////////////////////////////////////////////////////////////////////////////
// Tecnologico de Costa Rica
//Taller_Digitales_problema2 
// Javier Suarez Sarmiento.
// Grupo 4
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module contador_luz_led ( // Da por medio de 4 leds su complemento a 2
    input logic clk,             // Entrada de reloj
    input logic rst,             // Botón de reinicio
    input logic [3:0] interruptor, // Entrada del interruptor de 4 bits (0 a 15)
    output logic [3:0] leds,      // Salida del complemento a 2
    output logic [3:0] numero // Salida del número sin la aplicación del complemento a 2, solo para testeo 
);
logic [3:0] complemento; // Solo necesitas el complemento
logic [3:0] contador;     // Contador para el parpadeo de los leds

always_ff @(posedge clk or negedge rst) begin // Contador de parpadeo del LED
    if (!rst)                                 // evita que la tarjeta ilumine correctamente
        contador <= 0;
    else if (contador == 13500000) begin     //tiempo de cada parpadeo
        contador <= 0; 
    end else 
        contador <= contador + 1; 
end

assign complemento = ~interruptor + 4'b0001; // Calcular el complemento a 2
assign leds = complemento; // Asignar el valor de complemento a leds
assign numero = interruptor; // Asignar el número normal a la salida

endmodule