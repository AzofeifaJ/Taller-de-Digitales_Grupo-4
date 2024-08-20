`timescale 1ns / 1ps
module mux41_tb;
    //localparam int bus_width = 16;  //rango de bits 4
    //localparam int bus_width = 8;  //rango de bits 8
    localparam int bus_width = 16;  //rango de bits 16

    logic [bus_width-1:0] d0, d1, d2, d3; //entradas y su bits
    logic [1:0] s; //selector para el mux
    logic [bus_width-1:0] y; //salida

    // Instancia del multiplexor
     mux4_1 #(.bus_width(bus_width)) mux_inst ( //asigna el rango de bits
        .d0(d0), .d1(d1), .d2(d2), .d3(d3), .s(s), .y(y) //conexiones del mux
    );

    initial begin
        for (int i = 0; i < 50; i++) begin
            d0 = $random; //generar numero dentro del rango de bits
            d1 = $random;
            d2 = $random;
            d3 = $random;

            for (int j = 0; j < 4; j++) begin
                s = j; // Asignar el valor a s
                #20;    // tiempo entre cambio 
                $display("Sel: %b, D0: %b, D1: %b, D2: %b, D3: %b, Y: %b", 
                         s, d0, d1, d2, d3, y);//salida
            end
        end 
    end 
endmodule
