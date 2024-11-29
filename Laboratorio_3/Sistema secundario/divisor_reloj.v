
module divisor_reloj (
    input wire clk,
    input wire reset,
    output reg clk_div
);
    reg [15:0] count = 0;
    parameter DIVISOR = 50000;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_div <= 0;
        end else if (count == DIVISOR) begin
            count <= 0;
            clk_div <= ~clk_div;
        end else
            count <= count + 1;
    end
endmodule
