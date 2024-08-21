`timescale 1ns / 1ps

module ALU_tb;

    // Definición de señales
    logic [3:0] ALUA, ALUB, ALUResult, ALUControl;
    logic ALUFlagIn;
    logic ALUFlags;

    // Instancia del módulo ALU
    ALU #(.bits(4)) dut(
        .ALUA(ALUA),
        .ALUB(ALUB),
        .ALUFlagIn(ALUFlagIn),
        .ALUControl(ALUControl),
        .ALUFlags(ALUFlags),
        .ALUResult(ALUResult)
    );

    // Procedimiento de test
    initial begin 
        // Configuración inicial
        ALUControl = 4'h0;
        ALUA = 4'b1011;
        ALUB = 4'b0111;
        ALUFlagIn = 0;

        // Probar operación AND
        #10;
        assert(ALUResult == (ALUA & ALUB)) else $fatal("Error: AND Operation failed!");

        // Probar operación OR
        ALUControl = 4'h1;
        #10;
        assert(ALUResult == (ALUA | ALUB)) else $fatal("Error: OR Operation failed!");

        // Probar operación Suma
        ALUControl = 4'h2;
        ALUFlagIn = 1;
        #10;
        assert(ALUResult == (ALUA + ALUB + ALUFlagIn)) else $fatal("Error: ADD Operation failed!");

        // Probar incremento
        ALUControl = 4'h3;
        #10;
        assert(ALUResult == (ALUA + 1)) else $fatal("Error: Increment Operation failed!");

        // Probar decremento
        ALUControl = 4'h4;
        #10;
        assert(ALUResult == (ALUA - 1)) else $fatal("Error: Decrement Operation failed!");

        // Probar NOT
        ALUControl = 4'h5;
        #10;
        assert(ALUResult == (~ALUA)) else $fatal("Error: NOT Operation failed!");

        // Probar resta
        ALUControl = 4'h6;
        #10;
        assert(ALUResult == (ALUA - (ALUB + ALUFlagIn))) else $fatal("Error: Subtract Operation failed!");

        // Probar XOR
        ALUControl = 4'h7;
        #10;
        assert(ALUResult == (ALUA ^ ALUB)) else $fatal("Error: XOR Operation failed!");

        // Probar corrimiento a la izquierda
        ALUControl = 4'h8;
        #10;
        assert(ALUResult == (ALUA << 1)) else $fatal("Error: Left Shift Operation failed!");

        // Probar corrimiento a la derecha
        ALUControl = 4'h9;
        #10;
        assert(ALUResult == (ALUA >> 1)) else $fatal("Error: Right Shift Operation failed!");

        // Verificar banderas de carry para suma y resta
        ALUControl = 4'h2; ALUFlagIn = 0;
        #10;
        assert(ALUFlags == (ALUResult != (ALUA + ALUB))) else $fatal("Error: Carry Flag for ADD Operation failed!");

        ALUControl = 4'h6;
        #10;
        assert(ALUFlags == (ALUResult != (ALUA - (ALUB + ALUFlagIn)))) else $fatal("Error: Carry Flag for SUB Operation failed!");

        $display("All tests passed");
        $finish;
    end

endmodule