`timescale 1ns / 1ps
module mux4_1#(parameter bus_width = 16)( //parametro maximo de bits en las entradas
    input logic [bus_width-1:0] d0, //se recorta la cantida de bits de acuerdo con el bus_width
    input logic [bus_width-1:0] d1, 
    input logic [bus_width-1:0] d2, 
    input logic [bus_width-1:0] d3, // cuatro entradas parametrizadas
    input logic [1:0] s,        //selector del mux de dos bits
    output logic [bus_width-1:0] y  //salida acorde al tamaño de la entrada
);
    assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0); //logica del mux para selecionar la salida
endmodule
