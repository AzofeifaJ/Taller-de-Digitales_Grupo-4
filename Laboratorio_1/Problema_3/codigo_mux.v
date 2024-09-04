module top (
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input  [1:0]s,
    output [3:0] led
);

assign led = s[1] ? (s[0] ? D : C) : (s[0] ? B : A);


endmodule
