`timescale 1ns / 1ps
module simple_pwm_tb;
    logic clk;
    logic [3:0] porcentajeEncendido;
    logic pwm_out;
    simple_pwm dut (
        .clk(clk),
        .porcentajeEncendido(porcentajeEncendido),
        .pwm_out(pwm_out)
    );

    // Generador de reloj
    always #5 clk = ~clk;  // Reloj de 10ns para estar dentro de los 100 MHz
    initial begin
        clk = 0;
        porcentajeEncendido = 0;

        //Inicio a 10 porciento de poder
        porcentajeEncendido = 4'd0;
        #10;  

        //aumento de 25 poder
        porcentajeEncendido = 4'd4; 
        #10;  

        // mitad de poder
        porcentajeEncendido = 4'd8;  
        #10;  

        // 75 pociento de poder
        porcentajeEncendido = 4'd12;  
        #10;  

        // el total de los 3.3 v a los leds
        porcentajeEncendido = 4'd15; 
        #10;  

        $finish;
    end

endmodule


