`timescale 1ns / 1ps

module ALU#(
    parameter bits = 16 // Tamaño de los bits
)(
    input logic [bits-1:0] ALUA, // Entrada A
    input logic [bits-1:0] ALUB, // Entrada B
    input logic ALUFlagIn,  // Bandera de selección
    input logic [3:0] ALUControl, // Bandera de control
    output logic ALUFlags, // Bandera de salida (por definir)
    output logic [bits-1:0] ALUResult // Salida de la ALU
    //output logic C, // Bandera del último bit salido

);
    // Opciones de desplazamiento
    logic [bits-1:0] derecha; 
    logic [bits-1:0] izquierda;
    logic carry_out_suma;
    logic carry_out_resta;
    
    // Asignación para desplazamientos
    assign derecha = {ALUFlagIn, ALUA[bits-1:1]};
    assign izquierda = {ALUA[bits-2:0], ALUFlagIn};
    
    // Cálculo de la bandera de carry
    always @(*) begin
        case(ALUControl)
            4'h0: // AND
                ALUResult = ALUA & ALUB; 
            4'h1: // OR
                ALUResult = ALUA | ALUB;
            4'h2: // Suma
                {carry_out_suma, ALUResult} = ALUA + ALUB + ALUFlagIn; 
            4'h3: // Incremento
                {carry_out_suma, ALUResult} = ALUA + 1;
            4'h4: // Decremento
                {carry_out_resta, ALUResult} = ALUA - 1;
            4'h5: // NOT
                ALUResult = ~ALUA;
            4'h6: // Resta
                {carry_out_resta, ALUResult} = ALUA - (ALUB + ALUFlagIn);
            4'h7: // XOR
                ALUResult = ALUA ^ ALUB;
            4'h8: // Desplazamiento a la izquierda
                ALUResult = izquierda;
            4'h9: // Desplazamiento a la derecha
                ALUResult = derecha;
            default: 
                ALUResult = 0; // Valor predeterminado seguro
        endcase
    end
    
    // Asignación de banderas
    always @(*) begin
        case(ALUControl)
            4'h2, 4'h3: // Suma y incremento
                ALUFlags = carry_out_suma; // Bandera de carry para suma
            4'h4, 4'h6: // Decremento y resta
                ALUFlags = carry_out_resta; // Bandera de carry para resta
            default:
                ALUFlags = 0; // Bandera de carry desactivada para otras operaciones
        endcase

        // Bandera C para el último bit salido solo se utiliza para el ejemplo del enunciado
        //C = (ALUControl == 4'h8) ? ALUA[bits-1] : // Desplazamiento a la izquierda
            //(ALUControl == 4'h9) ? ALUA[0] : // Desplazamiento a la derecha
            //0;
    end
    
endmodule
