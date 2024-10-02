module teclado_hexadecimal_fpga_tb();

    // Variables para entradas y salidas
    reg clk;
    reg reset;
    reg [3:0] cols;          // Entradas de columnas (activas bajas)
    wire [3:0] hex_out;      // Salida hexadecimal
    wire [1:0] current_row;  // Salida de filas activas

    // Instancia del módulo principal
    teclado_hexadecimal_fpga uut (
        .clk(clk),
        .reset(reset),
        .cols(cols),
        .hex_out(hex_out),
        .current_row(current_row)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generar un reloj con un periodo de 10 unidades de tiempo
    end

    // Simulación de rebote
    initial begin
        // Inicializar señales
        reset = 1; 
        cols = 4'b1111; // Ninguna tecla presionada
        #20 reset = 0;  // Desactivar reset después de 20 unidades de tiempo

        // Simular la presión de una tecla con rebote en la columna 0
        #30 cols = 4'b1110;  // Simular tecla presionada (columna 0 baja)
        #10 cols = 4'b1111;  // Rebote (tecla soltada temporalmente)
        #10 cols = 4'b1110;  // Tecla presionada nuevamente
        #5  cols = 4'b1111;  // Otro rebote (tecla soltada brevemente)
        #10 cols = 4'b1110;  // Tecla finalmente estable (columna 0 baja)

        #100;
        
        $finish;
    end

endmodule
