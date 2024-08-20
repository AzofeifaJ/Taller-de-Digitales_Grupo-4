module top (
    input [3:0] A,
    input [3:0] B,
    input  [1:0]s,
    output [3:0] led
);

assign led = s[0] ? A : B;

endmodule
