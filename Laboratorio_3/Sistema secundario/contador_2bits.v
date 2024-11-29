
module contador_2bits (
    input wire clk,
    input wire reset,
    output reg [1:0] contador
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            contador <= 2'b00;
        else
            contador <= contador + 1;
    end
endmodule
