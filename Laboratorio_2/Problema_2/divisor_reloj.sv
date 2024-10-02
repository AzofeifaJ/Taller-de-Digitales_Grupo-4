module divisor_reloj (
    input wire clk_in,     // Reloj rápido de la FPGA
    input wire reset,      // Reset
    output reg clk_out     // Reloj dividido
);

    reg [15:0] counter;    // Contador para dividir el reloj

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 16'b0;
            clk_out <= 0;
        end else begin
            if (counter == 50000) begin  // Divide el reloj por 50,000
                counter <= 16'b0;
                clk_out <= ~clk_out;     // Alterna la señal de salida
            end else
                counter <= counter + 1;
        end
    end
endmodule
