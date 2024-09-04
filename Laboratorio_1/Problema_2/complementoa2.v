module top (
    input wire [3:0] numero,   // Entrada del número (0 a 15)
    output reg [3:0] led       // Salida del complemento a 2
);
    reg [3:0] complemento;
    assign complemento = numero+1;   // Calcular el complemento a 2
    assign led = ~complemento;                 // Asignar el valor de complemento a `led`
endmodule